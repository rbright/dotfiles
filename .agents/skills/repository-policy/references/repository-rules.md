# Repository Rules

Durable rules for working with the dotfiles Stow repository. Each rule is scoped
to the whole repo and applies to any change that touches a Stow package file.

## 1. Broken symlink rollout

- **Rule:** Dry-run Stow for each touched package before hand-off.
- **Why:** Catches conflicts before install.
- **Trigger:** Any package file change.
- **Example:** `stow -nv zsh`

## 2. Silent syntax regressions

- **Rule:** Run an app-native syntax/config check when available.
- **Why:** Dotfile repos do not have one central test suite.
- **Trigger:** Shell/editor/terminal config changes.
- **Example:** `zsh -n zsh/.zshrc`

## 3. Style-only failures in CI/review

- **Rule:** Run `git diff --check`.
- **Why:** Prevents trailing whitespace/newline mistakes.
- **Trigger:** Any edit.
- **Example:** `git diff --check`

## 4. Hard-to-review mixed commits

- **Rule:** Keep changes package-scoped and use Conventional Commit scopes.
- **Why:** Improves review and rollback safety.
- **Trigger:** Multi-package edits.
- **Example:** `feat(wezterm): ...`

## 5. Secret leakage

- **Rule:** Never commit credentials or machine-specific sensitive files.
- **Why:** Prevents irreversible exposure.
- **Trigger:** Before finalizing changes.
- **Example:** `git status --short`

## 6. Stale instructions

- **Rule:** Update docs/instructions whenever workflow behavior changes.
- **Why:** Keeps future sessions reliable.
- **Trigger:** New commands or changed flows.
- **Example:** Update `README.md`/`AGENTS.md`
