# Bench lore

Hard-won facts from real bench sessions. Committed here because the auto-memory
that held them is keyed to an absolute path and does not survive a move or a new
machine.

## Flashing an ESP32-S3 from this Mac

- **The board is the `/dev/cu.usbserial-*` port** (CP2102N UART bridge). Use the
  **UART** micro-USB jack, not the native-USB one, for flashing and the serial
  monitor. Set **USB CDC On Boot: Disabled** so `Serial` routes to the CP2102.
- **The `/dev/cu.usbmodem*` ports are the LG monitor's USB controls, not a
  board.** Selecting one gives esptool a real port that never answers →
  `Failed to connect to ESP32-S3: No serial data received`. Check the port
  before anything else when you see that error.
- **Charge-only cables** are the other classic: the board powers up and runs
  (onboard GPIO48 RGB cycles rainbow on factory firmware) but nothing
  enumerates. Needs a data micro-USB cable.
- **If auto-reset fails on the correct port:** hold BOOT, tap RST, release BOOT
  to enter download mode (rainbow stops = you're in the bootloader). If
  esptool's own reset still knocks it out, hold BOOT through the entire
  "Connecting…" phase and release once "Writing at 0x…" appears. Drop upload
  speed to 115200 if a hub can't sustain 921600.
- A USB hub is fine — the board has only micro-USB, so it can't reach this Mac
  without a C-to-micro cable anyway.

## Partition scheme

`turn_counter.ino` does not fit the default 1.25 MB (1,310,720 B) app
partition, so a plain `--fqbn esp32:esp32:esp32s3` **fails** with "text section
exceeds available space".

The overshoot grows as the firmware does, so treat it as a trend, not a
constant: 1,319,995 B (~9 KB over) on 2026-07-05 with esp32 core 3.3.10 /
FastLED 3.10.5, and 1,376,459 B (~64 KB over) on 2026-09-04 after the tap
guard work. Under `min_spiffs` that is 70% of the 1,966,080 B available, so
there is room — but it is worth re-reading the size summary after any large
feature rather than assuming the headroom is still there.

Use `--fqbn esp32:esp32:esp32s3:PartitionScheme=min_spiffs` (1.9 MB app, keeps
the OTA partition — required, the sketch uses ArduinoOTA). `huge_app` also links
but has no OTA partition. The same FQBN must be used for the upload. `tap_light`
and `strip_test` fit the default fine (~52%).

## Serial workflow

- `make monitor` (arduino-cli) is **line-buffered** — typed characters reach the
  firmware only on Enter. Single-char commands need `0⏎`, `+⏎`. "Typing
  commands with no effect" usually means no Enter, or no monitor open.
- An open monitor holds the port exclusively; `make flash-*` fails with
  "Resource busy" until it's closed. A retry loop
  (`until make flash-tap; do sleep 5; done`) flashes the moment the port frees.
- To probe running firmware **without resetting it**: pyserial with
  `dtr = False` and `rts = False` set **before** `open()`. Otherwise opening the
  port toggles DTR/RTS and reboots the ESP32.

## Reading the board over the network

Board HTTP (`/api/diag`, `/api/state`) and ICMP need a sandbox with LAN access.
A plain Bash sandbox blocks outbound LAN **silently** — a poller once logged
268/268 missed polls against a board that was answering fine, which read as a
dead board and cost a diagnostic window. The failure is indistinguishable from
an offline board unless you already know the cause.

Board was 192.168.0.50 via DHCP (may change). `turn-counter.local` resolves on
macOS, not Android. `make ping` needs USB and resets the board.

## Failure signature: chaotic taps = a floating ADC pin

**Symptom:** continuous chaotic taps whether or not a piezo is plugged in.
Serial shows a stable low `baseline` (~100) but `reading` swinging rail-to-rail
to 4095.

**Cause (2026-07-07, and again 2026-08-16 on side 7):** a lost ground return.
The piezo front-end (1 MΩ pulldown + 3.3 V Zener, both to GND) loses its path
back to ESP32 GND, so the input floats and the ADC reads rail-to-rail noise.

**Why you cannot fix it with a threshold:** the detector trips at
`baseline + TAP_DELTA`; a floating high-impedance node saturates the rail, far
above any threshold. A stable low baseline proves the 1 MΩ pulldown IS
connected — rail-to-rail readings then mean the pin still floats. Suspect the
ground return or a degraded contact, never the code.

**Diagnostic:** pull the piezo (+) lead, leave the 1 MΩ + Zener. If it still
rails, the noise is on the input node or ground, not the piezo. Note the 1 MΩ
lives at the *disc* on the installed table, so unplugging a disc's JST removes
the pulldown and **creates** this fault.

**Since 2026-08-16** the tap guard auto-quarantines such a side by loudness duty
cycle (loud ≥~38% of the last second → muted; `/api/diag` reports `"muted":1`,
red row on the phone page; unmutes below ~5% duty, except sticky game mutes
which need a power cycle). Turns skip muted seats. So the live symptom is now
"one seat dead + muted in diag", not a chattering table — **check the diag muted
flag before bench-debugging.**

## Power: single-feed strip droop

The assembled octagon (221 LEDs) is powered from a **single feed point** through
the dev board's `5V` pin. Confirmed 2026-07-20: all-white is uniform at ~0.5 A
but fades warm/dim from 1.5 A up — the strip's copper, not the connections.

As of 2026-08-16 the table runs off a USB wall adapter (was a powerbank), and
**the wiring is set as it stands** — mid/end injection and the split-cable
rewire are deferred indefinitely.

**Two sketches carry two different caps with two different restore targets.**
They are not in tension, and conflating them has caused confusion twice:

| Sketch | Cap now | Restore target | Limited by |
|---|---|---|---|
| `tap_light.ino` | `MAX_POWER_MA 700` | **4500** | the 5 A fuse ceiling |
| `octagon_core.h` (turn_counter, eight) | `MAX_POWER_MA 1500` | **~2500** | the dev board's own 5 V trace (~1.5–2 A) |

4500 is tap_light's fuse-limited ceiling once injection is wired. 2500 is
octagon_core's ceiling once 5 V is split at the source so LED current bypasses
the board. Neither is "the" cap.

**Do not raise `MAX_POWER_MA` because the supply improved.** Two independent
limits, neither of which is the power source:

1. `MAX_POWER_MA = 1500` in `octagon_core.h` is sized for the **dev board's own
   USB connector and 5 V trace** (~1.5–2 A continuous). 1500 mA LEDs + ~250 mA
   ESP ≈ 1.75 A. A beefier supply doesn't widen that trace.
2. Copper droop above ~1 A needs three injection points (start, mid corner
   between sides 4–5, end).

The cap only ever dims the three all-on moments (setup blink, READY all-on,
ready-flash). The lever that actually brightens ordinary play is the **runtime
brightness percentage**, default 50%; one side at 100% is ~1.0–1.4 A and stays
inside the cap. Raising the cap to 2500 requires splitting 5 V at the source so
LED current bypasses the board, *plus* the injection points.

The board cannot detect its power source — nothing distinguishes wall from
battery at any GPIO. GPIO 10 is the one free ADC1 pin (piezos use 1, 2, 4–9;
GPIO 3 is a JTAG strap) and would take a rail-sense divider if closed-loop
backoff is ever wanted.

## PDF builds are not byte-deterministic

`make pdf` rebuilds five PDFs. Two behave badly in git:

- **`turn_counter_design_doc.pdf` differs run to run** even with unmodified
  sources — same size, but ~42,000 differing byte positions from offset
  ~239,160, consistent with font subsetting rather than a timestamp. There is
  no date in the `doc-src/*.py` sources.
- **`design_doc_simple.pdf` is stable run to run** but shifted once (+14 B)
  when the venv was rebuilt on newer library versions.

The other three (`dry_run`, `tap_light_circuit`, `bench_build_guide`) are
byte-identical every time.

**How to apply:** after `make pdf`, commit only the PDFs whose *source* you
actually changed, and `git checkout` the rest. Otherwise every documentation
commit drags ~461 KB of incompressible noise behind it. Measured 2026-09-04
on weasyprint 66.0.

### Relative links in PDFs, and what still doesn't work

The builders originally passed `base_url=str(doc_dir)` while reading their
markdown from `out_dir` — off by one directory, so every relative link in a
built PDF pointed somewhere that did not exist. Fixed 2026-09-04 to
`base_url=str(out_dir)`. Safe because images are inlined as SVG *text* and never
resolved through `base_url`; nothing else in the CSS or HTML references a
relative resource.

**Still true, and probably unfixable this way:** WeasyPrint turns a relative
markdown link into an **absolute `file://` URL** baked into the PDF. So the
links work only on the machine that built it, at that exact path — move the repo
and they dangle again. If PDF hyperlinks ever need to survive being shared,
point them at the GitHub URLs rather than relative paths.
