# Changelog

All notable changes to this fork of the `clock` addon are documented here.

## [1.2] - 2026-08-23

### Added
- `/time pos <x> <y>` (aliases `p`, `pos`, `position`) — sets the clock's on-screen
  position explicitly and saves it immediately, without needing to drag.

### Fixed
- **Drag position not persisting.** Shift-dragging the clock to a new position
  worked visually, but the new coordinates were never written back into the
  saved settings — only the original load-time `position_x`/`position_y` was
  ever saved. The on-screen (live) position is now synced into settings:
  - on `/time save`
  - on addon `unload` (covers `/addon unload clock`, relog, and normal game close)

### Unchanged
- Default fallback position (`position_x = 500`, `position_y = 500`) in
  `default_settings` — only used the very first time the addon runs for a
  character, before a settings file exists on disk. After that, settings are
  loaded from the saved file, not from this table.

## [1.1] - Base version (atom0s)

- Initial public release. Multiple named clocks with independent timezone
  offsets, configurable font/color/format/separator, per-character settings.
