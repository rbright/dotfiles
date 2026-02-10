from __future__ import annotations

from dataclasses import dataclass


@dataclass(frozen=True)
class HookContext:
    stdin_payload: dict[str, object] | None
    argv_payload: dict[str, object] | None


@dataclass(frozen=True)
class Notification:
    mode: str
    cwd: str
    message: str
