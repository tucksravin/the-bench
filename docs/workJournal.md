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
> Superseded in part by 2026-11-09 — A field test and a parts list from a friend cut the court-lights cost.

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

## 2026-11-09 — A field test and a parts list from a friend cut the court-lights cost (`main`)

**Why.** The user borrowed a kit from a friend and played at night under it.
Then the user said that the 2026-11-06 prices were too high. The friend's parts
list proved that. The README and the shopping list now start from the test.

**Measured numbers.** The borrowed kit had two floods of about 100 W for each
court. Each flood had its own stand, battery and cord. The friend's prices are
$135 for the battery, $95 for the stand, $18 for the flood and $9 for the cord.
That is $257 for each light. The battery is 53% of it and the flood is 7%.

**Beliefs corrected on contact.** The 2026-11-06 plan chose Halco floods at
$57–110 each for their light for each watt. The test shows that an $18 flood is
sufficient. The plan also had a cart, a site kit and a watt meter, for about
$275–425. The group carried the borrowed kit with none of them. The plan put a
bench test before a field test. The user did the field test first, with a
borrowed kit, and it cost nothing.

**The kits.** The user owns a Rockpals, so the friend's kit costs about $380.
Four 60 W floods on the same two batteries cost about $440–480. Four 120 W
floods need three more small batteries and cost about $730–750. The corners are
the reason for four floods. From the net line, the near corners are 69° off the
axis of a flood that points straight across.

**One large battery.** The user plans to live out of a truck in about a year,
so a large power station has a second use. With an Anker SOLIX C2000 Gen 2 at
$749, four 120 W floods run for about 3.6 hours and the kit costs about
$1,120–1,160. A 1 kWh unit runs four 120 W floods for only 1.8 hours.

**Defects, named.** WebFetch fails with `ENOTFOUND` for each host in this
session, also for a host on the allowed list. The user added amazon.com to the
Personal environment, and that did not help. A plain `curl` then got through the
proxy, and Amazon answered 503. The session did not use a browser client name
to get past that. No Amazon price in the shopping list is checked.

**What is not confirmed.** The stand, the power station and the cord are known
only by ASIN. The price of an Onforu 60 W flood is an estimate. No source
measured the real draw of the Onforu 120 W flood. The Amazon cart link is not
tested.

**State.** Nothing is bought. The user did not choose a kit yet.

Usage: rate limit `seven_day`, status `allowed`, no overage. Cost $10.08,
249,582 input tokens, 114,496 output tokens, 10,426,758 cache-read tokens and
533,091 cache-write tokens, from `get_session` before this entry.

## 2026-11-09 — The user chose a starter kit for the court lights (`main`)

**Why.** The user wants the minimum first, and will upgrade if it is not
sufficient. The starter kit is two 60 W floods, two stands and cords, with the
Rockpals as the only battery. It costs about $280–300.

**Honest accounting.** The starter kit claims 12,000 lm. That is about 60% of
the light in the field test, so the test does not prove this kit. With one
battery, a cord must go to each stand. The path around a corner of the court is
about 59 ft. Each stand needs a 50 ft cord and a second cord up the stand.
A 100 ft cord from one stand to the other is too short, because that path is
about 118 ft.

Usage: rate limit `seven_day`, status `allowed`, no overage. Cost $11.76,
387,669 input tokens, 139,244 output tokens, 12,114,711 cache-read tokens and
570,012 cache-write tokens, from `get_session` before this entry.

## 2026-11-09 — The starter kit cord goes under the net (`main`)

This entry corrects the cord layout in "The user chose a starter kit for the
court lights". The user will run the cord under the net. That path is about
46 ft, so one 50 ft cord is sufficient and the kit costs about $260–280. The
earlier layout went around the court, because a cord on the net line is where
players step.

Usage: rate limit `seven_day`, status `allowed`, from the `get_session` call of
the entry before this one. Cost and tokens: n/a for this entry.
