from __future__ import annotations

import sys

from agent_notify.agents import claude, codex
from agent_notify.context import build_context
from agent_notify.notify import log_notification, notify_macos, title_from_cwd
from agent_notify.types import HookContext, Notification


def _handlers():
    # Order matters: stdin-based hooks should win over argv-based hooks.
    return (claude, codex)


def _select_notification(ctx: HookContext) -> Notification | None:
    for handler in _handlers():
        if not handler.is_match(ctx):
            continue
        return handler.build_notification(ctx)
    return None


def main(argv: list[str] | None = None) -> int:
    argv = sys.argv[1:] if argv is None else argv
    ctx = build_context(argv)
    notification = _select_notification(ctx)
    if not notification:
        return 0

    log_notification(notification)
    notify_macos(title_from_cwd(notification.cwd), notification.message)
    return 0
