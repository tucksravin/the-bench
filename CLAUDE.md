# the-bench

Monorepo for physical/bench builds. Every project under `projects/` is
self-contained — its own `Makefile`, `.venv`, `requirements.txt`, tests and
docs. This root holds only what is genuinely shared across builds.

## Projects

| Project | What it is |
|---|---|
| `projects/octagonal-led-turn-counter/` | ESP32-S3 LED rim turn counter for an octagonal gaming table — 8 piezo seats, WS2812B rim, Wi-Fi phone control |

`ls projects/` is the live index. Read a project's own `README.md` before
working in it.

## Don't run commands that touch the board

The user drives anything that reaches the physical bench. The line is whether
the command touches hardware on the table, not whether it is Bash.

- **Never run:** `make flash-*`, `make ota`, `make monitor`, `make ping`,
  `make record`, `make map-piezos`, pyserial probes, HTTP calls to the board.
- **Fine to run:** git, file moves, `make test` (pytest, no board),
  `make compile-all` / `arduino-cli compile` (toolchain only), `make pdf`.

Verify what you can on the laptop, then hand over the board-touching step:
"flash with `make flash-turn` and tell me what the serial says."

Board HTTP/ping additionally needs a sandbox with LAN access — the plain Bash
tool's sandbox blocks outbound LAN **silently**, which looks exactly like a
dead board. See `bench/lore.md`.

## Specs and plans go with their project

The superpowers skills default to a repo-root `docs/superpowers/{specs,plans}/`.
In this repo that is wrong for project work — write to
`projects/<name>/docs/superpowers/{specs,plans}/` instead, so specs stay beside
the code they describe. The superpowers `writing-plans` skill sanctions this
override explicitly — right under its "Save plans to:" default it says
"(User preferences for plan location override this default)" — so treat this
as the user preference it defers to, not a house rule fighting the skill.

The bench-root `docs/superpowers/` is reserved for genuinely cross-project
work — the monorepo itself, shared tooling, bench-wide conventions.

## Running project commands

Bench scripts are **cwd-sensitive**: `make_qr.py` and `record_piezos.py` write
to paths relative to the working directory. Always drive them through make, from
the bench root or the project directory — never by path from the root, which
would scatter project artifacts into the monorepo root where the project's
`.gitignore` cannot reach them.

    make test                    # forwards to the default project
    make PROJ=<name> test        # another project
    make -C projects/<name> test # explicit; always works

After a fresh clone there is no `.venv`. Create one before any Python target:

    cd projects/<name> && python3 -m venv .venv \
      && .venv/bin/python3 -m pip install -r requirements.txt

## Keep the inventory current

`inventory.md` at this root tracks parts bought, consumed, and **spare** across
every bench project — the point is knowing surplus (100-pack resistors, the
530-pc JST kit, leftover WS2812B strip) so a new project doesn't re-buy what is
already in a drawer. When parts are bought, consumed, or drawn from stock by a
new project, update it.
