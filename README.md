# the-bench

Workshop monorepo — physical/bench builds and the shared context behind them.

## Projects

| Project | What it is |
|---|---|
| [`projects/octagonal-led-turn-counter/`](projects/octagonal-led-turn-counter/) | ESP32-S3 LED rim turn counter for an octagonal gaming table |

## Shared layer

| Path | What it holds |
|---|---|
| [`inventory.md`](inventory.md) | Parts bought, consumed and **spare** across every project — check before re-buying |
| [`bench/lore.md`](bench/lore.md) | Hard-won bench facts: flashing, serial, power, failure signatures |
| [`bench/conventions.md`](bench/conventions.md) | How a bench project is laid out |
| [`bench/adding-a-project.md`](bench/adding-a-project.md) | Procedure for bringing another repo in with its history |

## Running things

Each project is self-contained — its own `Makefile`, `.venv` and
`requirements.txt`. The root `Makefile` only forwards:

    make help                     # what this root offers
    make test                     # runs in the default project
    make -C projects/<name> help  # that project's own targets

After a fresh clone, create the project's venv before any Python target:

    cd projects/<name>
    python3 -m venv .venv && .venv/bin/python3 -m pip install -r requirements.txt
