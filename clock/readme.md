# clock

Displays one or more configurable clocks on screen, each with its own timezone offset.

## Installation

1. Place this folder (`clock`) inside your Ashita `addons` directory, so the path looks like:
   ```
   Ashita\addons\clock\clock.lua
   ```
2. Load it in-game:
   ```
   /addon load clock
   ```
3. (Optional) Add it to `Scripts\Default.txt` to load automatically on boot:
   ```
   /addon load clock
   ```

## Commands

All commands are prefixed with `/time`.

| Command | Description |
|---|---|
| `/time help` | Displays the addon's help information. |
| `/time save` | Saves the current settings. |
| `/time reload` | Reloads settings from disk for the current character (or defaults otherwise). |
| `/time reset` | Resets settings to defaults. (Your configured clocks are preserved.) |
| `/time add <name> <offset>` | Adds a clock with the given timezone offset (in hours, e.g. `5.5` for half-hour zones). If a clock with that name already exists, its offset is updated. |
| `/time del \| delete \| rem \| remove <name>` | Deletes a clock by name. |
| `/time clear` | Removes all clocks. |
| `/time f \| fmt \| format [format]` | Displays the current timestamp format, or sets a new one if given. Uses standard `os.date` format tokens (e.g. `[%I:%M:%S]`). |
| `/time s \| sep \| separator [separator]` | Displays the current separator between clocks, or sets a new one if given. |
| `/time c \| col \| color <a> <r> <g> <b>` | Sets the clock text color (alpha, red, green, blue — each 0-255). |
| `/time p \| pos \| position <x> <y>` | Sets the clock's on-screen position and saves it immediately. |

## Positioning the clock

There are two ways to place the clock on screen:

- **Command:** `/time pos <x> <y>` — sets an exact pixel position and saves it right away.
- **Drag:** Shift+click and drag the clock text to move it, then either let the addon unload naturally (e.g. `/addon unload clock`, relog, or closing the game) or run `/time save` to persist the new position without unloading.

## Examples

```
/time add EST -5
/time add JST 9
/time format [%I:%M %p]
/time separator  |
/time color 255 255 200 0
/time pos 20 20
```

## Notes

- Offsets are in hours relative to UTC and support decimals (e.g. `5.5`, `-3.5`) for half-hour timezones.
- Settings are stored per-character by Ashita's settings library and load automatically on character switch.
