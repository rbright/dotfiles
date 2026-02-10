"""Codex notify hook handler."""

from __future__ import annotations

import os

from agent_notify.types import HookContext, Notification


def is_match(ctx: HookContext) -> bool:
    payload = ctx.argv_payload
    if not payload:
        return False
    return "last-assistant-message" in payload or "last_assistant_message" in payload


def build_notification(ctx: HookContext) -> Notification | None:
    payload = ctx.argv_payload or {}

    cwd = payload.get("cwd")
    if not isinstance(cwd, str) or not cwd:
        cwd = os.getcwd()

    message = payload.get("last-assistant-message") or payload.get(
        "last_assistant_message"
    )
    if not isinstance(message, str):
        return None
    message = message.strip()
    if not message:
        return None

    return Notification(mode="codex", cwd=cwd, message=message)
