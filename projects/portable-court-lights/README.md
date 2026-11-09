# Portable Beach Court Lights

Battery lights for one beach volleyball court. The kit gives about two hours of
play after sunset. You carry the kit in, set it up, and pack it out at each
session. Nothing stays on the beach.

The target court is at Ocean Park, on Santa Monica State Beach. The Ocean Park
courts have no lights. The city has four lit courts at the pier (1560 Appian
Way), and you can reserve them up to 28 days ahead. The group plays at Ocean
Park, so this kit is for Ocean Park.

**Status (2026-11-09):** the field test is done, with a borrowed kit. Nothing is
bought. The user chose the [starter kit](#starter-kit-current-plan) on
2026-11-09, with a post mount in place of stands. The other kits are the
upgrades.

This project is docs only. It has no firmware, scripts, `Makefile` or `.venv`.
[`shopping_list.md`](shopping_list.md) has the parts, the prices and the
sources.

## Field test

Between 2026-11-06 and 2026-11-09 the group played at night with a borrowed kit.

- The kit had two floods for each court. The user thinks each flood is 100 W.
- Each flood had its own stand, its own small power station and its own cord.
- The light was sufficient for play.

The friend who owns the kit gave this parts list. The prices are from the
friend.

| Part | Amazon ASIN | $ each | What is known |
|---|---|---:|---|
| Power station | `B0FJD7LCY4` | 135 | Not identified. The friend says it holds a little more than the unit in the test. |
| Stand | `B0BTL5XYN6` | 95 | Not identified. |
| Flood | `B07PLP63QX` | 18 | Onforu 120 W. Claims: 12,000 lm, 6500K, IP66, 120° beam. Cord with plug. Sold as a 2-pack. |
| Extension cord | `B0153T1NF8` | 9 | Not identified. |

That is $257 for each light. The battery is 53% of the cost. The stand is 37%.
The flood is 7%.

Amazon refuses automated requests, so this session did not read the listings.
Search summaries identified only the flood.

The test changed the plan in three ways:

- The plan before the test used Halco 10344 floods at $57–110 each. An $18 flood
  is sufficient.
- The plan before the test had a beach cart, a site kit and a watt meter, for
  about $275–425. The borrowed kit has none of them.
- The battery sets the cost, not the light.

## Constraints

| Constraint | Effect on the design |
|---|---|
| The kit goes across sand from the car at each session. | Keep the kit small. The group carried the borrowed kit by hand. |
| The kit must make no noise. Many beaches and parks do not permit generators. | Use batteries only. |
| City beach lots close at 7pm from November to March, and at 9pm from April to October (Ordinance 2859, adopted 2026-06-23). | A session after dark is about 2 hours at most. Sunset is about 4:45pm PT in December and about 8pm PT in June. |
| An old IES table gives 10 fc for recreational volleyball. | The field test is the better guide. Two floods of about 100 W were sufficient. |
| Players look up at the ball. | Put the lights on the sidelines, as high as the stand permits, tilted down. Do not put a light behind an end line. |

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
- With one flood on a stand, aim it straight across the court.
- With two floods on a stand, aim one flood into each half.
- Tilt the floods down. Keep the top edge of each beam below eye level.
- Aim the beams away from the bike path and the homes behind the beach.

One flood on a stand does not light the two near corners well. Those corners
are about 69° off the beam axis, and a 120° beam stops at 60°. Two floods at an
angle put the near corners in the beam.

## Kits

Usable energy is about 85% of the rated Wh, because of inverter loss. The user
owns a Rockpals 250 W (240 Wh), so its usable energy is about 204 Wh. Kits 1, 2
and 3 use the Rockpals as one of the batteries.

| Kit | Floods | Batteries to buy | Light (claim) | Runtime | Cost |
|---|---|---|---:|---|---:|
| 1. The friend's kit | 2 × 120 W, one on each stand | 1 small | 24,000 lm | about 1.7 h | ~$380 |
| 2. Four small floods | 4 × 60 W, two on each stand | 1 small | 24,000 lm | about 1.7 h | ~$440–480 |
| 3. Four large floods | 4 × 120 W, two on each stand | 3 small | 48,000 lm | about 1.7 h | ~$730–750 |
| 4. Kit 2 with one 1 kWh battery | 4 × 60 W | 1 large | 24,000 lm | about 3.6 h | ~$880–960 |
| 5. Kit 3 with one 2 kWh battery | 4 × 120 W | 1 large | 48,000 lm | about 3.6 h | ~$1,120–1,160 |

The runtime of kits 1, 2 and 3 is the Rockpals runtime at 120 W. The costs are
before tax. The shopping list has the sums.

### Starter kit (current plan)

The starter kit is the minimum. It has two Onforu 80 W floods, and the Rockpals
is the only battery. It has no stands. Each flood goes on a stud that is
strapped to a net post. It costs about $100.

- The two floods use 160 W. The Rockpals runs them for about 1.25 hours.
- The Amazon listing claims 8,000 lm for each flood. The Onforu site gives 4,500
  lm for an 80 W model. The real output is not known.
- If the light is not sufficient, add a second flood to each stud and add a
  battery.

The post mount:

- The user says the net posts are thick wood. The plan assumes a post height of
  about 8 ft. Measure a post before you build.
- Use one 8 ft stud (2x4) for each post. An 8 ft stud fits a 5.5 ft truck bed
  with the tailgate down.
- Screw a cleat across the stud, 4 ft from the bottom. The cleat sits on the
  top of the post and holds the weight.
- Strap the bottom 4 ft of the stud to the post with two straps. The top of the
  stud is then about 12 ft high.
- Bolt the flood to the top of the stud at home.
- Do not put screws in the post. Put the straps on bare wood, not on a pad.
- Use 1 in. endless-loop straps, 6 ft or longer, with a cam buckle or a ratchet.

The cords:

- Put the Rockpals at the base of one post.
- Run a 40 ft cord along the bottom edge of the net to the other post. Hold it
  with hook-and-loop ties. The posts are about 33 ft apart.
- Run a 20 ft cord down each stud.
- Keep the joint between the 40 ft cord and the 20 ft cord off the sand.

A post is about 1 m from the sideline, so the near corners get less light than
with a stand at 3 m. Stands are the fallback if the post mount does not work.

### Small batteries (kits 1, 2 and 3)

- Each small battery runs 120 W for a session. That is one 120 W flood or two
  60 W floods.
- The Rockpals limit is 250 W. Do not put two 120 W floods on it.
- Kit 2 gives the same total light as Kit 1, with better cover of the corners.
- Kit 3 gives twice the light. Three more batteries cost $405.
- No cord goes around the court.

### One large battery (kits 4 and 5)

The user plans to live out of a truck in about a year. A large power station is
then camp power, so its cost is not only a cost of this project. The floods also
work as camp lights.

- Put the battery at S1. Run a 100 ft outdoor cord around the end of the court
  to S2. Keep the cord outside the free zone, under about an inch of sand.
- The Rockpals becomes the spare.
- A 1 kWh unit gives about 870 Wh. It runs four 60 W floods for about 3.6 hours.
  It runs four 120 W floods for about 1.8 hours, which is less than a session.
- A 2 kWh unit gives about 1,740 Wh. It runs four 120 W floods for about 3.6
  hours.
- With a 2 kWh unit, use 120 W floods. The battery is no longer the limit, and
  the 120 W flood has a known price.

Prices on 2026-11-09:

| Unit | Capacity | Weight | Price now | Low price seen |
|---|---:|---:|---:|---:|
| Anker SOLIX C1000 Gen 2 | 1,024 Wh | about 25 lb | $537–550 | $349–379 (Black Friday 2025) |
| Anker SOLIX C2000 Gen 2 | 2,048 Wh | 15.3 kg on the Anker page | $749 (May 2026) | $679–699 |
| Jackery Explorer 2000 v2 | 2,042 Wh | about 39 lb | $799–899 | $699 (Black Friday 2025) |

Black Friday is 2026-11-27. One price tracker says the Anker sale starts on
2026-11-10.

For a truck, 2 kWh is the better size. A DIY 12 V 100 Ah box (about 1,070 Wh
usable, parts about $390–570) is the option for a fixed truck install. Use the
cable size and the fuse size from the inverter manual. For 600–700 W, that is
usually 4–6 AWG and an 80–100 A fuse.

### Plans that the user did not choose

- **Halco 10344 floods.** They give more light for each watt, but they cost
  $57–110 each and need a cord wired on.
- **Two 1 kWh power stations, one at each stand.** This was the first plan.
- **Battery tower lights.** The Milwaukee MX FUEL ROCKET gives 20,000 lm on
  battery and costs $3,300–4,500.
- **Small tripod work lights of 3,000–4,000 lm.** The court needs 12–15 of
  them.
- **A rented towable light tower.** It needs a vehicle on the sand.
- **A gas generator.** It makes noise, and many beaches do not permit one.

## Next steps

1. Get the listing titles of the stand and the power station from the user.
2. Run one borrowed flood on the Rockpals at home. Record the time until the
   Rockpals stops. This gives the real runtime.
3. Choose a kit. Buy the battery near Black Friday.

## Mounting and cords

- The Onforu floods have a cord and a plug. No wiring is necessary.
- The friend says that one more part is necessary to attach a flood to the
  stand. The usual parts are a bolt, a fender washer and a wing nut through the
  bracket hole. The size depends on the stand.
- Two floods on one stand need a T-bar or a crossbar.
- Each flood needs an extension cord from the top of the stand to the battery.
- Keep each plug off the sand. The plug of a budget flood is usually not
  waterproof.

## On the beach

The borrowed kit has none of the items below. They are optional. A stand that
falls can hit a player, so the sandbags are worth their small cost.

- Put each stand leg on a plywood square.
- Bring sandbags empty. Fill them on the beach and put them on the stand legs.
- Lower the stands in strong gusts.
- Keep each battery off the sand, in a plastic tote with the lid open a little.
- Play no music. Stake nothing permanently. Pack out everything.
- If a lifeguard or an officer tells you to stop, turn off the lights. Then ask
  what the rules permit.

## Open questions

- **Stand and power station.** The capacity, the outlets, the height and the top
  fitting are not known.
- **Real draw of the Onforu 120 W.** The friend thinks it is less than 120 W. No
  measurement was found.
- **Onforu 60 W.** No reliable price or ASIN was found.
- **Permission.** No source says if temporary lights are permitted on Santa
  Monica State Beach. The group played with no problem so far.
- **The Ocean Park lot.** No source gives its closing time. Read the sign.

## Sources

- [City of Santa Monica: how to reserve a volleyball court](https://santamonica.gov/process-explainers/how-to-reserve-a-volleyball-court-or-beach-soccer-court)
- [Santa Monica Next: beach parking hours extended](https://santamonicanext.org/2026/05/restoring-the-sunset-beach-parking-hours-extended/)
- [Ordinance 2859 text (ecode360)](https://ecode360.com/SA5008/laws/LF2739791.pdf)
- [Old IES illuminance table](https://www.scribd.com/doc/237172422/LH-446)
- [Onforu 120 W flood (Desertcart)](https://www.desertcart.fr/products/134747496-onforu-120w-flood-lights-outdoor-12000lm-bright-led-work-light)
- [Anker SOLIX Black Friday tracker (Stationarena)](https://stationarena.com/black-friday/anker)
- [Anker SOLIX C1000 Gen 2 at $549.99 (MacRumors, 2026-11-05)](https://www.macrumors.com/2026/11/05/early-black-friday-accessory-deals/)
- [Anker SOLIX C2000 Gen 2 at $749 (Slickdeals)](https://slickdeals.net/f/19499844-anker-solix-c2000-gen-2-2048wh-2400w-lifepo4-power-station-749-free-shipping)
- [Jackery Black Friday tracker (Backup Power Hub)](https://backuppowerhub.com/jackery-black-friday-sale/)
- [Halco 10344 (BuyLEDOnline)](https://buyledonline.com/halco-10344-flfs50-3cctu-yk-proled-select-flood-50w-field-selectable-cct-3000k-4000k-5000k-120-277v-yoke-mount.html)
- [Milwaukee MX FUEL ROCKET tower light specs](https://superarbor.io/products/milwaukee-mx-fuel-rocket-tower-light-charger)
