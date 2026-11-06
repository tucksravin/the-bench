# Portable Beach Court Lights

Battery lights for one beach volleyball court. The kit gives about two hours of
play after sunset. You carry the kit in, set it up, and pack it out at each
session. Nothing stays on the beach.

The target court is at Ocean Park, on Santa Monica State Beach. The Ocean Park
courts have no lights. The city has four lit courts at the pier (1560 Appian
Way), and you can reserve them up to 28 days ahead. The group plays at Ocean
Park, so this kit is for Ocean Park.

**Status (2026-11-06):** plan only. Nothing is bought. The next step is the
bench test in [Build phases](#build-phases).

This project is docs only. It has no firmware, scripts, `Makefile` or `.venv`.
[`shopping_list.md`](shopping_list.md) has the parts, the prices and the
sources.

## Constraints

| Constraint | Effect on the design |
|---|---|
| The kit goes across sand from the car at each session. | The kit weighs about 100 lb. Use a beach cart with balloon tires. |
| The kit must make no noise. Many beaches and parks do not permit generators. | Use batteries only. |
| City beach lots close at 7pm from November to March, and at 9pm from April to October (Ordinance 2859, adopted 2026-06-23). | A session after dark is about 2 hours at most. Sunset is about 4:45pm PT in December and about 8pm PT in June. |
| Recreational volleyball needs about 10 fc (108 lux). Tournament play needs about 20 fc. These values come from an old IES table. | The court is 8 m × 16 m (128 m²). If half of the light falls on the court, 10 fc needs about 28,000 lm and 20 fc needs about 55,000 lm. |
| Players look up at the ball. | Put the lights on the sidelines, 12 ft high, tilted down. Do not put a light behind an end line. |

## Layout

```text
                 S1   (3 m or more from the sideline)
                  |
   +--------------+--------------+
   |              |              |
   |    half A    |    half B    |   8 m
   |              |              |
   +--------------+--------------+
                  |  net
                 S2
                 16 m
```

- Put stand S1 on one sideline, at the net line. Put stand S2 on the other
  sideline, at the net line.
- Keep each stand 3 m or more from the court. The beach free zone is 3 m.
- Put two floods on the T-bar of each stand. Aim one flood into each half. The
  beams from S1 and S2 cross.
- Tilt the floods down. Keep the top edge of each beam below eye level.
- Aim the beams away from the bike path and the homes behind the beach.

## Power

Usable energy is less than the rated Wh because of inverter loss and the
low-battery cutoff. This plan uses 85% of the rated Wh for a power station. It
uses 84% (95% × 88%) for the DIY box.

### Plan A: two small power stations (current plan)

- Use the Rockpals 250 W (240 Wh, pure sine) that is already on hand. Add one
  more pure sine unit of 250–300 Wh. A LiFePO4 unit has a longer cycle life.
- Put one unit at the base of each stand. No cord goes around the court.
- Each unit gives about 200 Wh. For 2 hours, that is 100 W at each stand,
  which is two 50 W floods.
- Four Halco 10344 floods give about 28,600 lm, or about 10 fc. Four LEPOWER
  50 W floods give about 19,000 lm, or about 7 fc.
- The runtime margin is small. Do the bench test before you rely on 2 hours.

The user chose less light for a lower cost (2026-11-06).

### Plan B: DIY 12 V LiFePO4 box (option)

The user has some electrical skill. With that skill, a DIY box gives more energy
for each dollar than a second small power station.

- The main parts are a 12 V 100 Ah LiFePO4 battery (1,280 Wh) and a 600–700 W
  pure sine inverter. The other parts are a LiFePO4 charger, a fuse at the
  battery positive, 4–6 AWG leads and a box.
- Usable energy is about 1,070 Wh.
- Put the box at S1. Run a 100 ft outdoor cord around the end of the court to
  S2. Keep the cord outside the free zone, under about an inch of sand.
- Four Halco floods (200 W) run for about 5 hours. Eight Halco floods (400 W)
  run for about 2.5 hours and give about 20 fc.
- The Rockpals becomes the spare.
- Use the cable size and the fuse size from the inverter manual. For 600–700 W,
  that is usually 4–6 AWG and an 80–100 A fuse.

The box parts cost about $390–570 (see the shopping list). An Anker SOLIX C1000
Gen 2 (1,024 Wh) at about $450 costs the same or less. The Anker is sealed, has
a warranty, and charges in about 49 minutes. A 10–20 A charger needs all night
to charge the DIY box. If the Anker price is about $450 or less, buy the Anker.
Black Friday is 2026-11-27.

### Plans that the user did not choose

- **Two 1 kWh power stations, one at each stand.** This was the first plan. The
  2-hour parking window makes one 1 kWh unit enough for all four floods.
- **One 1 kWh power station with a cord to S2, and the Rockpals as a backup.**
  This costs about $1,100–2,000. Plan B gives the same energy.
- **Battery tower lights.** The Milwaukee MX FUEL ROCKET gives 20,000 lm on
  battery and costs $3,300–4,500. The cost is too high for the light.
- **Small tripod work lights of 3,000–4,000 lm.** The court needs 12–15 of
  them.
- **A rented towable light tower.** It needs a vehicle on the sand.
- **A gas generator.** It makes noise, and many beaches do not permit one.

## Build phases

1. **Bench test at home.** Buy one stand and two floods. Measure the real draw of
   each flood with a plug-in watt meter. Run both floods on the Rockpals for 2
   hours. If the Rockpals stops before 2 hours, use 40 W floods.
2. **Test night.** Take the Rockpals, the stand and the two floods to the court.
   Check the light level, the stand in wind and sand, and how people near the
   court react. One stand on one side is enough for a test.
3. **Buy the rest** for Plan A or Plan B.

## Wiring

- The Halco 10344 is a commercial fixture for hard-wiring. Expect bare leads,
  not a plug. No listing confirms this.
- At each T-bar, join the leads of the two floods in a weatherproof junction box
  with cable glands. Use WAGO 221-415 connectors from bench stock. Each box uses
  three connectors: line, neutral and ground.
- Run one 16/3 SJTW outdoor cord, about 15 ft, from the junction box down to the
  battery.
- Keep every connection off the sand.

The LEPOWER floods need no wiring. Each one has a cord and a plug. If a battery
has only one AC outlet, add a short outdoor splitter.

## On the beach

- Put each stand leg on a plywood square. A tripod has three legs, so two stands
  need six squares.
- Tie guy lines to sand anchors or to buried sandbags.
- Bring the sandbags empty. Fill them on the beach.
- Lower the stands in strong gusts.
- Put each battery in a plastic tote, with the lid open a little for air. Keep
  the tote off the sand. The batteries are not waterproof, and dew is heavy at
  night.
- Lock each battery to its stand with a cable lock.
- Play no music. Stake nothing permanently. Pack out everything.
- If a lifeguard or an officer tells you to stop, turn off the lights. Then ask
  what the rules permit.

## Open questions

- **Permission.** No source says if temporary lights are permitted on Santa
  Monica State Beach. A 2014 Coastal Commission staff report covers seven new
  unlit courts at Ocean Park. Ask Recreation and Parks before you buy.
- **Beach hours.** A city listing shows the beach open from 6am to 8pm. That
  listing is not clear. After incidents in 2025, the city council asked for
  curfew options. No source showed a curfew in force.
- **The Ocean Park lot.** No source gives the closing time of the Ocean Park lot.
  Read the sign on the lot.
- **Halco 10344.** No listing gives the beam angle. No listing says if the
  fixture has a cord.
- **Rockpals.** Count the AC outlets. Read the rating of the 12 V port. If the
  port is rated 10 A, 12 V floods on that port skip the inverter. That gives
  about 15 more minutes.

## Sources

- [City of Santa Monica: how to reserve a volleyball court](https://santamonica.gov/process-explainers/how-to-reserve-a-volleyball-court-or-beach-soccer-court)
- [City of Santa Monica: Santa Monica State Beach](https://www.santamonica.gov/places/parks/santa-monica-state-beach)
- [Santa Monica Next: beach parking hours extended](https://santamonicanext.org/2026/05/restoring-the-sunset-beach-parking-hours-extended/)
- [Ordinance 2859 text (ecode360)](https://ecode360.com/SA5008/laws/LF2739791.pdf)
- [Coastal Commission 2014 staff report on the Ocean Park courts](https://documents.coastal.ca.gov/reports/2014/11/F6a-11-2014.pdf)
- [ABC7: Santa Monica considers a beach curfew](https://abc7.com/post/santa-monica-considering-beach-curfew-recent-late-night-crimes/16160876/)
- [Old IES illuminance table (volleyball 10 fc recreational, 20 fc tournament)](https://www.scribd.com/doc/237172422/LH-446)
- [Milwaukee MX FUEL ROCKET tower light specs](https://superarbor.io/products/milwaukee-mx-fuel-rocket-tower-light-charger)
