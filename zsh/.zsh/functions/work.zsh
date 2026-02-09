################################################################################
# Work Sessions (Zellij)
################################################################################

work_session_name() {
  print "moonrise"
}

work_agent_session_name() {
  local agent="$1"

  if [[ -z "$agent" || "$agent" != <-> || "$agent" -lt 1 || "$agent" -gt 8 ]]
  then
    print -u2 "Agent number must be in range 1..8"
    return 1
  fi

  printf 'agent-%02d\n' "$agent"
}

work_agent_sessions() {
  local agent
  for agent in {1..8}; do
    printf 'agent-%02d\n' "$agent"
  done
}

work_existing_session_names() {
  zellij ls --no-formatting 2>/dev/null | awk '{ print $1 }'
}

work_ensure_agent_sessions() {
  local session
  local existing

  existing="$(work_existing_session_names)"
  while IFS= read -r session; do
    if printf '%s\n' "$existing" | grep -qx "$session"; then
      continue
    fi

    zellij attach -b "$session" options \
      --default-shell /bin/zsh \
      --default-layout agent \
      --pane-frames false \
      --auto-layout false \
      --session-serialization false \
      --disable-session-metadata true >/dev/null 2>&1 || true
  done < <(work_agent_sessions)
}

work() {
  if ! command -v zellij >/dev/null 2>&1; then
    print -u2 "zellij is not available on PATH"
    return 1
  fi

  local cmd="${1:-help}"
  shift || true

  case "$cmd" in
    up)
      work_ensure_agent_sessions
      zellij delete-session --force "$(work_session_name)" >/dev/null 2>&1 \
        || true
      zellij attach -c "$(work_session_name)" options \
        --default-layout moonrise \
        --auto-layout false \
        --session-serialization false \
        --disable-session-metadata true
      ;;
    reset)
      work down
      work up
      ;;
    down)
      zellij delete-session --force "$(work_session_name)" >/dev/null 2>&1 \
        || true
      while IFS= read -r session; do
        zellij delete-session --force "$session" >/dev/null 2>&1 || true
      done < <(work_agent_sessions)
      ;;
    ls)
      zellij ls --no-formatting | grep -E '^(moonrise|agent-0[1-8])\b'
      ;;
    attach)
      if [[ -z "$1" ]]; then
        print -u2 "usage: work attach <session-name>"
        return 1
      fi
      zellij attach -c "$1"
      ;;
    agent)
      local session
      session="$(work_agent_session_name "$1")" || return 1
      zellij attach -c "$session" options \
        --default-shell /bin/zsh \
        --default-layout agent \
        --pane-frames false \
        --auto-layout false \
        --session-serialization false \
        --disable-session-metadata true
      ;;
    help|*)
      cat <<'EOF'
work usage:
  work up                Start dashboard session (moonrise)
  work down              Remove dashboard + agent sessions
  work reset             Recreate everything
  work ls                List managed sessions
  work attach <name>     Attach to any session
  work agent <1..8>      Attach to one agent session
EOF
      ;;
  esac
}

start-work() { work up "$@"; }
stop-work() { work down "$@"; }
