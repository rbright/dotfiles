# Zed Agent Guide

## Scope

These rules apply only to files under `zed/`.

## Mission

Keep Zed configuration portable across macOS and Linux, predictable to review,
and safe to deploy with Stow.

## Source of Truth

- Keybindings: `zed/.config/zed/keymap.json`
- Settings: `zed/.config/zed/settings.json`

## Editing Rules

1. Read the current target file before editing.
2. Keep changes scoped to the requested behavior; avoid drive-by cleanup.
3. Keep `keymap.json` organized by **context first**, then OS variants:
   - `Workspace`
   - `Editor`
   - `AgentPanel`
   - `GitPanel && ChangesList`
   - `CommitEditor > Editor`
4. For OS-specific behavior, use explicit contexts:
   - `os == macos > ...`
   - `os == linux > ...`
5. On Linux, do not introduce `cmd-*` or `super-*` shortcuts unless explicitly
   requested. If needed, use `null` to disable unwanted default super-key
   bindings.
6. Prefer additive, explicit mappings over implicit dependency on defaults.
7. Keep comments short and actionable.

## Validation Required

Run these before hand-off:

1. `stow -nv zed`
2. `git diff --check`
3. Manual Zed smoke test:
   - Open Zed and trigger changed shortcuts.
   - Run `dev: open key context view` and confirm expected context matching.

If any check is skipped, state exactly what was skipped, why, and the command to
run.

## Safety

- Do not add secrets or machine-specific credentials.
- Do not edit files outside `zed/` unless explicitly requested.
