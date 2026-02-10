from __future__ import annotations

import json
from typing import TypeGuard


def parse_json_object(text: str) -> dict[str, object] | None:
    text = (text or "").strip()
    if not text.startswith("{"):
        return None
    try:
        value = json.loads(text)
    except json.JSONDecodeError:
        return None
    if not isinstance(value, dict):
        return None
    return value


def is_json_object(value: object) -> TypeGuard[dict[str, object]]:
    if not isinstance(value, dict):
        return False
    return all(isinstance(k, str) for k in value.keys())


def is_json_array(value: object) -> TypeGuard[list[object]]:
    return isinstance(value, list)
