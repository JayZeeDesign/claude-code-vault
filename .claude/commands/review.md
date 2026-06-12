Review the staged diff before it becomes a commit.

Run `git diff --staged`. If nothing is staged, review `git diff` instead and say so.

Check three fronts, in order:

1. **Bugs**: logic errors, off-by-ones, unhandled error paths, race conditions, broken edge cases (empty input, null, concurrent calls). Trace each changed function's callers; a correct change in the wrong context is still a bug.
2. **Conventions**: does the change match this repo's patterns (naming, file placement, error handling, test coverage per CLAUDE.md)? Flag missing tests for any new logic.
3. **Security**: secrets or keys in the diff, unvalidated external input, raw interpolation into SQL/shell/HTML, new dependencies (verify each name exists on the registry and is not a typosquat), authorization checks on new endpoints.

Output a table: severity (blocker/warn/nit), file:line, issue, suggested fix. Blockers are things that should not be committed. If there are no findings, say so in one line; do not invent nits to look thorough.

Extra focus area if provided: $ARGUMENTS
