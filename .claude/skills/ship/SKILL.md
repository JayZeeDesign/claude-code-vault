---
name: ship
description: Use when implementing any task that should end in a commit. Encodes the definition of done: understand, implement with red-green-refactor for backend logic, run typecheck and tests until clean, then commit. Also the unit of work for autonomous loops.
---
<!-- Workflow pattern popularized by Matt Pocock (AI Hero); red-green-refactor is Kent Beck's. Prompt text original. See SOURCES.md -->


# Ship

The definition of done. A task is shipped when this whole list has run clean, not before.

1. Understand the task. Read the relevant code before writing any. If the task is ambiguous, say what you assumed.
2. For backend logic: red-green-refactor. Write the failing test first and run it to prove it fails. Then the minimal implementation to green. Then refactor with the suite as a net.
3. For UI: implement, then verify visually (screenshot or manual check against the requirement).
4. Run the typechecker. Fix until clean.
5. Run the test suite. Fix until green. Never skip, stub out, or delete a failing test to get there; fix the cause.
6. Commit with a message that says why, not just what. One coherent change per commit.

If after 3 attempts something still fails, stop and report what you tried rather than thrashing.
