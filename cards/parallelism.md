# Parallelism Decision Card

Past a certain skill level your bottleneck isn't Claude's speed, it's that you run one of it. Four surfaces, one decision: who coordinates, do workers need to talk, do tasks touch the same files?

## The four surfaces

| Surface | What it is | Reach for it when |
|---------|-----------|-------------------|
| **Subagents** | Delegation inside one session; worker burns its own window, returns a summary | Side tasks that would flood your window: research, review, test runs |
| **Agent view** | `claude agents`: dispatch independent background sessions, one monitoring screen, attach when needed (research preview) | 2-5 independent tasks with no need to talk to each other. The realistic 80% of parallelism |
| **Agent teams** | Lead + teammates, shared task list, inter-agent messaging (experimental: `CLAUDE_CODE_EXPERIMENTAL_AGENT_TEAMS=1`, v2.1.32+) | Discussion genuinely helps: competing debugging hypotheses, design exploration with a devil's advocate |
| **Dynamic workflows** | A script orchestrates many subagents with cross-checks (`/workflows`) | 500-file migrations, repo-wide audits: high volume, mechanical, needs verification stages |

## The same-files problem

- Worktrees solve it: `claude --worktree` gives each session an isolated checkout. Agent view auto-isolates dispatched sessions.
- `/batch` splits one large change into 5-30 worktree-isolated subagents, each opening a PR.
- **Warning**: agent teams do NOT worktree-isolate teammates. Partition file ownership yourself or they will stomp each other.

## Reliability and cost math

- 0.95 per-task success to the 10th power = 60% chance everything succeeds. Keep per-agent tasks small and self-contained; design for one failure without redoing nine successes.
- Every teammate and dispatched session is a full session: budget multiplies linearly. Parallelize tasks with independent value, not for vibes.
- Skip parallelism entirely for single lookups; spawn cost exceeds the savings.

## Quick picks

- "Review this while I keep building" - subagent (the reviewer agent in this vault)
- "These three bugfixes are unrelated" - agent view, worktrees
- "We need to argue about this architecture" - agent team, 3 teammates max
- "Rename this pattern across 400 files and verify each" - dynamic workflow
