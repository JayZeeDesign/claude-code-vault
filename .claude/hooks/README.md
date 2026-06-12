# Hooks Pack

CLAUDE.md raises the odds Claude does the right thing. Hooks remove the odds from the equation. These are the three hook patterns from Claude Code 101 lesson 3.5, plus the git pre-commit gate.

## Install the settings.json hooks

The hooks live in `settings-snippets.json`. They are NOT active until merged into your settings:

1. Open (or create) `.claude/settings.json` in your project. Use `.claude/settings.local.json` for personal-only hooks, or `~/.claude/settings.json` for every repo.
2. Copy the `hooks` object from `settings-snippets.json` into it. If you already have a `hooks` key, merge the arrays entry by entry. Delete the `_comment` key.
3. Restart the session, then run `/hooks` to confirm all three loaded.

Requires `jq` (`brew install jq`).

### What each one does

| Hook | Event | Effect |
|------|-------|--------|
| Prettier format-on-edit | PostToolUse on Edit/Write | Formats every file Claude touches. You never argue about formatting again |
| Dangerous-bash guard | PreToolUse on Bash | Blocks `rm -rf /`, force-pushes to main, `git reset --hard`, disk-level commands. Exit code 2 = blocked, and Claude sees the reason |
| Migration-dir guard | PreToolUse on Edit/Write | Blocks edits to `migrations/` folders. Applied migrations are immutable; new changes get new files |
| Stop chime | Stop | Plays a sound when a session stops and needs you. The multi-session enabler |

Adjust to taste: the bash guard's regex is a starting set, not a complete one. The chime uses macOS `afplay` with a terminal-bell fallback; on Linux swap in `paplay` or `notify-send`.

## Install the git pre-commit gate

The `pre-commit` file in this folder runs typecheck + tests before any commit lands. Pre-commit friction that annoys humans is free for agents: Claude waits, reads the failure, and fixes it unprompted. Every commit becomes a verified checkpoint, which is what makes autonomous loops (see `ralph/`) safe to run.

```bash
cp .claude/hooks/pre-commit .git/hooks/pre-commit
chmod +x .git/hooks/pre-commit
```

Then open it and resolve the TODO markers: point the typecheck and test variables at your project's real commands. It ships framework-agnostic with auto-detection for common setups.

Using husky instead? Copy the script body into `.husky/pre-commit`.
