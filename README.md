# AutoBurst (Ashita v4)

Automatically casts elemental/dark magic bursts when it detects a skillchain
resonance packet on your target. Originally forked from DanielHazzard's
Windower/Ashita v3 addon; ported to the Ashita v4 API and substantially
rewritten since (v4 port and changes by Kommissar).

## What it does

AutoBurst watches incoming action packets for the skillchain "added effect"
flag (the same signal that produces the in-game `Skillchain: <Name>.`
message). When your party or pet closes or continues a skillchain, it:

1. Identifies the skillchain property (Light, Fusion, Radiance, etc.) from
   the packet.
2. Locks your target to the actor that triggered it.
3. Looks up the spell configured for that skillchain window in
   `AutoBurst_config.lua`.
4. Casts it, automatically walking down configured spell tiers
   (`TierOrder`) and retrying up to `MaxBurstsPerChain` times per window if
   your current tier isn't ready (on recast, above your level/JP unlock,
   etc.).

It only runs while your main job is in `BurstJobs`, and it will not cast
into Silence, Sleep, Petrify, Stun, Terror, or other disabling statuses.

## Requirements

- Ashita v4
- A main job in `BurstJobs` (see Configuration below)
- `ffxi.recast` (loaded automatically if available on your build; AutoBurst
  degrades gracefully -- without recast checks -- if it isn't)

## Installation

1. Copy `autoburst.lua` and `AutoBurst_config.lua` into
   `Ashita/addons/autoburst/` (both files in the same folder).
2. `/addon load autoburst`
3. Edit `AutoBurst_config.lua` to match your job, gear, and burst
   preferences (see below). Config changes take effect on next
   `/addon reload autoburst`.

## Configuring `AutoBurst_config.lua`

### `DebugMode`
`true` prints detailed step-by-step console output (packet decode, spell
checks, tier skips, etc.) -- useful when troubleshooting, noisy otherwise.
Leave `false` for normal play.

### `BurstJobs`
Main jobs allowed to auto-burst. If your current main job isn't in this
list, the addon does nothing (safe no-op, not an error).

### `MaxTierByJob`
Hard per-job ceiling on standard elemental nuke tiers (`I` through `VI`).
Exists because some jobs' spell resource data reports a Job Point unlock
for a tier your server ruleset doesn't actually grant server-side -- this
cap stops AutoBurst from trying (and silently failing) a cast your
character can't actually complete. This is a single global ceiling per
job; it applies to every spell routed through the normal tier-suffix path,
not just the standard six elements.

### `BurstMagic`
Maps each skillchain property to the spell/element AutoBurst should cast
when that window opens. Set any entry to `"void"` to disable bursting that
window entirely.

Three supported spell types:

- **Traditional Elemental** -- enter the raw element (`"Fire"`,
  `"Thunder"`, etc.). AutoBurst appends the Roman numeral tier
  automatically per `TierOrder`.
- **Dark Magic Tiers** -- enter `"Aspir"`, `"Drain"`, or `"Bio"`. Mapped
  safely up to tier III.
- **Heavy Single-Tier Spells** -- enter `"Death"`, `"Kaustra"`,
  `"Impact"`, or `"Break"`. These have no numbered variants, so AutoBurst
  only attempts them once `TierOrder` reaches tier `"I"`, and safely skips
  them at every other tier instead of erroring.
  - `"Break"` is Earth-elemental and deals **no direct damage** -- magic
    bursting it only boosts magic accuracy (a more reliable Petrify), not
    damage. Its valid burst windows are `Umbra`, `Darkness`, `Gravitation`,
    and `Scission`. Since `BurstMagic` only holds one spell per window,
    setting `Break` on one of these replaces whatever damage spell was
    there -- treat it as a situational, fight-by-fight edit rather than a
    permanent setting, the same way you'd situationally set `Death` or
    `Impact`.

### `HelixMagic`
Maps each element to its Scholar Helix spell name (`Geohelix`,
`Ionohelix`, etc.). Used automatically when `TierOrder` includes `"Helix"`
or `"Helix II"` for a `BurstMagic` entry pointing at a standard element.
Do not alter these -- they're fixed in-game spell names, not tunable.
Note: `Helix II` is a Scholar-main-only Job Point master-level unlock;
other jobs that can reach `Helix` (tier I) via SCH subjob will correctly
be blocked from `Helix II` by `CanUseSpell`.

### `TierOrder`
Priority order AutoBurst walks through for each burst attempt, from
highest priority `[1]` to lowest. Include `"Helix"` / `"Helix II"` here to
prioritize Scholar's continuous-damage spells; include `"Death"`,
`"Kaustra"`, `"Impact"`, or `"Break"` to include those single-tier spells
in the rotation (they only fire once the loop reaches wherever they sit in
this list, and only if the spell it maps to in `BurstMagic` is one of
those heavy single-tier names).

### `MaxBurstsPerChain` / `BurstChainDelay` / `ExtendedDelay`
- `MaxBurstsPerChain`: how many burst attempts to chain within one
  skillchain window.
- `BurstChainDelay`: base seconds between chained attempts. AutoBurst
  automatically adds a 2.5s buffer on top of this for slow-casting Helix
  spells, `Death`, or `Kaustra` (not needed for `Break` -- its cast time is
  short, in line with a normal nuke).
- `ExtendedDelay`: extra seconds added before the first cast in a chain,
  covering target-lock acquisition. Increase if targeting seems to fire
  before the target is actually locked.

### `Aspir_NoBurst` / `Aspir_MPAmount`
If `Aspir_NoBurst` is `true`, AutoBurst substitutes an Aspir cycle instead
of a normal elemental burst on Darkness/Umbra/Compression/Gravitation
windows specifically, but only when your MP is at or below
`Aspir_MPAmount` and you don't already have Aspir/refresh-equivalent
active. This only triggers inside an actual detected skillchain window --
it is not a standalone "nuke MP dry" poller.

### `MagicBurstWindowDuration`
Optional. How many seconds `AutoBurst.IsWindowOpen()` (see LuAshitacast
integration, below) reports `true` after a skillchain resonance is
detected on your target. This is a practical UI-facing duration for gear
selection, not a claim about the server's exact magic-burst timing --
tune it to taste. Defaults to `3.0` if not set in config.

### Status Maintenance (`AttemptSilenceRemoval`, `UseEchoDrops`, etc.)
If `AttemptSilenceRemoval` is `true`, AutoBurst will automatically consume
the first available configured item (in the listed priority order) the
moment it detects you've just been Silenced. Toggle each `Use___` flag for
whichever items you actually carry.

## LuAshitacast integration (Burst vs. Nuke gear)

AutoBurst exposes a small read-only API table, `_G.AutoBurst`, that a
LuAshitacast job profile can query directly from `HandleMidcast`. No
commands are sent back and forth, nothing needs to be registered, and
there's no flag to maintain in `HandleCommand` -- your profile just reads
the table when it needs to.

Two independent signals are exposed:

- `AutoBurst.IsWindowOpen()` -- returns `isOpen, element, targetId`.
  `isOpen` is `true` for a fixed period after ANY skillchain resonance
  packet is detected on your target (see `MagicBurstWindowDuration`
  below), regardless of who casts into it. Use this to decide "should I
  be wearing magic-burst gear right now."
- `AutoBurst.IsPendingSpell(spellName)` -- returns `true` only if
  `spellName` is the exact spell AutoBurst itself just queued via `/ma`
  (valid for 5 seconds after it's queued). Use this to tell "this is
  AutoBurst's own automatic/free burst cast" apart from a same-named spell
  you cast manually into an open window.
- `AutoBurst.ConsumePendingSpell()` -- call this once your profile has
  acted on an `IsPendingSpell` match, so a later manual cast of the same
  spell name within the window isn't mistaken for a second free burst.

A typical `HandleMidcast` check looks like:

```lua
elseif (spell.Skill == 'Elemental Magic') then
    gFunc.EquipSet(sets.Nuke);
    local AutoBurst = _G.AutoBurst;
    if (AutoBurst ~= nil) then
        if (AutoBurst.IsPendingSpell(spell.Name)) then
            gFunc.EquipSet(sets.NukeBurst);
            AutoBurst.ConsumePendingSpell();
        elseif (AutoBurst.IsWindowOpen()) then
            gFunc.EquipSet(sets.NukeBurst);
        end
    end
end
```

`GEO.lua` in this folder implements this pattern end to end and is the
reference example to copy from for other jobs.

If you're not using LuAshitacast, or don't want this, it's harmless -- if
`_G.AutoBurst` doesn't exist, a profile checking for it (`if AutoBurst ~=
nil then ...`) simply skips the block.

> **Note:** an earlier version of this README described a `/lac fwd burst
> on`/`off` command-forwarding mechanism, driven by `HandleCommand` and a
> `BLM.lua` example profile. That mechanism no longer exists in the
> addon -- it's been replaced entirely by the `_G.AutoBurst` table above.
> If a `BLM.lua` (or any other profile) in your setup is still keyed off
> the old `/lac fwd burst` commands, it will silently do nothing under the
> current addon and needs to be updated to the pattern shown above.

## Troubleshooting

Set `DebugMode = true` and watch the console during a fight. Useful things
to look for:

- `actor=... category=...` -- confirms packets are being decoded at all.
- `Weaponskill/Magic/Pet added effect located: <Chain>` -- confirms a
  skillchain resonance was actually detected.
- `Skillchain located: ...` / `Burst possible.` -- confirms AutoBurst
  decided to act on it.
- `Checking spell: ...` / `Spell can be used: ...` -- confirms tier
  selection and eligibility checks.
- `Attempting cast (n/max): /ma "..." <t>` -- confirms a cast was actually
  queued.
- `Magic burst window opened: ... (expires in ...)` -- confirms
  `AutoBurst.IsWindowOpen()` will report `true` for a LuAshitacast profile
  checking it (see LuAshitacast integration, above).
- `Marked pending burst spell: ...` -- confirms `AutoBurst.IsPendingSpell`
  will match this spell name as one of AutoBurst's own "free" casts.

If a spell is silently skipped, it's most likely `CanUseSpell` deciding
you can't use it yet (MP, level, JP master-level requirement, or
`MaxTierByJob` cap) -- `DebugMode` prints the specific reason, including a
one-time `LevelRequired dump` if both your main and sub job come back
unusable, for cross-checking against actual game rules.

## Credits

- Original addon: DanielHazzard (Windower/Ashita v3).
- Ashita v4 port and ongoing changes: Kommissar.
- See `CHANGES.md` in this folder for the detailed history of what changed
  from the original and why.
