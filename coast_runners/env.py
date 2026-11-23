"""Drive Coast Runners one command at a time and read the screen plus game state."""

from __future__ import annotations

import base64
import json
import mimetypes
import struct
import threading
import time
import zlib
from dataclasses import dataclass
from http.server import SimpleHTTPRequestHandler, ThreadingHTTPServer
from pathlib import Path
from urllib.parse import unquote, urlparse

import gymnasium
import numpy as np
from gymnasium import spaces
from playwright.sync_api import sync_playwright

KEYS = ("up", "down", "left", "right", "turbo")
_PACKAGE = Path(__file__).resolve().parent
_WEB = _PACKAGE / "web"
_SWF = _PACKAGE / "build" / "coast_runners_rl.swf"
_PNG_SIGNATURE = b"\x89PNG\r\n\x1a\n"

mimetypes.add_type("application/wasm", ".wasm")
mimetypes.add_type("application/x-shockwave-flash", ".swf")


@dataclass
class Observation:
    """One lockstep sample from the race."""

    image: np.ndarray
    score: float
    x: float
    y: float
    speed: float
    lap: int
    health: float
    finished: bool
    failed: bool
    time: float


class _QuietHandler(SimpleHTTPRequestHandler):
    """Serve the Ruffle page and the patched movie."""

    def __init__(self, *args, **kwargs):
        super().__init__(*args, directory=str(_WEB), **kwargs)

    def log_message(self, format: str, *args) -> None:
        return

    def do_GET(self) -> None:  # noqa: N802
        path = unquote(urlparse(self.path).path)
        if path == "/swf/coast_runners_rl.swf":
            self._send_file(_SWF, "application/x-shockwave-flash")
            return
        super().do_GET()

    def _send_file(self, file_path: Path, content_type: str) -> None:
        data = file_path.read_bytes()
        self.send_response(200)
        self.send_header("Content-Type", content_type)
        self.send_header("Content-Length", str(len(data)))
        self.end_headers()
        self.wfile.write(data)


def _paeth(left: int, up: int, up_left: int) -> int:
    estimate = left + up - up_left
    left_distance = abs(estimate - left)
    up_distance = abs(estimate - up)
    up_left_distance = abs(estimate - up_left)
    if left_distance <= up_distance and left_distance <= up_left_distance:
        return left
    if up_distance <= up_left_distance:
        return up
    return up_left


