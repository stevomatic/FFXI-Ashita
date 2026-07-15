# AutoBurst — Changes

This file tracks what changed and why, so the code comments can stay short.
Newest entries at the top.

## Ashita v3 → v4 port (prior work, condensed from old inline comments)
- **`common` library**: not `require()`'d — it isn't a valid v4 module, and a
  failed require during chunk load killed the addon before it reached event
  registration. All helpers are defined locally instead.
- **`ffxi.recast`**: needed for `SpellRecast()`'s cooldown checks. Wrapped in
  `pcall` so a missing/invalid module path degrades to "always ready" instead
  of crashing the addon.
- **Packet bit-unpacking**: switched to `ashita.bits.unpack_be(e.data_raw, 0,
  bitOffset, bitLength)` — the real v4 API needs `e.data_raw` (raw/FFI data),
  not `e.data` (plain Lua string), and takes the full bit offset in the third
  argument rather than splitting byte/bit. Bit-offset constants (82, 271, 299,
  150, etc.) were confirmed against a known-working v4 addon's packet source
  and didn't need to change. A pure-Lua fallback (`unpack_be_fallback`) is
  kept in case the real API call fails on some other build.
- **`BuffActive`**: fixed an early-return bug that only ever checked buff
  slot 0 instead of scanning all 32.
- **`ItemCount`**: replaced the old `ItemCheck`, which returned a boolean but
  was compared with `> 0` at every call site — that threw a runtime error the
  moment it was hit (e.g. as soon as Silence landed).
- **`CanUseSpell`**: now reads `player:GetJobPointsSpent(jobId)` directly
  instead of requiring a hand-maintained JP table in the config file.
- **`GetCurrentTargetInfo`**: replaced `target:GetTargetName()` /
  `GetTargetHealthPercent()`, which don't exist on the v4 `ITarget` interface
  — the actual name/HP lookup has to go through the Entity manager.
- **Delayed-task queue**: replaced `ashita.tasks.once`, which errored at
  runtime, with a simple table of `{run_at, fn, args}` checked once per frame
  off `d3d_beginscene`, using only `os.clock()`.
- **Aspir trigger condition**: fixed an operator-precedence bug where
  `A or B or C or D and E and F and G` only actually required `E/F/G` to be
  true for the last name in the list — Darkness/Umbra/Compression would
  always try to Aspir instead of bursting, regardless of target/buffs/MP.
- **Actor/UserID offset**: fixed an off-by-one byte read, verified against
  a known-working v4 addon's packet handler source.
- Removed a temporary `/autoburst party` diagnostic command once the actor
  offset fix above was confirmed — it crashed the addon when a queued
  `/target` command re-triggered the `command` event with `e.command == nil`.

## Template for new entries
```
## YYYY-MM-DD — short title
- What changed.
- Why (what broke, or what this enables).
```
