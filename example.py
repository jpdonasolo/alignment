"""Drive Coast Runners with random keys, save every frame, and encode a video."""

import subprocess
from pathlib import Path

import numpy as np

from coast_runners.env import KEYS, CoastRunners
import time
import os
import psutil
from collections import defaultdict

FRAMES = 4
RENDER = "fast"          # None pour tester l'accumulation, "fast" pour comparer
RENDERER = None         # moteur de Ruffle : None (choix de Ruffle) ou "webgl" ("canvas" ne marche pas avec ce jeu)
IMAGE_SIZE = (84, 84)  # (largeur, hauteur) de l'image renvoyée ; (640, 480) = taille d'origine
GRAYSCALE = True        # True : un seul canal (gris) au lieu de RGB
REPORT_EVERY = 25
STEPS=300

def chromium_memory_mb() -> tuple[float, float]:
    """Mémoire (RSS) de tous les processus Chromium lancés par ce script : total et plus gros processus."""
    total, biggest = 0, 0
    for proc in psutil.Process(os.getpid()).children(recursive=True):
        try:
            name = proc.name().lower()
            if "chrome" in name or "headless" in name:
                rss = proc.memory_info().rss
                total += rss
                biggest = max(biggest, rss)
        except psutil.NoSuchProcess:
            pass
    return total / 2**20, biggest / 2**20


def main() -> None:
    rng = np.random.default_rng(0)
    with CoastRunners(headless=True, render=RENDER, renderer=RENDERER, image_size=IMAGE_SIZE, grayscale=GRAYSCALE) as env:
        gpu = env.info["gpu"]
        print(f"moteur demandé : {env.info['requested_renderer']}  |  contextes créés par Ruffle : {env.info['context_types']}", flush=True)
        print(f"GPU WebGL : {gpu['vendor']} / {gpu['renderer']}", flush=True)
        timings = defaultdict(list)
        rng = np.random.default_rng(0)          # mêmes touches à chaque épisode
        observation = env.reset(level=0)        # un seul reset, hors chronomètre
        total0, big0 = chromium_memory_mb()
        print(f"départ : chromium total={total0:.0f} Mo, plus gros processus={big0:.0f} Mo", flush=True)
        timings.clear()
        window_start = time.perf_counter()      # le chronomètre démarre juste avant les steps
        try:
            for step in range(STEPS):
                held = [key for key, bit in zip(KEYS, rng.integers(0, 2, size=len(KEYS))) if bit]
                observation = env.step(held, frames=FRAMES)
                for key, value in env.last_timing.items():
                    timings[key].append(value)
                if (step + 1) % REPORT_EVERY == 0:
                    now = time.perf_counter()
                    rate = REPORT_EVERY / (now - window_start)   # vitesse sur les 25 derniers steps, pas cumulée
                    order = ["call", "raf1", "raf2", "draw", "read", "pack", "b64", "transport", "python_decode", "total"]
                    print("  ms moyens : " + "  ".join(f"{k}={sum(timings[k]) / len(timings[k]):.1f}" for k in order), flush=True)
                    timings.clear()
                    total, big = chromium_memory_mb()
                    print(
                        f"step {step + 1:4d}  {rate:5.1f} steps/s  "
                        f"chromium total={total:6.0f} Mo  plus gros={big:6.0f} Mo  "
                        f"time_jeu={observation.time:6.1f}s",
                        flush=True,
                    )
                    window_start = time.perf_counter()   # repart après les mesures et les print
                if observation.finished or observation.failed:
                    print(f"course terminée au step {step + 1}, reset", flush=True)
                    observation = env.reset(level=0)
        except Exception as error:
            total, big = chromium_memory_mb()
            print(f"\nCRASH au step {step + 1} : {error}", flush=True)
            print(f"mémoire au crash : total={total:.0f} Mo, plus gros={big:.0f} Mo", flush=True)
            print("--- derniers logs du navigateur ---", flush=True)
            for line in env._logs[-20:]:
                print(line, flush=True)

if __name__ == "__main__":
    main()
