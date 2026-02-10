#!/opt/homebrew/bin/python3
"""Entrypoint for agent completion notifications.

The actual implementation lives in `agent_notify/` so per-agent logic is cleanly
isolated and easy to extend.
"""

from agent_notify.entrypoint import main

if __name__ == "__main__":
    raise SystemExit(main())
