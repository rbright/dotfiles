---
name: repository-policy
description: Durable rules for working with the dotfiles Stow repository.
version: 1.0.0
license: MIT
author: Ryan Bright
---

# Repository Policy

Durable rules for working with the dotfiles Stow repository. Apply these to any
change that touches a Stow package file.

## Workflow Rules

| Scope | Problem | Rule | Why | Trigger | Example |
| --- | --- | --- | --- | --- | --- |
| Repo | Broken symlink rollout | Dry-run Stow for each touched package before hand-off. | Catches conflicts before install. | Any package file change | `stow -nv zsh` |
| Repo | Silent syntax regressions | Run an app-native syntax/config check when available. | Dotfile repos do not have one central test suite. | Shell/editor/terminal config changes | `zsh -n zsh/.zshrc` |
| Repo | Style-only failures in CI/review | Run `git diff --check`. | Prevents trailing whitespace/newline mistakes. | Any edit | `git diff --check` |
| Repo | Hard-to-review mixed commits | Keep changes package-scoped and use Conventional Commit scopes. | Improves review and rollback safety. | Multi-package edits | `feat(wezterm): ...` |
| Repo | Secret leakage | Never commit credentials or machine-specific sensitive files. | Prevents irreversible exposure. | Before finalizing changes | `git status --short` |
| Repo | Stale instructions | Update docs/instructions whenever workflow behavior changes. | Keeps future sessions reliable. | New commands or changed flows | Update `README.md`/`AGENTS.md` |

## References

- [Repository rules (long form)](references/repository-rules.md)
