from __future__ import annotations

import json
import os
import shutil
import subprocess
import sys
from datetime import datetime, timezone
from pathlib import Path

from agent_notify.types import Notification

BELL = "\a"
SENDER_BUNDLE_ID = "com.github.wez.wezterm"
MESSAGE_LIMIT = 800


def title_from_cwd(cwd: str) -> str:
    if not cwd:
        return "agent"
    p = Path(cwd)
    return p.name or p.parent.name or "agent"


def _truncate(message: str, limit: int = MESSAGE_LIMIT) -> str:
    message = message or ""
    if len(message) <= limit:
        return message
    return message[:limit] + "..."


def _find_terminal_notifier() -> str | None:
    for candidate in (
        Path.home() / ".nix-profile/bin/terminal-notifier",
        Path("/nix/var/nix/profiles/default/bin/terminal-notifier"),
        Path("/opt/homebrew/bin/terminal-notifier"),
        Path("/usr/local/bin/terminal-notifier"),
        Path("/usr/bin/terminal-notifier"),
    ):
        if candidate.is_file() and os.access(candidate, os.X_OK):
            return str(candidate)
    return shutil.which("terminal-notifier")


def log_notification(notification: Notification) -> None:
    log_path = os.environ.get("AGENT_NOTIFY_LOG")
    if not log_path:
        return

    event = {
        "ts": datetime.now(timezone.utc).isoformat(timespec="seconds"),
        "mode": notification.mode,
        "title": title_from_cwd(notification.cwd),
        "cwd": notification.cwd,
        "message": notification.message,
    }
    try:
        with open(log_path, "a", encoding="utf-8") as f:
            f.write(json.dumps(event, ensure_ascii=True) + "\n")
    except OSError:
        pass


def notify_macos(title: str, message: str) -> None:
    notifier = _find_terminal_notifier()
    if not notifier:
        return

    try:
        subprocess.run(
            [
                notifier,
                "-sender",
                SENDER_BUNDLE_ID,
                "-title",
                title,
                "-message",
                _truncate(message),
            ],
            stdin=subprocess.DEVNULL,
            stdout=subprocess.DEVNULL,
            stderr=subprocess.DEVNULL,
            check=False,
        )
    except OSError:
        pass


def _env_enabled(name: str, default: bool = True) -> bool:
    value = os.environ.get(name)
    if value is None:
        return default
    return value.strip().lower() in {"1", "true", "yes", "on"}


def notify_terminal_bell() -> None:
    try:
        sys.stdout.write(BELL)
        sys.stdout.flush()
    except OSError:
        pass


def dispatch_notifications(notification: Notification) -> None:
    title = title_from_cwd(notification.cwd)
    if _env_enabled("AGENT_NOTIFY_MACOS", default=True):
        notify_macos(title, notification.message)
    if _env_enabled("AGENT_NOTIFY_BELL", default=True):
        notify_terminal_bell()
