# jpmidnight

An Ashita v4 addon that buys **Acheron Shields** (with Sparks) and **Prize Powder**
(with Unity Accolades) without having to click through vendor menus by hand.

## Installation

1. Copy `jpmidnight.lua` into your Ashita `addons/jpmidnight/` folder.
   (Create the `jpmidnight` folder if it doesn't already exist - the file
   name and folder name should match.)
2. In-game, load it:
   ```
   /addon load jpmidnight
   ```
3. (Optional) Add that same line to your Ashita `default.txt` or character
   script if you want it to load automatically every time you log in.

## Commands

`/jp` works everywhere `/jpmidnight` does - it's just a shorter alias.

| Command | What it does |
|---|---|
| `/jpmidnight shield` | Buys Acheron Shields with Sparks, one at a time, until you run out of Sparks or inventory space. |
| `/jpmidnight powder` | Buys Prize Powder with Unity Accolades, filling your inventory/Accolades to capacity as fast as possible. |
| `/jpmidnight cancel` | Force-closes the vendor menu and resets the addon if something looks stuck. |

`/jp shield`, `/jp powder`, and `/jp cancel` do exactly the same things.

## How to use it

1. Walk up to and stand within range of the correct NPC (see table below).
2. Type the command for what you want to buy.
3. Wait - the addon will report your current inventory space and currency,
   then buy as much as it can afford and carry, then close the vendor menu
   automatically when done.

You do not need to target or manually interact with the NPC first - the
addon finds and talks to them itself as long as you're standing nearby.

## Supported vendors

Bastok, Sandy, Windy, Adoulin

## Troubleshooting

- **"Still buying last item"** - a purchase is already in progress. Wait for
  it to finish, or use `/jpmidnight cancel` if it seems stuck.
- **"No response from vendor menu, resetting."** - the addon didn't hear
  back from the NPC in time and reset itself automatically. Just try again;
  if it keeps happening, make sure you're actually standing close enough to
  the NPC.
- **"Too far from [NPC]"** - move closer and try again.
- **"You are not currently in a zone with a supported NPC"** - you're not in
  one of the four cities listed above.
- **Nothing seems to be happening / menu looks frozen in-game** - run
  `/jpmidnight cancel` (or `/jp cancel`). This safely closes out the vendor
  interaction and resets the addon so you can try again.
- **"Cannot afford any [item] or no inventory space."** - exactly what it
  says: you're out of currency, or your inventory is full (the addon always
  keeps one slot free as a buffer, so "full" here means one slot away from
  actually full).

## Notes

- Only Acheron Shield and Prize Powder are supported - this addon is
  intentionally kept to just those two items.
- Prize Powder purchases happen in batches (up to 99 at a time) when your
  Accolades and inventory space allow it, so a large purchase is fast. Small
  leftover amounts (under 50) are bought one at a time, which is normal and
  expected near the end of a big purchase.
