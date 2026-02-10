from __future__ import annotations

import sys

from agent_notify.jsonutil import parse_json_object
from agent_notify.types import HookContext


def _read_stdin() -> str:
    if sys.stdin.isatty():
        return ""
    try:
        return sys.stdin.read()
    except OSError:
        return ""


def build_context(argv: list[str]) -> HookContext:
    stdin_text = _read_stdin()
    stdin_payload = parse_json_object(stdin_text) if stdin_text else None
    argv_payload = parse_json_object(argv[-1]) if argv else None
    return HookContext(stdin_payload=stdin_payload, argv_payload=argv_payload)
