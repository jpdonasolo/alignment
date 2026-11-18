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

const ruffle = window.RufflePlayer.newest();
if (window.rlDraw) {
  const originalGetContext = HTMLCanvasElement.prototype.getContext;
  HTMLCanvasElement.prototype.getContext = function (type, attributes) {
    if (type === "webgl" || type === "webgl2") {
      attributes = Object.assign({}, attributes, { preserveDrawingBuffer: true });
    }
    return originalGetContext.call(this, type, attributes);
  };
}
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
  wmode: "opaque"
});

function sleep(ms) {
  return new Promise((resolve) => setTimeout(resolve, ms));
}

function nextFrame() {
  return new Promise((resolve) => requestAnimationFrame(resolve));
}

const captureCanvas = document.createElement("canvas");
captureCanvas.width = 640;
captureCanvas.height = 480;
const captureContext = captureCanvas.getContext("2d", { willReadFrequently: true });

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
  captureContext.drawImage(canvas, 0, 0, 640, 480);
  return bytesToBase64(captureContext.getImageData(0, 0, 640, 480).data);
}

async function rlCall(name, args) {
  hideChrome();
  const api = player.ruffle();
  if (api.suspended) {
    api.resume();
  }
  const result = api.callExternalInterface(name, ...args);
  let image = null;
  if (window.rlDraw) {
    await nextFrame();
    await nextFrame();
    image = captureFrame();
  }
  api.suspend();
  if (typeof result !== "string") {
    throw new Error("bridge " + name + " returned " + result);
  }
  return { state: JSON.parse(result), image };
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
