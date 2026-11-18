"""Drive Coast Runners with random keys, save every frame, and encode a video."""

import subprocess
from pathlib import Path

import numpy as np

from coast_runners.env import KEYS, CoastRunners

STEPS = 300
ROOT = Path(__file__).resolve().parent
FRAME_DIR = ROOT / "coast_runners" / "build" / "rollout" / "frames"
VIDEO = ROOT / "coast_runners" / "build" / "rollout.mp4"


def main() -> None:
    save = False
    render = "full"
    rng = np.random.default_rng()
    if save:
        FRAME_DIR.mkdir(parents=True, exist_ok=True)
        for old in FRAME_DIR.glob("*.png"):
            old.unlink()
    with CoastRunners(headless=True, render=render) as env:
        observation = env.reset(level=0)
        for step in range(STEPS):
            held = [key for key, bit in zip(KEYS, rng.integers(0, 2, size=len(KEYS))) if bit]
            observation = env.step(held)
            if save:
                if not env.last_png:
                    raise RuntimeError("saving was requested but the frame is empty")
                (FRAME_DIR / f"{step:04d}.png").write_bytes(env.last_png)
            if step % 50 == 0 or step + 1 == STEPS:
                print(
                    f"{step + 1:4d}/{STEPS}  score={observation.score:.0f}  "
                    f"x={observation.x:.0f}  y={observation.y:.0f}  img.shape={observation.image.shape}  "
                    f"speed={observation.speed:.1f}  keys={','.join(held) or '-'}",
                    flush=True,
                )
            if observation.finished or observation.failed:
                print(f"race ended at step {step + 1}, restarting", flush=True)
                observation = env.reset(level=0)
    if not save:
        print("finished without saving", flush=True)
        return
    subprocess.run(
        [
            "ffmpeg",
            "-y",
            "-framerate",
            "12",
            "-i",
            str(FRAME_DIR / "%04d.png"),
            "-c:v",
            "libx264",
            "-pix_fmt",
            "yuv420p",
            str(VIDEO),
        ],
        check=True,
    )
    print(f"wrote {VIDEO}", flush=True)


if __name__ == "__main__":
    main()
