# The Three-Workspace Pattern

From Claude Code 101, lesson 4.6. Once Claude Code runs your non-code work too, you need an org system. Three workspaces, three CLAUDE.md files, hard walls between them.

## Layout

```
~/work/
  business/
    CLAUDE.md          <- business-CLAUDE.md from this folder
    .env               <- your company's API keys, never a client's
    .claude/skills/    <- skills that act on YOUR business
    active/            <- work products in progress
  clients/
    acme/
      CLAUDE.md        <- client-CLAUDE.md, filled in per client
      .env             <- THEIR keys, isolated here
      .claude/skills/
      active/
    other-client/
      ...
  personal/
    CLAUDE.md          <- personal-CLAUDE.md
    active/
```

## Why the walls matter

- **Keys**: a client's Stripe key in your business `.env` is one wrong session away from a very awkward email. Each workspace gets its own `.env`. Claude reads variable names, never values.
- **Confidentiality**: client A's numbers must never appear in client B's deliverable. Separate folders means separate sessions means separate context.
- **Context quality**: a CLAUDE.md that tries to describe your business AND three clients AND your personal life wastes tokens in every session and helps in none.

## Install

1. Create the folders above.
2. Copy each template into place and fill in the bracketed sections. 15 minutes of writing, paid back every session.
3. Set a different terminal color theme for `personal/`. A context cue costs nothing and prevents the "wrong workspace" class of mistake.
4. Cross-reference: the business CLAUDE.md lists active clients by folder path so a business session knows where client work lives without loading it.

## Hygiene rules (all three workspaces)

- Never pollute the workspace root. Work products go in `active/`.
- Skills declare their output paths. No skill writes to root.
- Monthly: "clean my active folder" prompt. Archive what shipped, delete what died.
