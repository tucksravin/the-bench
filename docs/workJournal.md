# the-bench — Work Journal

Running log of bench work: what was done, why, and where it landed.
Chronological — newest entry at the bottom. [README.md](../README.md) says what
is here now; this is the history of getting it there. `bench/lore.md` is the
sibling that holds standing hardware facts rather than history — something still
true belongs there, not in an entry.

The convention is in [CLAUDE.md](../CLAUDE.md) under "The work journal". In
short: every working session appends a dated entry, prose over bullets, why over
what, and history is never edited to be right — a later entry corrects an
earlier one and says so.

---

## 2026-09-05 — Journal opened, and 78 commits summarised rather than reconstructed (`chore/work-journal`)

The journal starts today, so this first entry is a **backfill**: a deliberately
coarse summary written from the commit log, not from memory. Detail below this
line is trustworthy; detail above it is not, and nothing here should be cited as
though someone wrote it down at the time. Before 2026-09-05 the commit log,
`bench/lore.md` and the per-project specs under `projects/*/docs/superpowers/`
remain the record.

**What this repo is.** A workshop monorepo for physical bench builds — ESP32
firmware, the Python that drives it from the laptop, and the WeasyPrint-built
PDFs that go to the bench as printouts. One project so far:
`projects/octagonal-led-turn-counter/`, an LED rim turn counter for an octagonal
gaming table, with eight piezo seats, a 221-LED WS2812B rim and phone control
over Wi-Fi. The root owns only the shared layer — `inventory.md` (the point of
which is spare stock, so a second project doesn't re-buy a 100-pack already in a
drawer), `bench/lore.md`, `bench/conventions.md`, `bench/adding-a-project.md`.

**The eras.** 78 commits, 2026-04-28 → 2026-09-04 — but **70 of them are the
turn counter's own history**, carried in by `git subtree` on 2026-09-04; only 8
belong to the bench root. April through June is nine commits of paper: design
doc, shopping list, parts revisions, dry-run data, no firmware. July (16) is the
board arriving — `hello_board` and `strip_test` bring-up sketches, adaptive tap
detection in `tap_light`, generated VS Code intellisense — ending in "init
working prototype. one mode" on the 21st. August (41) is where the thing was
actually built, in four spec → plan → firmware → docs cycles a day or two apart:
runtime piezo map and OTA (08-14), phone control of mode, brightness and off
(08-15), setup lock plus `/api/diag` and two timed modes (08-16), and the tap
guard (08-16), which quarantines a chattering seat by loudness duty cycle rather
than chasing it with a threshold. One commit that day reads "fix 13 defects from
the adversarial review". September's 12 are this monorepo: spec, plan, subtree
import, root scaffold, and the corrections the move shook out.

**One consequence, because it shapes every history read here.** The turn
counter came in as a subtree, so `git log --follow` returns nothing for files
under `projects/octagonal-led-turn-counter/`, and `git log -- <path>` shows only
the merge commit. The pre-merge tip `7b1ebb2` is recorded in
`bench/adding-a-project.md` for exactly this reason:
`git log 7b1ebb2 -- firmware/<file>` is how you read a file's real history.

**State as of this entry.** `main` at `4015a2d`, tree clean, no other branch
local or remote, nothing in flight.

**What changed today.** `CLAUDE.md` gained "The work journal", and this file
exists.
