# Token Economics Decision Card

The numbers first: opening a session costs roughly 25-45K tokens before you type anything (system prompt, tools, CLAUDE.md, MCP definitions). The smart zone is roughly the first 80-100K of a 200K window. The auto-compact buffer reserves ~33K. Treat 40% on `/context` as a yellow light.

## Clear, compact, or keep going?

| Situation | Move | Why |
|-----------|------|-----|
| Switching to a different task | `/clear` | Statelessness is a feature. CLAUDE.md carries what matters; old context is dead weight |
| Same feature, past ~60% of the window | `/compact` | LLM-summarized history; lossy by design but keeps the thread. Costs one slow uncached turn |
| Past 40% and the work has a natural seam | Finish the chunk, commit, `/clear` | Commits are context for the next session |
| Quality visibly degrading mid-task | Esc-Esc rewind to before the drift, or `/clear` and restate | Compacting garbage summarizes garbage |

## Switch model?

| Work | Model |
|------|-------|
| Orchestration, judgment calls, hard debugging | Opus 4.8 |
| Research, subagent bulk work, routine implementation | Sonnet 4.6 |
| Trivial transforms, log parsing, QA running | Haiku |

Farming research to Sonnet subagents cuts input cost roughly 60% versus all-Opus; summaries return to the Opus window. Two cache gotchas: a model switch is a cold-cache turn, so don't flip-flop mid-session; CLAUDE.md edits don't apply mid-session, restart to pick them up.

## Kill an MCP server?

Run `/context`. A heavyweight server preloads 15-25K tokens of tool definitions into every session, used or not.

- Used it this week, no direct-API equivalent: keep.
- Stable repeated workflow: convert with the mcp-to-skill skill, then remove.
- Can't remember last use: remove now. Re-adding takes a minute.

Every server must pay rent or get removed.

## The habit

Put context % in your status line (`/statusline`). `/usage` for account quota, `/context` at session start and before any big task. The dumb zone never announces itself.
