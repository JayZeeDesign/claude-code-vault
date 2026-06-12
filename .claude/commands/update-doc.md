Bring the docs back in sync with the code, then update the CLAUDE.md failure log.

1. Scan what changed: `git log --oneline -15` and `git diff HEAD~5 --stat` (adjust the range to cover the recent work; use $ARGUMENTS as the range if provided).
2. For each changed area, check the docs that describe it: README, docs/, inline usage examples, API references. List every place where the docs now lie: renamed commands, changed flags, moved files, new env vars, removed features.
3. Fix them. Match the existing doc style. Do not rewrite sections that are still accurate; surgical edits only.
4. CLAUDE.md pass:
   - Update any project facts the changes invalidated (commands, paths, stack).
   - Failure log: if this stretch of work involved a correction or repeated mistake, add a dated one-line rule for it. If a logged rule is now obsolete, remove it. Stale rules are worse than none.
5. Report: files touched, lies fixed, failure log entries added or removed. If everything was already in sync, say so and stop.
