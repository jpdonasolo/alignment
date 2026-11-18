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

etc

## Rendering

The screen is part of the observation. `"fast"` removes particles, the HUD, birds, and planes. `"full"` draws them. `render=None` skips drawing and returns a black image. Writing frames to disk is separate: `example.py` does that only when `save` is true.

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
| `image` | screen pixels. Black when `render` is `None` |


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
    rollout/                              individual frames and concatanated video rollout.mp4 from example.py
  web/
    index.html                            Ruffle stuff
    host.js                               Ruffle stuff
    ruffle/                               Ruffle stuff
example.py                                random rollout; save flag writes the video
```

## Using it

```python
from coast_runners import CoastRunners

env = CoastRunners(headless=True)                 # fast picture in obs.image
env = CoastRunners(headless=True, render="full")   # particles, HUD, water, birds, planes
env = CoastRunners(headless=True, render=None)     # numbers only, black image
obs = env.reset(level=0)
obs = env.step(keys=["up", "left"], frames=4)
env.close()
```

`obs.image` is `uint8` with shape `(480, 640, 3)`. The other fields are `score`, `x`, `y`, `speed`, `lap`, `health`, `finished`, `failed`, and `time`. Keys are any combination of `up`, `down`, `left`, `right`, and `turbo`. An empty list coasts. `frames` defaults to 4.
