#!/usr/bin/env bash
# Ralph: single HITL iteration. Run from your project root; watch what it does.
# Usage: ./once.sh
set -euo pipefail

RALPH_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROMPT_FILE="$RALPH_DIR/prompt.md"

[ -f "$PROMPT_FILE" ] || { echo "ralph: prompt.md not found next to once.sh" >&2; exit 1; }
git rev-parse --is-inside-work-tree >/dev/null 2>&1 || { echo "ralph: run from inside a git repo" >&2; exit 1; }

echo "ralph: one iteration, supervised. Watch it."
# -p: non-interactive prompt mode. Supervised stage uses your normal
# permission mode; do NOT add bypass flags here. Output streams to your terminal.
claude -p "$(cat "$PROMPT_FILE")"

echo ""
echo "ralph: iteration finished. Review what it committed:"
git --no-pager log --oneline -3
