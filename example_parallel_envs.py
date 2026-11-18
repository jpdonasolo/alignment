"""Time Coast Runners at 2, 4, and 6 environments in parallel.

Same random-key loop as example.py: 300 steps, restart when the race ends.
Rendering is the fast path and frames are not written. Each width is one run.
"""

import multiprocessing as mp
import time

import numpy as np

from coast_runners.env import KEYS, CoastRunners

STEPS = 300
WIDTHS = (2, 4, 6)


def rollout(index: int, seed: int) -> dict:
    rng = np.random.default_rng(seed)
    started = time.perf_counter()
    score = 0.0
    with CoastRunners(headless=True, render="fast") as env:
        observation = env.reset(level=0)
        for step in range(STEPS):
            held = [key for key, bit in zip(KEYS, rng.integers(0, 2, size=len(KEYS))) if bit]
            observation = env.step(held)
            score = observation.score
            if step % 50 == 0 or step + 1 == STEPS:
                print(
                    f"env {index:02d}  {step + 1:4d}/{STEPS}  score={observation.score:.0f}  "
                    f"x={observation.x:.0f}  y={observation.y:.0f}  speed={observation.speed:.1f}",
                    flush=True,
                )
            if observation.finished or observation.failed:
                print(f"env {index:02d}  race ended at step {step + 1}, restarting", flush=True)
                observation = env.reset(level=0)
                score = observation.score
    elapsed = time.perf_counter() - started
    print(f"env {index:02d}  done in {elapsed:.2f}s  score={score:.0f}", flush=True)
    return {"index": index, "seconds": elapsed, "score": score}


def run_width(n_envs: int, seeds: np.ndarray) -> dict:
    print(f"starting {n_envs} envs, {STEPS} steps, render=fast, no frames", flush=True)
    wall_start = time.perf_counter()
    with mp.Pool(n_envs) as pool:
        results = pool.starmap(rollout, [(i, int(seeds[i])) for i in range(n_envs)])
    wall = time.perf_counter() - wall_start
    seconds = np.array([row["seconds"] for row in results])
    total_steps = n_envs * STEPS
    print(
        f"n={n_envs}  wall {wall:.2f}s  "
        f"per env min {seconds.min():.2f}s  mean {seconds.mean():.2f}s  max {seconds.max():.2f}s  "
        f"steps/s {total_steps / wall:.1f}",
        flush=True,
    )
    return {
        "n_envs": n_envs,
        "wall": wall,
        "mean": float(seconds.mean()),
        "max": float(seconds.max()),
        "steps_per_s": total_steps / wall,
    }


def main() -> None:
    mp.set_start_method("spawn")
    rng = np.random.default_rng(0)
    summaries = []
    for n_envs in WIDTHS:
        seeds = rng.integers(0, 2**31 - 1, size=n_envs)
        summaries.append(run_width(n_envs, seeds))
    print(flush=True)
    print(f"{'envs':>4}  {'wall_s':>8}  {'mean_s':>8}  {'max_s':>8}  {'steps/s':>8}", flush=True)
    for row in summaries:
        print(
            f"{row['n_envs']:4d}  {row['wall']:8.2f}  {row['mean']:8.2f}  {row['max']:8.2f}  {row['steps_per_s']:8.1f}",
            flush=True,
        )


if __name__ == "__main__":
    main()
