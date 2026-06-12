#!/usr/bin/env bash
# Ralph: AFK loop with iteration cap and stop conditions.
#
# SAFETY: run this inside a sandbox (Docker/devcontainer) only. Never with
# bypass permissions on your raw machine. See README.md prereqs first.
#
# Usage: ./loop.sh [max_iterations]   (default 5)
# Stop early any time with: touch .ralph-stop
set -euo pipefail

MAX_ITERATIONS="${1:-5}"
RALPH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$RALPH_DIR/prompt.md"
STOP_FILE=".ralph-stop"
LOG_DIR=".ralph-logs"

[ -f "$PROMPT_FILE" ] || { echo "ralph: prompt.md not found next to loop.sh" >&2; exit 1; }
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "ralph: run from inside a git repo" >&2; exit 1; }
mkdir -p "$LOG_DIR"
rm -f "$STOP_FILE"

echo "ralph: AFK loop, cap $MAX_ITERATIONS. Stop early: touch $STOP_FILE"

for i in $(seq 1 "$MAX_ITERATIONS"); do
  if [ -f "$STOP_FILE" ]; then
    echo "ralph: stop file found, exiting after $((i-1)) iteration(s)."
    rm -f "$STOP_FILE"
    exit 0
  fi

  LOG="$LOG_DIR/iteration-$(date +%Y%m%d-%H%M%S)-$i.log"
  echo "ralph: iteration $i/$MAX_ITERATIONS -> $LOG"

  # Each iteration is a fresh session; commits carry the memory.
  if ! claude -p "$(cat "$PROMPT_FILE")" >"$LOG" 2>&1; then
    echo "ralph: iteration $i exited nonzero. Stopping. See $LOG" >&2
    exit 1
  fi

  if grep -q "RALPH: BACKLOG EMPTY" "$LOG"; then
    echo "ralph: backlog empty after $i iteration(s). Done."
    exit 0
  fi
  if grep -q "RALPH: NEEDS HUMAN" "$LOG"; then
    echo "ralph: iteration $i needs a human. Stopping. See $LOG"
    exit 0
  fi
  if grep -q "RALPH: BLOCKED" "$LOG"; then
    echo "ralph: iteration $i blocked after retries. Stopping. See $LOG"
    exit 1
  fi
done

echo "ralph: hit the $MAX_ITERATIONS-iteration cap. QA the commits before raising it."
