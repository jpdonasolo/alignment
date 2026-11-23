window.rlBooted = false;
window.rlBootError = null;
window.rlLogs = [];

function rlLog(message) {
  window.rlLogs.push(String(message));
  if (window.rlLogs.length > 200) {
    window.rlLogs.shift();
  }
}

const params = new URLSearchParams(location.search);
const swfUrl = params.get("swf") || "/swf/coast_runners_rl.swf";
window.rlRender = params.get("render") === "full" ? "full" : params.get("render") === "off" ? "off" : "fast";
window.rlDraw = window.rlRender !== "off";
// Moteur de rendu demandé à Ruffle : "webgl", "canvas", "wgpu-webgl", "webgpu", ou null (choix de Ruffle).
const RL_RENDERERS = ["webgpu", "wgpu-webgl", "webgl", "canvas"];
window.rlRenderer = RL_RENDERERS.includes(params.get("renderer")) ? params.get("renderer") : null;

// Chaque contexte de dessin créé dans la page est noté ici, pour savoir quel moteur Ruffle utilise vraiment.
window.rlContextTypes = [];
const originalGetContext = HTMLCanvasElement.prototype.getContext;
HTMLCanvasElement.prototype.getContext = function (type, attributes) {
  if (window.rlDraw && (type === "webgl" || type === "webgl2")) {
    attributes = Object.assign({}, attributes, { preserveDrawingBuffer: true });
  }
  const context = originalGetContext.call(this, type, attributes);
  if (context && !this.rlIgnore && !window.rlContextTypes.includes(type)) {
    window.rlContextTypes.push(type);
  }
  return context;
};

// Quel GPU (ou émulateur logiciel) Chromium utilise pour WebGL. "SwiftShader" = rendu logiciel sur CPU.
function rlGpuInfo() {
  const canvas = document.createElement("canvas");
  const gl = originalGetContext.call(canvas, "webgl");
  if (!gl) {
    return { vendor: null, renderer: null, webgl: false };
  }
  const debug = gl.getExtension("WEBGL_debug_renderer_info");
  const info = {
    vendor: debug ? gl.getParameter(debug.UNMASKED_VENDOR_WEBGL) : gl.getParameter(gl.VENDOR),
    renderer: debug ? gl.getParameter(debug.UNMASKED_RENDERER_WEBGL) : gl.getParameter(gl.RENDERER),
    webgl: true,
  };
  const lose = gl.getExtension("WEBGL_lose_context");
  if (lose) {
    lose.loseContext();
  }
  return info;
}

window.rlInfo = () => ({
  requested_renderer: window.rlRenderer,
  context_types: window.rlContextTypes.slice(),
  gpu: rlGpuInfo(),
});

const ruffle = window.RufflePlayer.newest();
const player = ruffle.createPlayer();
player.id = "player";
player.style.width = "640px";
player.style.height = "480px";
document.getElementById("stage").appendChild(player);

function hideChrome() {
  const root = player.shadowRoot;
  if (!root || root.getElementById("rl-hide-chrome")) {
    return;
  }
  const style = document.createElement("style");
  style.id = "rl-hide-chrome";
  style.textContent = [
    "#play-button,",
    "#hardware-acceleration-modal,",
    "#unmute-overlay,",
    "#splash-screen,",
    "#context-menu-overlay {",
    "  display: none !important;",
    "  visibility: hidden !important;",
    "  pointer-events: none !important;",
    "}",
  ].join("\n");
  root.appendChild(style);
}

hideChrome();

player.addEventListener("loadedmetadata", () => rlLog("loadedmetadata"));
player.addEventListener("loadeddata", () => rlLog("loadeddata"));
player.addEventListener("error", (event) => {
  window.rlBootError = String(event.detail || event.message || event);
  rlLog("error " + window.rlBootError);
});

player.ruffle().load({
  url: swfUrl,
  allowScriptAccess: true,
  autoplay: "on",
  unmuteOverlay: "hidden",
  splashScreen: false,
  letterbox: "off",
  maxExecutionDuration: 120,
  forceScale: true,
  scale: "showAll",
  wmode: "opaque",
  ...(window.rlRenderer ? { preferredRenderer: window.rlRenderer } : {}),
});

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function nextFrame() {
  return new Promise((resolve) => requestAnimationFrame(resolve));
}

// Taille et format de l'image renvoyée à Python. Le canvas de Ruffle (640×480) est réduit
// à cette taille par drawImage, puis les pixels sont repliés en RGB (3 octets) ou en gris (1 octet).
function rlSizeParam(name, fallback) {
  const value = parseInt(params.get(name), 10);
  return value > 0 && value <= 4096 ? value : fallback;
}
const RL_IMAGE_WIDTH = rlSizeParam("width", 640);
const RL_IMAGE_HEIGHT = rlSizeParam("height", 480);
const RL_GRAY = params.get("gray") === "1";

const captureCanvas = document.createElement("canvas");
captureCanvas.width = RL_IMAGE_WIDTH;
captureCanvas.height = RL_IMAGE_HEIGHT;
captureCanvas.rlIgnore = true;   // canvas de capture : ne pas le compter comme moteur de Ruffle
const captureContext = captureCanvas.getContext("2d", { willReadFrequently: true });
captureContext.imageSmoothingEnabled = true;
captureContext.imageSmoothingQuality = "medium";   // moyenne plusieurs pixels source lors de la réduction
const packedPixels = new Uint8Array(RL_IMAGE_WIDTH * RL_IMAGE_HEIGHT * (RL_GRAY ? 1 : 3));

