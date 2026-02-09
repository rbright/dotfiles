# Agent Guide

## Scope

These rules apply to the entire repository at
`/Users/rbright/Projects/dotfiles`.

## Mission

Maintain Stow-managed dotfiles with safe, reversible changes and explicit
verification.

## First 60 Seconds

1. Identify the package directories affected by the request.
2. Read the target config files before editing.
3. Confirm command/tooling expectations from `README.md` and `justfile`.

## Workflow Rules

| Scope | Problem | Rule | Why | Trigger | Example |
| --- | --- | --- | --- | --- | --- |
| Repo | Broken symlink rollout | Dry-run Stow for each touched package before hand-off. | Catches conflicts before install. | Any package file change | `stow -nv zsh` |
| Repo | Silent syntax regressions | Run an app-native syntax/config check when available. | Dotfile repos do not have one central test suite. | Shell/editor/terminal config changes | `zsh -n zsh/.zshrc` |
| Repo | Style-only failures in CI/review | Run `git diff --check`. | Prevents trailing whitespace/newline mistakes. | Any edit | `git diff --check` |
| Repo | Hard-to-review mixed commits | Keep changes package-scoped and use Conventional Commit scopes. | Improves review and rollback safety. | Multi-package edits | `feat(wezterm): ...` |
| Repo | Secret leakage | Never commit credentials or machine-specific sensitive files. | Prevents irreversible exposure. | Before finalizing changes | `git status --short` |
| Repo | Stale instructions | Update docs/instructions whenever workflow behavior changes. | Keeps future sessions reliable. | New commands or changed flows | Update `README.md`/`AGENTS.md` |

## Validation Baseline

Minimum checks before hand-off:

1. `stow -nv <package>` for each touched package.
2. Relevant syntax/config check(s) for changed tools.
3. `git diff --check`.
4. Manual smoke test in the affected application.

If any check is not run, state exactly what was skipped, why, and the command to
run.

## Documentation Boundaries

- `README.md`: user-facing setup and workflow commands.
- `AGENTS.md`: durable agent behavior and guardrails.
- `PLAN.md`: active mission checklist.
- `SESSION.md`: executed commands, decisions, and outcomes.

Avoid duplicating long how-to content between files; link to the authoritative
entrypoint instead.

## Git Hygiene

- Do not create/switch branches, commit, or push unless explicitly asked.
- Do not revert user changes you did not author.
- Prefer minimal, targeted edits over broad refactors.
