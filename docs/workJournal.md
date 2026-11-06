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

## 2026-11-06 — Portable court lights opened as the second bench project (`017b360`)

**Why.** The user asked for a cheap way to light the Ocean Park beach volleyball
courts for night play. The answer took one long chat, with web research at each
step. Then the user asked to put the result in the bench as the next project.
`projects/portable-court-lights/` is the record of that chat. It is docs only: a
README with the plan, and a shopping list.

**How the plan moved.** The first answer was two 1 kWh power stations and four
100 W floods, at about $1,500–2,700. Two facts from the user changed it. First,
the courts are on Santa Monica State Beach. City beach lots there close at 7pm
in winter and 9pm in summer (Ordinance 2859, adopted 2026-06-23). That limits a
session after dark to about 2 hours.

Second, the user owns a Rockpals 250 W (240 Wh) and accepted less light for a
lower cost. Plan A is now two units of about 250 Wh, 100 W at each stand, about
10 fc. Plan B is a DIY 12 V LiFePO4 box, because the user has some electrical
skill.

**Beliefs corrected on contact.** The first answer assumed a park on grass. The
user meant the beach. That changed the free zone (3 m), the stand feet, the
parking clock and the permit question. The city Pier Courts at 1560 Appian Way
already have lights and take reservations. That was the cheapest answer, but the
group plays at Ocean Park.

The chat said four plywood squares, but two tripods have six legs. The shopping
list says six.

**Honest accounting.** The chat put the DIY box at $330–500 and Plan B at
$750–1,300. The itemized shopping list gives $390–570 for the box and
$1,000–1,550 for Plan B. The chat left out the site kit, the 100 ft cord and the
watt meter. It also priced the inverter below the Renogy listing.

At $390–570, an Anker SOLIX C1000 Gen 2 at about $450 costs the same as the box
or less. The chat did not see that. The README now says to buy the Anker at that
price.

**What is not confirmed.** The session network blocked santamonica.gov and
1000bulbs.com, so all specs and hours come from search summaries. No source
confirms these four things:

- the closing time of the Ocean Park lot
- permission for temporary lights on the beach
- the beam angle of the Halco 10344
- if the Halco has a cord or bare leads

The prices come from listings on 2026-11-06. Rows marked "est." have no listing
behind them.

**What this session left out, and why.** The project has no `Makefile`, `.venv`
or `requirements.txt`, because it has no code. Until it has a `Makefile`,
`make PROJ=portable-court-lights <target>` from the root will fail.
`bench/adding-a-project.md` gets no provenance row, because the project started
here and is not an import. `inventory.md` gets no drawdown, because the project
consumes nothing yet. The inventory gains the Rockpals under tools.

**State.** `main` is at `017b360` plus this entry. Nothing else is in flight.
The next step is the bench test in the project README.

Usage: rate limit `seven_day`, status `allowed`, no overage. Cost $2.70, 249,521
input tokens, 65,579 output tokens, 3,326,882 cache-read tokens and 108,309
cache-write tokens, from `get_session` before this entry.
