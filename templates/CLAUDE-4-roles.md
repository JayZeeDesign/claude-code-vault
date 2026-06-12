# CLAUDE.md

<!--
The 4-role CLAUDE.md skeleton from Claude Code 101, lesson 1.2.

Every line in this file is injected at the top of every session. A wasted
line taxes every future session. A good line replaces an expensive
exploration: a 22-line CLAUDE.md can stand in for an 1,100-token file read.

Fill in each role. Delete every comment and every line you don't need.
Keep the whole file under 200 lines. Prune quarterly: contradictions make
Claude pick randomly between your rules.
-->

## Project facts

<!--
ROLE 1: KNOWLEDGE COMPRESSION
Repo facts Claude would otherwise re-discover by reading files. Stack,
commands, architecture in one line each. Specific beats vague.
-->

- Stack: <!-- e.g. Next.js 15 App Router, Supabase, Tailwind, pnpm -->
- Run: `pnpm dev` | Typecheck: `pnpm typecheck` | Test: `pnpm test`
- Source layout: <!-- e.g. app/ routes, lib/ shared logic, components/ UI -->
- Database: <!-- e.g. Supabase Postgres, migrations in supabase/migrations/, RLS on every table -->
- Anything named `*-service.ts` gets a matching `*.test.ts` <!-- jargon anchors like this outlive file lists -->

## Conventions

<!--
ROLE 2: PREFERENCES AND CONVENTIONS
Things you would otherwise re-type every session. Make each one checkable.
"Use 2-space indentation" works. "Format properly" does not.
-->

- <!-- e.g. 2-space indentation, no semicolons, prettier handles the rest -->
- <!-- e.g. Server components by default; "use client" only when interaction demands it -->
- <!-- e.g. Errors: throw typed errors from lib/errors.ts, never raw strings -->
- <!-- e.g. Never use em dashes in user-facing copy -->

## Capabilities

<!--
ROLE 3: CAPABILITY DECLARATIONS
Claude underestimates its own agency. Remind it what it can and should do
in this repo without asking.
-->

- You can run the dev server, take screenshots, and read its logs
- You can read `.env` variable NAMES. Never print values
- You can run `gh` for issues and PRs
- After any UI change, screenshot the result and compare before declaring done

## Failure log

<!--
ROLE 4: FAILURE LOG
The compounding role. When Claude makes the same mistake twice, the rule
goes here. Trigger list: a repeated mistake, a review catch it should have
known, a correction you re-typed.
-->

- <!-- e.g. 2026-06-02: imported from "react-dom/server" in a client component; broke the build. Rule: check the file's directive before adding imports -->
- <!-- e.g. 2026-06-09: wrote a migration without a down(). Rule: every migration includes a rollback -->
