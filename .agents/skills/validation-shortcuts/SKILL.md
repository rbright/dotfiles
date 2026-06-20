---
name: validation-shortcuts
description: Validation and verification recipes for dotfiles changes.
version: 1.0.0
license: MIT
author: Ryan Bright
---

# Validation Shortcuts

Validation and verification recipes for dotfiles changes. Load this skill before
hand-off to confirm a change is safe to ship.

## First 60 Seconds

Run this checklist at the start of every task:

1. Identify the package directories affected by the request.
2. Read the target config files before editing.
3. Confirm command/tooling expectations from `README.md` and `justfile`.

## Validation Baseline

Minimum checks before hand-off:

1. `stow -nv <package>` for each touched package.
2. Relevant syntax/config check(s) for changed tools.
3. `git diff --check`.
4. Manual smoke test in the affected application.

If any check is not run, state exactly what was skipped, why, and the command to
run.

## References

- [Validation checklist (long form)](references/validation-shortcuts.md)
