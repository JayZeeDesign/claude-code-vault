# Terminal Fluency: the 10 Moves

The mechanics that compound. Run each once and they're yours. Print this.

| # | Move | Keys / command | What it buys you |
|---|------|----------------|------------------|
| 1 | File references | `@path/to/file` (Tab completes) | Files land in context directly; zero exploration tokens. Stack several in one prompt |
| 2 | Inline bash | `! pnpm typecheck` | Runs immediately, output lands in context. No "can you run..." round trip |
| 3 | Background a process | Ctrl+B on a running command | Dev server keeps running; arrow down to its logs; Claude reads them while debugging |
| 4 | Suspend the session | Ctrl+Z, then `fg` to return | Drop to your shell mid-session. Commands you run there are invisible to Claude |
| 5 | Stash a prompt | Ctrl+S | Half-written prompt saved; ask something else; stash reappears |
| 6 | Paste images | Paste straight into the prompt | Screenshots are first-class input: designs, error states, diagrams |
| 7 | Rewind | Esc-Esc | History list with 3 restore options: code+conversation, conversation only, code only. Restores via checkpoints, not git |
| 8 | Resume sessions | Ctrl+C twice quits; `claude --resume <id>` or `/resume` | Sessions persist. `--teleport` moves one between surfaces |
| 9 | Read the dashboards | `/usage` and `/context` | `/usage` = account quota and what drives limits. `/context` = window breakdown including the ~33K auto-compact buffer. Make `/context` a habit |
| 10 | Verbose mode | Ctrl+O | Watch every tool call as it happens. The fastest way to learn how Claude actually works |

## The three that change daily work most

- **Move 1**: every prompt that names files should @-reference them. The difference is paying for exploration or not, every single time.
- **Move 7**: rewind beats prompting "undo that". When a direction is wrong mid-execution, Esc-Esc to before the wrong turn and restate. Code+conversation restore for a full rewind.
- **Move 9**: nobody notices entering the dumb zone. `/context` at 40% is your yellow light (see the token-economics card).
