---
name: mcp-to-skill
description: Use when a workflow built on an MCP server has stabilized and should become a production skill, or when the user says "convert this MCP workflow to a skill". Produces a skill with a bundled script that calls the underlying API directly, eliminating the per-session MCP token overhead.
---

# MCP to Skill

MCP is the prototype surface; skills are the production surface. A connected MCP server preloads its tool definitions into every session - a heavyweight server costs 15-25K tokens before you type anything. A skill costs its frontmatter (~60 tokens) until invoked, and a bundled script costs near zero because deterministic work happens in code, not in context. The Lab 3 email labeler measured an order of magnitude fewer tokens after conversion.

Convert when: the workflow is repeated, its steps have stabilized, and the MCP server's tools map to a documented API. Don't convert one-offs or workflows still changing shape.

## Procedure

1. **Capture the working workflow.** From the current session (or the user's description): which MCP tools get called, in what order, with what arguments, and what decisions happen between calls.
2. **Map tools to API calls.** Find the underlying service's API docs. Each MCP tool call becomes a direct HTTP request or official-client call. Note the auth model (API key, OAuth) and how the MCP server was authenticating; the script needs its own credentials path, usually an env var or a stored token file.
3. **Split judgment from determinism.** Everything mechanical (auth, pagination, retries, request shaping) goes in a script under the skill's `scripts/` directory. Everything requiring judgment (what to do with the data, edge-case decisions) stays in SKILL.md prose. If the script needs the model's judgment mid-run, restructure: script fetches, model decides, script applies.
4. **Write the script.** Single file, stdlib or minimal deps, arguments via CLI flags, results as JSON to stdout, errors to stderr with nonzero exit. Credentials from env vars; document the names, never hardcode values.
5. **Write SKILL.md** per the write-a-skill conventions: frontmatter description with "use when" triggers, body that says when to run the script, how to interpret output, and what to do on common failures.
6. **Test in a fresh session.** Invoke the skill, run the real workflow end to end. Fix until it matches what the MCP version did.
7. **Retire the server.** Remove it from MCP config. Run `/context` before and after; report the savings as a number. That number is the point.