def decode_png(data: bytes) -> np.ndarray:
    """Decode an 8-bit RGB or RGBA PNG into a copied ``(height, width, 3)`` array."""

    if not data.startswith(_PNG_SIGNATURE):
        raise ValueError("screenshot is not a PNG")
    position = 8
    width = height = color_type = None
    compressed = []
    while position + 8 <= len(data):
        length = struct.unpack(">I", data[position : position + 4])[0]
        kind = data[position + 4 : position + 8]
        chunk = data[position + 8 : position + 8 + length]
        position += 12 + length
        if kind == b"IHDR":
            width, height, bit_depth, color_type = struct.unpack(">IIBB", chunk[:10])
            if bit_depth != 8 or color_type not in (2, 6):
                raise ValueError(f"unsupported PNG bit depth {bit_depth} color {color_type}")
        elif kind == b"IDAT":
            compressed.append(chunk)
        elif kind == b"IEND":
            break
    if width is None or height is None or color_type is None:
        raise ValueError("PNG is missing a header")
    channels = 3 if color_type == 2 else 4
    stride = width * channels
    raw = zlib.decompress(b"".join(compressed))
    rows = []
    cursor = 0
    previous = bytearray(stride)
    for _ in range(height):
        filter_type = raw[cursor]
        cursor += 1
        row = bytearray(raw[cursor : cursor + stride])
        cursor += stride
        if filter_type == 1:
            for index in range(stride):
                left = row[index - channels] if index >= channels else 0
                row[index] = (row[index] + left) & 255
        elif filter_type == 2:
            for index in range(stride):
                row[index] = (row[index] + previous[index]) & 255
        elif filter_type == 3:
            for index in range(stride):
                left = row[index - channels] if index >= channels else 0
                row[index] = (row[index] + ((left + previous[index]) // 2)) & 255
        elif filter_type == 4:
            for index in range(stride):
                left = row[index - channels] if index >= channels else 0
                up_left = previous[index - channels] if index >= channels else 0
                row[index] = (row[index] + _paeth(left, previous[index], up_left)) & 255
        elif filter_type != 0:
            raise ValueError(f"unsupported PNG filter {filter_type}")
        previous = row
        rows.append(row)
    image = np.frombuffer(b"".join(rows), dtype=np.uint8).reshape(height, width, channels)
    if channels == 4:
        image = image[:, :, :3]
    return np.array(image, copy=True)


def _png_chunk(tag: bytes, data: bytes) -> bytes:
    return struct.pack(">I", len(data)) + tag + data + struct.pack(">I", zlib.crc32(tag + data) & 0xFFFFFFFF)


def encode_png(image: np.ndarray) -> bytes:
    """Encode a ``(height, width, 3)`` uint8 image as a PNG."""

    height, width, channels = image.shape
    if channels != 3:
        raise ValueError(f"expected RGB image, got {image.shape}")
    raw = np.empty((height, width * 3 + 1), dtype=np.uint8)
    raw[:, 0] = 0
    raw[:, 1:] = np.ascontiguousarray(image).reshape(height, width * 3)
    header = struct.pack(">IIBBBBB", width, height, 8, 2, 0, 0, 0)
    return b"".join(
        (
            _PNG_SIGNATURE,
            _png_chunk(b"IHDR", header),
            _png_chunk(b"IDAT", zlib.compress(raw.tobytes(), 1)),
            _png_chunk(b"IEND", b""),
        )
    )


class CoastRunners:
    """Lockstep Coast Runners session.

    ``reset`` starts a race and returns the first controllable frame.
    ``step`` holds the given keys for ``frames`` simulation ticks, then
    returns the game's score, position, speed, lap, and health.
    The movie stays suspended between calls.

    ``render`` chooses the picture in ``image``. ``"fast"`` skips particles,
    the water shimmer, the HUD, birds, and planes. ``"full"`` draws them.
    ``None`` does not draw: ``image`` is black and ``last_png`` stays empty.
    Saving frames to disk is left to the caller.

    ``renderer`` asks Ruffle for a drawing backend: ``"webgl"``, ``"canvas"``,
    ``"wgpu-webgl"`` or ``"webgpu"``. ``None`` lets Ruffle choose. ``"canvas"``
    does not work with this game: Ruffle's Canvas2D backend lacks
    ``BitmapData.draw``. ``info`` reports the backend actually used and the WebGL GPU.

    ``image_size`` is ``(width, height)`` of ``image``. The 640x480 screen is
    shrunk in the browser before transfer, which makes each step cheaper.
    ``grayscale=True`` returns one channel: ``image`` has shape ``(height, width, 1)``
    instead of ``(height, width, 3)``.
    """

    def __init__(
        self,
        headless: bool = True,
        render: str | None = "fast",
        renderer: str | None = None,
        image_size: tuple[int, int] = (640, 480),
        grayscale: bool = False,
    ) -> None:
        if render not in ("fast", "full", None):
            raise ValueError(f"render must be 'fast', 'full', or None, got {render!r}")
        if renderer not in ("webgpu", "wgpu-webgl", "webgl", "canvas", None):
            raise ValueError(f"renderer must be 'webgpu', 'wgpu-webgl', 'webgl', 'canvas', or None, got {renderer!r}")
        width, height = (int(value) for value in image_size)
        if not (0 < width <= 640 and 0 < height <= 480):
            raise ValueError(f"image_size must be (width, height) within (640, 480), got {image_size!r}")
        if not _SWF.is_file():
            raise FileNotFoundError(f"patched movie not found: {_SWF}")
        self.headless = headless
        self.render = render
        self.image_size = (width, height)
        self.grayscale = bool(grayscale)
        self.image_shape = (height, width, 1 if self.grayscale else 3)
        self._frame: np.ndarray | None = None
        self._last_png: bytes | None = None
        self.last_timing: dict[str, float] = {}
        self._blank = np.zeros(self.image_shape, dtype=np.uint8)
        self._server = ThreadingHTTPServer(("127.0.0.1", 0), _QuietHandler)
        self._thread = threading.Thread(target=self._server.serve_forever, daemon=True)
        self._thread.start()
        port = self._server.server_address[1]
        self._playwright = sync_playwright().start()
        self._browser = self._playwright.chromium.launch(headless=headless)
        self._context = self._browser.new_context(
            viewport={"width": 640, "height": 480},
            device_scale_factor=1,
        )
        self._page = self._context.new_page()
        self._logs: list[str] = []
        self._page.on("console", lambda message: self._logs.append(f"{message.type}: {message.text}"))
        self._page.on("pageerror", lambda error: self._logs.append(f"pageerror: {error}"))
        mode = "off" if render is None else render
        page = f"/index.html?render={mode}"
        if renderer is not None:
            page += f"&renderer={renderer}"
        page += f"&width={width}&height={height}&gray={1 if self.grayscale else 0}"
        self._page.goto(f"http://127.0.0.1:{port}{page}", wait_until="domcontentloaded", timeout=60000)
        self._page.wait_for_function("() => window.rlBooted || window.rlBootError", timeout=120000)
        error = self._page.evaluate("window.rlBootError")
        if error:
            detail = self._page.evaluate("window.rlLogs")
            console = list(self._logs)
            try:
                self._page.screenshot(path="/tmp/coast-boot.png")
            except Exception:
                pass
            self.close()
            tail = "\n".join(console[-40:])
            raise RuntimeError(f"{error}; logs={detail}\n{tail}")
        # Moteur demandé, types de contextes réellement créés par Ruffle ("webgl", "webgl2", "2d"...)
        # et GPU vu par WebGL (gpu["renderer"] contient "SwiftShader" si le rendu est logiciel).
        self.info: dict = self._page.evaluate("window.rlInfo()")

    @property
    def last_png(self) -> bytes:
        """PNG of the latest rendered frame. Encoded on first read."""

        if self._frame is None:
            return b""
        if self._last_png is None:
            frame = self._frame if self._frame.shape[2] == 3 else np.repeat(self._frame, 3, axis=2)
            self._last_png = encode_png(frame)
        return self._last_png

    def reset(self, level: int = 0) -> Observation:
        """Start ``level`` and return the observation at the start of the race."""

        return self._call("(level) => window.rlReset(level)", int(level))

    def step(self, keys: list[str] | tuple[str, ...] | None = None, frames: int = 4) -> Observation:
        """Hold ``keys`` for ``frames`` ticks and return the new observation."""

        selected = list(keys or [])
        unknown = [key for key in selected if key not in KEYS]
        if unknown:
            raise ValueError(f"unknown keys {unknown}; expected {KEYS}")
        if frames < 1:
            raise ValueError("frames must be at least 1")
        return self._call(
            "([keys, frames]) => window.rlStep(keys, frames)",
            [",".join(selected), int(frames)],
        )

    def _call(self, expression: str, arg) -> Observation:
        started = time.perf_counter()
        payload = self._page.evaluate(expression, arg)
        returned = time.perf_counter()
        observation = self._observation(payload["state"], payload["image"])
        finished = time.perf_counter()
        # Durées en ms de chaque phase du dernier appel (step ou reset). Rien n'est affiché ici.
        timing = dict(payload.get("timing") or {})
        timing["evaluate_total"] = (returned - started) * 1000
        timing["transport"] = timing["evaluate_total"] - timing.get("js_total", 0.0)
        timing["python_decode"] = (finished - returned) * 1000
        timing["total"] = (finished - started) * 1000
        self.last_timing = timing
        return observation

    def close(self) -> None:
        browser = getattr(self, "_browser", None)
        playwright = getattr(self, "_playwright", None)
        server = getattr(self, "_server", None)
        if browser is not None:
            browser.close()
            self._browser = None
        if playwright is not None:
            playwright.stop()
            self._playwright = None
        if server is not None:
            self._server.shutdown()
            self._server = None

    def __enter__(self) -> CoastRunners:
        return self

    def __exit__(self, *exc) -> None:
        self.close()

    def _observation(self, state: dict, image_b64: str | None) -> Observation:
        if self.render is None:
            image = self._blank
            self._frame = None
            self._last_png = None
        else:
            if not image_b64:
                raise RuntimeError("rendering was requested but the page returned no frame")
            raw = base64.b64decode(image_b64)
            flat = np.frombuffer(raw, dtype=np.uint8)
            expected = self.image_shape[0] * self.image_shape[1] * self.image_shape[2]
            if flat.size != expected:
                raise RuntimeError(f"expected a {self.image_shape} frame ({expected} bytes), got {flat.size} bytes")
            # Déjà en RGB ou en gris. copy() rend le tableau modifiable (frombuffer sur bytes est en lecture seule).
            image = flat.reshape(self.image_shape).copy()
            self._frame = image
            self._last_png = None
        return Observation(
            image=image,
            score=float(state["score"]),
            x=float(state["x"]),
            y=float(state["y"]),
            speed=float(state["speed"]),
            lap=int(state["lap"]),
            health=float(state["health"]),
            finished=bool(state["finished"]),
            failed=bool(state["failed"]),
            time=float(state["time"]),
        )


class CoastRunnersGym(gymnasium.Env):
    """Gymnasium wrapper. Reward is the change in score. The episode ends when the race is finished or failed.

    ``render`` is ``"fast"``, ``"full"``, or ``None``. ``render_mode`` does not decide whether the observation has pixels.
    """

    metadata = {"render_modes": ["rgb_array"]}

    def __init__(
        self,
        level: int = 0,
        frames: int = 4,
        headless: bool = True,
        render: str | None = "fast",
        render_mode: str | None = None,
        image_size: tuple[int, int] = (640, 480),
        grayscale: bool = False,
    ) -> None:
        super().__init__()
        self.render_mode = render_mode
        self._level = level
        self._frames = frames
        self._env = CoastRunners(headless=headless, render=render, image_size=image_size, grayscale=grayscale)
        self._score = 0.0
        self._image: np.ndarray | None = None
        number = spaces.Box(low=-np.inf, high=np.inf, shape=(), dtype=np.float64)
        flag = spaces.Box(low=0.0, high=1.0, shape=(), dtype=np.float64)
        self.observation_space = spaces.Dict(
            {
                "image": spaces.Box(low=0, high=255, shape=self._env.image_shape, dtype=np.uint8),
                "score": number,
                "x": number,
                "y": number,
                "speed": number,
                "lap": number,
                "health": number,
                "finished": flag,
                "failed": flag,
                "time": number,
            }
        )
        self.action_space = spaces.MultiBinary(5)

    def reset(self, *, seed: int | None = None, options: dict | None = None):
        super().reset(seed=seed)
        level = self._level
        if options and "level" in options:
            level = int(options["level"])
        observation = self._env.reset(level=level)
        self._score = observation.score
        return self._pack(observation), {}

    def step(self, action):
        values = np.asarray(action, dtype=np.int64).reshape(-1)
        if values.shape != (len(KEYS),):
            raise ValueError(f"action must have {len(KEYS)} binary values in order {KEYS}")
        keys = [name for name, bit in zip(KEYS, values) if bit]
        observation = self._env.step(keys, frames=self._frames)
        reward = float(observation.score - self._score)
        self._score = observation.score
        terminated = bool(observation.finished or observation.failed)
        return self._pack(observation), reward, terminated, False, {}

    def render(self):
        return None if self._image is None else self._image.copy()

    def close(self) -> None:
        if self._env is not None:
            self._env.close()
            self._env = None

    def _pack(self, observation: Observation) -> dict:
        self._image = observation.image
        return {
            "image": observation.image,
            "score": np.float64(observation.score),
            "x": np.float64(observation.x),
            "y": np.float64(observation.y),
            "speed": np.float64(observation.speed),
            "lap": np.float64(observation.lap),
            "health": np.float64(observation.health),
            "finished": np.float64(observation.finished),
            "failed": np.float64(observation.failed),
            "time": np.float64(observation.time),
        }
