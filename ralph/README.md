# Ralph Kit

The Ralph loop: the same prompt run repeatedly, with commits as the memory between iterations. Named for Geoffrey Huntley's "Ralph Wiggum as a software engineer" essay. Each iteration reads the repo's state, picks the most important open task, ships it via /ship, commits, and exits. The harness reruns it.

The endgame is coming back to finished work. Getting there is a progression, not a switch.

## Prereqs (all of them, no exceptions)

Autonomy without these is a slot machine:

- [ ] **Green CI.** A red suite makes every future failure ambiguous. Fix it first.
- [ ] **Boundary tests** that actually verify behavior. Tests are the only quality signal the loop gets.
- [ ] **The /ship skill** installed (in this vault). It is the unit of work each iteration runs.
- [ ] **Pre-commit gate** installed (hooks pack). Every commit becomes a verified checkpoint; the loop cannot land broken work.
- [ ] **A backlog**: GitHub issues from the prd-to-backlog skill, or a plan file with open tasks. Only `afk`-labeled work belongs in the queue.
- [ ] **Stop chime hook** so you hear when it needs you.

## The progression

### Stage 1: HITL (start here, always)

Run iterations one at a time and watch:

```bash
./once.sh
```

Watch 3-4 full cycles. Every time the loop picks the wrong task, misreads the repo, or thrashes, fix the cause: a clearer issue, a CLAUDE.md fact, a sharper line in `prompt.md`. You are debugging the loop, not the code.

### Stage 2: AFK, in a sandbox

Only after HITL runs are boring:

```bash
./loop.sh 5
```

Run inside isolation: a Docker container or devcontainer where the agent cannot reach your real filesystem, or at minimum the sandboxed Bash tool. **Never run bypass permissions on your raw machine.** Every story in the rm -rf genre starts with someone who skipped this paragraph.

`loop.sh` caps iterations and stops early when the backlog is empty, an iteration fails, or a stop file appears (`touch .ralph-stop`).

### What stays HITL forever

Planning, architecture sign-off, QA feel, UX judgment. The loop does the verifiable middle; taste is yours. After any AFK run, QA the commits it left like a reviewer, not a proud parent.

## Cost note

Each iteration is a full session: budget roughly what a normal /ship session costs you, times the cap. Start with caps of 3-5, not 50.
