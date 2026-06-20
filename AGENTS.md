# Agent Guide

## Scope

These rules apply to the entire repository at
`/Users/rbright/Projects/dotfiles`.

## Mission

Maintain Stow-managed dotfiles with safe, reversible changes and explicit
verification.

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

## Skills

Project-local skills live under `.agents/skills/`. Load the relevant skill before
acting on its topic.

- `.agents/skills/repository-policy/` — durable rules for working with the
  dotfiles Stow repository (Workflow Rules table).
- `.agents/skills/validation-shortcuts/` — first-60-seconds checklist and
  hand-off validation recipes (Validation Baseline).

For Zed-specific guidance see `zed/AGENTS.md`.