// RGBA (4 octets par pixel) -> RGB (3) ou gris (1), pour ne pas transférer le canal alpha inutile.
function packPixels(rgba) {
  const count = RL_IMAGE_WIDTH * RL_IMAGE_HEIGHT;
  if (RL_GRAY) {
    for (let i = 0, j = 0; i < count; i++, j += 4) {
      packedPixels[i] = (77 * rgba[j] + 150 * rgba[j + 1] + 29 * rgba[j + 2]) >> 8;
    }
  } else {
    for (let i = 0, j = 0, k = 0; i < count; i++, j += 4, k += 3) {
      packedPixels[k] = rgba[j];
      packedPixels[k + 1] = rgba[j + 1];
      packedPixels[k + 2] = rgba[j + 2];
    }
  }
  return packedPixels;
}

function bytesToBase64(bytes) {
  let binary = "";
  const chunk = 8192;
  for (let index = 0; index < bytes.length; index += chunk) {
    binary += String.fromCharCode.apply(null, bytes.subarray(index, index + chunk));
  }
  return btoa(binary);
}

function captureFrame() {
  const canvas = player.shadowRoot && player.shadowRoot.querySelector("canvas");
  if (!canvas) {
    throw new Error("ruffle canvas is missing");
  }
  captureContext.drawImage(canvas, 0, 0, RL_IMAGE_WIDTH, RL_IMAGE_HEIGHT);
  return bytesToBase64(packPixels(captureContext.getImageData(0, 0, RL_IMAGE_WIDTH, RL_IMAGE_HEIGHT).data));
}

// En mode render=None, Ruffle n'est jamais laissé tourner entre deux appels, et sa
// mémoire n'est jamais libérée (~0,5 Mo par tick de jeu). On lui laisse faire un tick
// tous les RL_TICK_EVERY appels pour qu'il puisse libérer la mémoire.
const RL_TICK_EVERY = 10;
let rlCallCount = 0;

async function rlCall(name, args) {
  // Chronométrage de chaque phase, en millisecondes. Renvoyé à Python dans `timing`.
  const timing = { call: 0, raf1: 0, raf2: 0, draw: 0, read: 0, pack: 0, b64: 0, js_total: 0 };
  const tStart = performance.now();
  hideChrome();
  const api = player.ruffle();
  if (api.suspended) {
    api.resume();
  }
  let t = performance.now();
  const result = api.callExternalInterface(name, ...args);   // ticks du jeu + Render() AS3
  timing.call = performance.now() - t;
  let image = null;
  if (window.rlDraw || ++rlCallCount % RL_TICK_EVERY === 0) {
    t = performance.now();
    await nextFrame();
    timing.raf1 = performance.now() - t;
    t = performance.now();
    await nextFrame();
    timing.raf2 = performance.now() - t;
  }
  if (window.rlDraw) {
    const canvas = player.shadowRoot && player.shadowRoot.querySelector("canvas");
    if (!canvas) {
      throw new Error("ruffle canvas is missing");
    }
    t = performance.now();
    captureContext.drawImage(canvas, 0, 0, RL_IMAGE_WIDTH, RL_IMAGE_HEIGHT);   // copie + réduction du canvas Ruffle
    timing.draw = performance.now() - t;
    t = performance.now();
    const rgba = captureContext.getImageData(0, 0, RL_IMAGE_WIDTH, RL_IMAGE_HEIGHT).data;   // relecture vers le CPU
    timing.read = performance.now() - t;
    t = performance.now();
    const pixels = packPixels(rgba);                            // RGBA -> RGB ou gris
    timing.pack = performance.now() - t;
    t = performance.now();
    image = bytesToBase64(pixels);                              // encodage base64
    timing.b64 = performance.now() - t;
  }
  api.suspend();
  timing.js_total = performance.now() - tStart;
  if (typeof result !== "string") {
    throw new Error("bridge " + name + " returned " + result);
  }
  return { state: JSON.parse(result), image, timing };
}

window.rlReset = (level) => rlCall("resetLevel", [level | 0]);
window.rlStep = (keys, frames) => rlCall("step", [String(keys) + "|" + (frames | 0)]);

(async () => {
  const api = player.ruffle();
  const started = performance.now();
  while (performance.now() - started < 120000) {
    if (window.rlBootError) {
      return;
    }
    let ready = false;
    try {
      ready = api.callExternalInterface("isReady") === true;
    } catch (err) {
      rlLog(err);
      ready = false;
    }
    if (ready) {
      api.callExternalInterface("takeControl");
      api.callExternalInterface("setRecording", window.rlDraw ? 1 : 0);
      api.callExternalInterface("setRender", window.rlRender === "full" ? "full" : "fast");
      api.suspend();
      window.rlBooted = true;
      rlLog("ready");
      return;
    }
    await sleep(50);
  }
  window.rlBootError = "game did not become ready";
  rlLog(window.rlBootError);
})();
