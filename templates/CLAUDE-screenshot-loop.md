# CLAUDE.md

<!--
The screenshot-loop CLAUDE.md from Claude Code 101, Lab 1.

Without a verify step Claude one-shots a design at roughly 80% and stops.
With this loop it iterates to 95%+. The loop IS the difference. Expect
3-4 screenshot rounds per build.

Drop this file into any website project. Fill in the project facts.
-->

## Project facts

- Static site / <!-- or your framework: Next.js, Astro, plain HTML -->
- Run locally: `pnpm dev` on port 3000 <!-- adjust -->
- Deploy: Netlify <!-- or Vercel; Claude can run the CLI deploy -->

## The screenshot loop

When given a reference image, follow this loop. Do not skip steps.

1. **Study the reference.** Before writing code, describe the visual language: spacing system, type scale, color logic, layout grid. You are borrowing the language, never the content.
2. **Build.** Implement the page or section.
3. **Screenshot your result.** Run the dev server, capture the rendered page at 1440px wide. Capture the full page, not the viewport.
4. **Compare.** Put your screenshot next to the reference. List concrete differences: "heading is 32px, reference reads closer to 56px", "section padding is half the reference's". Vague observations don't count.
5. **Iterate.** Fix the listed differences. Return to step 3.
6. **Stop** when a comparison pass finds no differences worth fixing, or after 5 rounds. Then check mobile: re-screenshot at 390px wide and fix anything broken.

## Rules

- Never declare a visual task done without a screenshot of the result
- One change-set per iteration. Don't batch unrelated fixes with visual fixes
- Real content beats lorem ipsum the moment copy exists. Ask for it after round 2
- Reference images live in `reference/`. Screenshots go in `.screenshots/` (gitignored)

## Failure log

- <!-- add entries as the loop teaches you; see the 4-roles template -->
