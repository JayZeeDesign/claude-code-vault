---
name: security-audit
description: Use when auditing a codebase before it goes public-facing, after a lab build, or on any periodic security pass. Checks secrets in code and history (including Claude Code transcripts), authorization and RLS, input validation, dependency red flags, and exposed endpoints.
---

# Security Audit

**Run this in a FRESH session.** An auditor that helped write the code shares its blind spots. Zero context is the feature: `/clear` first, or open a new session, then invoke this skill.

Work through all five fronts. For each finding report: severity (critical/high/medium/low), file and line, the attack it enables, and the fix. No hand-waving; every finding gets a concrete fix.

## 1. Secrets in code and history

- Grep the working tree for key patterns: `sk-`, `sk_live`, `AKIA`, `ghp_`, `-----BEGIN`, `password\s*=`, `token\s*=` with literal values.
- Check git history, not just HEAD: `git log -p | grep` for the same patterns. A key deleted in a later commit is still leaked.
- Check `.env` is gitignored and no `.env*` file is tracked.
- **The one everyone misses**: Claude Code transcripts. Every paste lands in `~/.claude` session JSONL files forever. Search them: `grep -rl "sk-\|sk_live\|AKIA" ~/.claude/projects/ 2>/dev/null`. If keys appear, instruct the user to rotate them. Deleting the transcript does not unleak a key.

## 2. Authorization and RLS

- Every endpoint that reads or writes user data: where is the ownership check? "The frontend only shows your own data" is not a check.
- Supabase/Postgres: confirm RLS is enabled on every table with user data and policies are default-deny. List any table where RLS is off.
- Look for IDs accepted from the client and used in queries without verifying the session user owns them.

## 3. Input validation

- Every external input (request bodies, query params, webhooks, file uploads): is it validated at the boundary with a schema, or trusted?
- Raw string interpolation into SQL, shell commands, or HTML.
- File uploads: type, size, and path checks.

## 4. Dependencies

- Scan recently added dependencies for typosquats: names one edit away from popular packages (models hallucinate package names; attackers pre-register the typos). Verify each new package exists on the registry with real download numbers and a real repo.
- Flag packages with install scripts doing anything unusual.
- Run the ecosystem's audit command (`pnpm audit`, `pip-audit`) and triage criticals.

## 5. Exposed endpoints

- Enumerate every route. For each: is it meant to be public? Debug routes, admin panels, `/dev/*` prototypes, and webhook endpoints without signature verification all count as findings.
- Check CORS configuration and any wildcard origins.
- Confirm secrets are not shipped to the client bundle (search build output for key patterns).

## Output

A findings table sorted by severity, then a "fix now" list of the top 3. Offer to fix the top finding immediately.
