# Validation Shortcuts

Validation and verification recipes for dotfiles changes.

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

## Skip reporting

When a check is skipped, record:

- **What** was skipped (the check name or command).
- **Why** it was skipped (the blocker or reason).
- **Command** to run it later (the exact invocation).
