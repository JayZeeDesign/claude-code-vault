---
name: prd-to-backlog
description: Use when a PRD or spec exists and needs to become an executable backlog. Breaks the document into GitHub issues structured as vertical-slice tracer bullets, marks each as HITL or AFK, and files a final QA issue. Requires the gh CLI.
---
<!-- Pattern popularized by Matt Pocock (AI Hero); tracer bullets from The Pragmatic Programmer. Prompt text original. See SOURCES.md -->


# PRD to Backlog

Turn a PRD into GitHub issues that agents and humans can execute from the same board. Issues beat rigid phase documents: they reorder, they absorb QA findings as new items, and `gh` makes them agent-readable.

## Step 1: Slice vertically

Read the PRD. Decompose into slices where **each issue crosses every layer it touches** (data, logic, route, UI) and is independently verifiable. Tracer bullets, per The Pragmatic Programmer (Thomas & Hunt).

- Issue 1 is the thinnest end-to-end slice of the whole product. Simplest data, one happy path, but it works when done.
- Every later issue thickens a slice that already works.
- Reject horizontal slices. "Set up the database" is not an issue; it is the first 20 minutes of a real issue.
- Size each issue to fit one focused session, comfortably inside a context window's smart zone.

## Step 2: Mark HITL or AFK

Label every issue:

- **`hitl`**: needs human taste. Design decisions, UX judgment, architecture choices, anything where the spec says "feels right".
- **`afk`**: spec is pinned down and feedback loops (tests, typecheck, screenshot) can verify the result without a human watching. These are eligible for autonomous loops.

When unsure, mark `hitl`. A wrongly-AFK'd issue costs a bad merge; a wrongly-HITL'd one costs a few minutes of supervision.

## Step 3: File via gh

```bash
gh label create hitl --color FFA500 --force
gh label create afk --color 0E8A16 --force
gh issue create --title "..." --label afk --body "..."
```

Each issue body contains: goal (one line), the PRD section it implements, acceptance criteria as a checklist, and verification command(s). Use blocking references ("Blocked by #1") to encode order.

## Step 4: The final QA issue

Always file a last issue, labeled `hitl`: "QA pass: use the product like a user. File every flaw found as a new issue." This is where new backlog items come from after v1.

## Output

Report the issue list with numbers, labels, and the dependency chain. The backlog is now the queue for /ship sessions or a Ralph loop.
