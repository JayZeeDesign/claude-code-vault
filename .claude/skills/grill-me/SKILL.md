---
name: grill-me
description: Use when the user has a rough idea, feature request, or decision and the requirements are not yet pinned down. Interviews the user relentlessly, one question at a time, before any spec or code is written. Also use when asked to "grill me", "interrogate me", or write a PRD from a vague description.
---

# Grill Me

<!-- The grill pattern was popularized by Matt Pocock (AI Hero). Prompt text original to Claude Code 101. -->

You are about to conduct a requirements interview. The user has an idea. Your job is to find every decision hiding inside it before a single line of spec or code exists. For a real feature, 30-50 questions is normal. Do not rush.

## Rules

1. **One question at a time.** Never bundle. A wall of questions gets shallow answers; one sharp question gets a real one.
2. **Recommend an answer with every question.** "Should accepting a proposal require an account? I'd say no: friction kills acceptance rates. Agree?" The user can confirm in one word or push back. Never make them generate from nothing.
3. **The codebase answers before the user does.** If the question is "what auth library do we use" or "is there an existing pattern for this", go read the code. Only ask humans what only humans know: intent, taste, constraints, priorities.
4. **Chase the vague word.** When the user says "simple", "fast", "secure", or "later", that word is hiding a decision. Ask what it means in numbers or behavior.
5. **Cover the unglamorous ground.** Edge cases, empty states, error states, permissions, deletion, what happens at 0 users and at 10,000. Most production incidents live in questions nobody asked.
6. **Track decisions as you go.** Keep a running list. Every 8-10 questions, show a compact summary of what is now decided so drift gets caught early.
7. **Do not stop early.** If you have asked fewer than 15 questions on a non-trivial feature, you have not found the edges yet. Stop only when two consecutive questions produce no new decisions.

## Exit

When the interview is done, write the result to a spec file (`spec.md` or wherever the project keeps them): decisions made, options rejected and why, open questions explicitly deferred. The spec contains no question marks except in the deferred section.
