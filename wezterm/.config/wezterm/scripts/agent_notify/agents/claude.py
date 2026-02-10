"""Claude Code Stop-hook handler."""

from __future__ import annotations

import os
from collections.abc import Iterable

from agent_notify.jsonutil import is_json_array, is_json_object, parse_json_object
from agent_notify.types import HookContext, Notification


def is_match(ctx: HookContext) -> bool:
    payload = ctx.stdin_payload
    if not payload:
        return False
    return _transcript_path(payload) is not None


def build_notification(ctx: HookContext) -> Notification | None:
    payload = ctx.stdin_payload or {}

    transcript_path = _transcript_path(payload)
    if not transcript_path:
        return None

    cwd = _cwd(payload)
    message = _last_assistant_message(transcript_path)
    if not message:
        return None

    return Notification(mode="claude-stop", cwd=cwd, message=message)


def _transcript_path(payload: dict[str, object]) -> str | None:
    value = payload.get("transcript_path")
    if not isinstance(value, str):
        return None
    value = value.strip()
    return value or None


def _cwd(payload: dict[str, object]) -> str:
    value = payload.get("cwd")
    if isinstance(value, str) and value.strip():
        return value
    return os.getcwd()


def _last_assistant_message(transcript_path: str) -> str | None:
    last: str | None = None
    try:
        for line in _iter_lines(transcript_path):
            text = _assistant_text_from_transcript_line(line)
            if text:
                last = text
    except OSError:
        return None
    return last


def _iter_lines(path: str) -> Iterable[str]:
    with open(path, "r", encoding="utf-8") as f:
        yield from f


def _assistant_text_from_transcript_line(line: str) -> str | None:
    evt = parse_json_object(line)
    if not evt:
        return None
    return _assistant_text_from_event(evt)


def _assistant_text_from_event(evt: dict[str, object]) -> str | None:
    if evt.get("type") != "assistant":
        return None

    message = evt.get("message")
    if not is_json_object(message):
        return None

    return _assistant_text_from_message(message)


def _assistant_text_from_message(message: dict[str, object]) -> str | None:
    content = message.get("content")
    if not is_json_array(content):
        return None
    return _assistant_text_from_message_content(content)


def _assistant_text_from_message_content(content: list[object]) -> str | None:
    parts: list[str] = []
    for item in content:
        if not is_json_object(item):
            continue
        if item.get("type") != "text":
            continue
        text = item.get("text")
        if isinstance(text, str) and text:
            parts.append(text)

    joined = "\n".join(parts).strip()
    return joined or None
