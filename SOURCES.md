# Sources and Attribution

All prompt text, scripts, and docs in this repo were written from scratch for the Claude Code 101 course by AI Builder Club. Several skills implement patterns that circulate in the Claude Code community or trace back to published engineering work. Credit where it's due:

| Asset | Pattern origin |
| --- | --- |
| `skills/grill-me` | Interrogation-before-spec pattern popularized by Matt Pocock (AI Hero) |
| `skills/ship` | Implement-validate-commit workflow pattern popularized by Matt Pocock (AI Hero); the red-green-refactor core is Kent Beck's (Extreme Programming Explained) |
| `skills/prd-to-backlog` | PRD-to-issues decomposition pattern popularized by Matt Pocock (AI Hero); vertical slices / tracer bullets from The Pragmatic Programmer (Thomas & Hunt) |
| `skills/write-a-skill` | Meta-skill pattern common in the Claude Code community, incl. Matt Pocock's variant |
| `skills/consensus`, `skills/debate` | Multi-agent consensus and debate patterns as taught by Nick Saraev, building on standard multi-agent LLM techniques |
| `skills/mcp-to-skill`, `skills/email-labeler` | MCP-prototype-to-skill conversion workflow as taught by Nick Saraev |
| `skills/security-audit` | Synthesized from community security practice, the AI Builder Club blog's MCP security guide, and Anthropic's Claude Code security docs |
| `ralph/` | The Ralph loop concept is Geoffrey Huntley's ("Ralph Wiggum as a software engineer"); HITL-to-AFK progression framing via Matt Pocock |
| `agents/shadcn-ui-builder`, `agents/vercel-ai-sdk-expert` | Modernized from AI Builder Club's own 2025 course materials |
| `templates/`, `agents/researcher|reviewer|qa-runner`, `.claude/hooks/`, `cards/` | AI Builder Club originals, encoding widely shared community practice |

Concepts and workflows are not copyrightable and these patterns belong to the commons; this file exists because crediting popularizers is the right thing to do. If you believe something here is misattributed, open an issue.
