# Coast Runners as a lockstep environment

The original flash code dowloaded from the website is `coast_runners.swf`. Python drives a patched copy through a pinned copy of Ruffle in headless Chromium. Each call advances a fixed number of simulation ticks and then returns the score, the boat's position, and the screen.

## How the SWF was decompiled

The code was decompiled with JPEXS Free Flash Decompiler (FFDec) 26.5.0:

```text
java -jar ffdec-cli.jar -importScript original.swf patched.swf scripts/
```

The source files that were edited live in `coast_runners/as3/`. The rest of the game (`Game.as`, `KeyReader.as`, the boat physics, the level data) was read to find the hooks and was left inside the original SWF.

## How Ruffle is used

Ruffle is the emulator software that allows the code to talk with Flash.

- `load` starts the movie.
- `suspend` and `resume` freeze and unfreeze the player between Python calls, so the boat does not keep moving while Python is deciding.
- Ruffle frees memory only during its own ticks. With `render=None` the player is otherwise never allowed to tick, and memory grows by about 0.5 MB per game tick until Chromium crashes. `host.js` therefore lets Ruffle tick for two animation frames every `RL_TICK_EVERY` calls (10 by default).

etc

## Rendering

The screen is part of the observation. `"fast"` removes particles, the HUD, birds, and planes. `"full"` draws them. `render=None` skips drawing and returns a black image. Writing frames to disk is left to the caller: `env.last_png` returns the latest frame as a PNG.

Birds are hidden in `"fast"` mode but still exist in the simulation: hitting one still changes the score and the boat's motion.

### Image size and color

`image_size=(width, height)` sets the size of `image`. The 640x480 screen is shrunk in the browser (with smoothing) before it is sent to Python. Small images make each step much cheaper, because the pixels no longer have to be base64-encoded and sent through Playwright at full size. `grayscale=True` returns one channel instead of three. Alpha is never sent.

| `image_size`, `grayscale` | `image.shape` |
| --- | --- |
| `(640, 480)`, `False` (default) | `(480, 640, 3)` |
| `(160, 120)`, `False` | `(120, 160, 3)` |
| `(84, 84)`, `True` | `(84, 84, 1)` |

`env.image_shape` holds the shape. `last_png` always writes an RGB PNG, gray included.

### Ruffle backend

`renderer` asks Ruffle for a drawing backend: `"webgl"`, `"wgpu-webgl"`, `"webgpu"`, or `"canvas"`. `None` (the default) lets Ruffle choose. `"canvas"` does not work with this game: Ruffle 0.7.1's Canvas2D backend lacks `BitmapData.draw`, which the game needs to build its sprites, so `reset` fails.

`env.info` reports what was actually used:

- `requested_renderer`: the backend that was asked for.
- `context_types`: the drawing contexts Ruffle created (`"webgl"`, `"webgl2"`, `"2d"`...).
- `gpu`: the WebGL vendor and renderer string. Headless Chromium usually reports `SwiftShader`, a software renderer: the real GPU is not used.

## Performance

Each call fills `env.last_timing` with the duration of each phase, in milliseconds. Nothing is printed: the caller decides what to report.

| Key | Phase |
| --- | --- |
| `call` | game ticks, plus the AS3 `Render()` on the last tick |
| `raf1`, `raf2` | the two `requestAnimationFrame` waits that let Ruffle draw |
| `draw` | copying (and shrinking) Ruffle's canvas |
| `read` | `getImageData` |
| `pack` | RGBA to RGB or gray |
| `b64` | base64 encoding |
| `js_total` | the whole call inside the page |
| `transport` | `evaluate_total - js_total`: Playwright round trip and the image string |
| `python_decode` | base64 decoding and the NumPy array |
| `total` | the whole call, seen from Python |

Measured on one Windows machine with `render="fast"` and `frames=4`, after warm-up:

| Image | ms per step | steps/s |
| --- | --- | --- |
| 640x480 RGB | ~165 | ~6 |
| 160x120 RGB | ~126 | ~8 |
| 84x84 gray | ~120 | ~8 |
| `render=None` | ~45 | ~22 |

With small images, most of the remaining time is the game itself: about 8 ms per tick, and about 45 ms for the AS3 render. The first seconds after launch are slower while Chromium warms up.

### What `observe` returns

`observe` builds a JSON string by hand. Flash Player 10, which this movie targets, has no native `JSON`. The fields are:

| Field | Source |
| --- | --- |
| `score` | `Game.levelScore` |
| `x`, `y` | `player.GetGameObject(0).xpos` / `ypos` |
| `speed` | `player.vehicleSpeed` |
| `lap` | `player.vehicleCurrentLap` |
| `health` | `GameObj.health` on that same body |
| `time` | `Game.race_time / Defs.fps` |
| `finished` | `player.finishedRace` or `Game.levelWon` |
| `failed` | `Game.levelTimedOut`, or the level completed without a win |
| `image` | screen pixels, at `image_size`. Black when `render` is `None` |


## File layout

```text
coast_runners.swf                         original code, not modified
coast_runners/
  __init__.py                             exports CoastRunners, CoastRunnersGym, Observation
  env.py                                  Gym wrapper
  as3/
    Preloader.as                          ad and intro screens of the game are skipped
    Main.as                               ai generated, don't know
    DisplayObjFrame.as                    ai generated, don't know
    SurfaceParticles.as                   ai generated, don't know
  build/
    coast_runners_rl.swf                  patched code loaded by Ruffle
    rollout/                              frames and rollout.mp4 written by the earlier version of example.py
  web/
    index.html                            Ruffle stuff
    host.js                               Ruffle stuff
    ruffle/                               Ruffle stuff
example.py                                random-key benchmark: steps/s, Chromium memory, and phase timings
example_parallel_envs.py                  times 2, 4, and 6 environments in parallel
```

`example.py` uses `psutil` to read Chromium's memory.

## Using it

```python
from coast_runners import CoastRunners

env = CoastRunners(headless=True)                 # fast picture in obs.image
env = CoastRunners(headless=True, render="full")   # particles, HUD, water, birds, planes
env = CoastRunners(headless=True, render=None)     # numbers only, black image
env = CoastRunners(headless=True, image_size=(160, 120))                 # smaller, faster picture
env = CoastRunners(headless=True, image_size=(84, 84), grayscale=True)   # one channel
obs = env.reset(level=0)
obs = env.step(keys=["up", "left"], frames=4)
print(env.last_timing, env.info)
env.close()
```

`obs.image` is `uint8` with shape `env.image_shape`: `(480, 640, 3)` by default. The other fields are `score`, `x`, `y`, `speed`, `lap`, `health`, `finished`, `failed`, and `time`. Keys are any combination of `up`, `down`, `left`, `right`, and `turbo`. An empty list coasts. `frames` defaults to 4.

`CoastRunnersGym` takes the same `image_size` and `grayscale` arguments, and its `observation_space["image"]` follows them.

```python
from coast_runners import CoastRunnersGym

env = CoastRunnersGym(level=0, frames=4, image_size=(160, 120), grayscale=False)
```
