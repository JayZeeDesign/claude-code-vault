# Claude Code Template Vault

The companion repo for [Claude Code 101](https://www.aibuilderclub.com) by AI Builder Club. Every template, skill, hook, and agent definition from the course, ready to copy into your projects.

Nothing here is theoretical. Each file shipped real work before it earned a place in this repo.

## Install

Two scopes. Pick per file.

**Project scope** (this repo's conventions travel with the code):

```bash
cp -r claude-code-vault/.claude your-project/.claude
cp claude-code-vault/templates/CLAUDE-4-roles.md your-project/CLAUDE.md
```

**User scope** (available in every repo on your machine):

```bash
cp -r claude-code-vault/.claude/skills/grill-me ~/.claude/skills/
cp -r claude-code-vault/.claude/agents ~/.claude/agents
```

Rule of thumb: repo-specific stuff goes in the project, personal cross-repo tools go in `~/.claude`. The [write-a-skill](.claude/skills/write-a-skill/SKILL.md) skill encodes this.

Don't copy everything blindly. A skill you never use still costs its frontmatter tokens every session. Take what you need, delete the rest.

## What's inside

### CLAUDE.md templates (`templates/`)

| File | What it is |
|------|-----------|
| [CLAUDE-4-roles.md](templates/CLAUDE-4-roles.md) | The 4-role skeleton: knowledge compression, preferences, capabilities, failure log |
| [CLAUDE-screenshot-loop.md](templates/CLAUDE-screenshot-loop.md) | Website-building CLAUDE.md with the build-screenshot-compare-iterate loop |
| [workspace/](templates/workspace/) | Business, client, and personal workspace CLAUDE.md trio + folder layout |

### Skills (`.claude/skills/`)

| Skill | What it does |
|-------|-------------|
| [grill-me](.claude/skills/grill-me/SKILL.md) | Relentless one-question-at-a-time requirements interview |
| [ship](.claude/skills/ship/SKILL.md) | Definition-of-done workflow: implement, typecheck, test, commit |
| [prd-to-backlog](.claude/skills/prd-to-backlog/SKILL.md) | Break a PRD into GitHub issues as tracer-bullet vertical slices |
| [security-audit](.claude/skills/security-audit/SKILL.md) | The five-front audit: secrets, authz, input validation, dependencies, endpoints |
| [consensus](.claude/skills/consensus/SKILL.md) | Stochastic consensus: N subagents, one question, tally the answers |
| [debate](.claude/skills/debate/SKILL.md) | Multi-round debate between agents that see each other's answers |
| [mcp-to-skill](.claude/skills/mcp-to-skill/SKILL.md) | Convert a working MCP workflow into a direct-API skill |
| [email-labeler](.claude/skills/email-labeler/SKILL.md) | Provider-agnostic inbox triage skeleton (Lab 3 starting point) |
| [write-a-skill](.claude/skills/write-a-skill/SKILL.md) | The meta-skill: encodes skill conventions so new skills come out consistent |

### Commands (`.claude/commands/`)

| Command | What it does |
|---------|-------------|
| [/review](.claude/commands/review.md) | Staged-diff review: bugs, conventions, security |
| [/update-doc](.claude/commands/update-doc.md) | Scan recent changes, update docs and the CLAUDE.md failure log |
| [/retro](.claude/commands/retro.md) | Post-build retro: what could have been faster, what to teach CLAUDE.md |

### Agents (`.claude/agents/`)

| Agent | What it does |
|-------|-------------|
| [researcher](.claude/agents/researcher.md) | Sonnet, read + web tools only, summarizes up to the orchestrator |
| [reviewer](.claude/agents/reviewer.md) | Zero-context code reviewer, fresh eyes by design |
| [qa-runner](.claude/agents/qa-runner.md) | Runs test suites, reports failures structurally |
| [shadcn-ui-builder](.claude/agents/shadcn-ui-builder.md) | shadcn/ui component and block specialist |
| [vercel-ai-sdk-expert](.claude/agents/vercel-ai-sdk-expert.md) | Vercel AI SDK v5 implementation specialist |

### Hooks (`.claude/hooks/`)

| File | What it does |
|------|-------------|
| [README.md](.claude/hooks/README.md) | How to install each hook into settings.json |
| [settings-snippets.json](.claude/hooks/settings-snippets.json) | Format-on-edit, dangerous-bash guard, stop chime |
| [pre-commit](.claude/hooks/pre-commit) | Git pre-commit gate: typecheck + tests before any commit lands |

### Ralph kit (`ralph/`)

| File | What it does |
|------|-------------|
| [README.md](ralph/README.md) | The HITL-first safety progression and prereq checklist |
| [prompt.md](ralph/prompt.md) | The loop prompt: read state, pick the most important task, ship, commit |
| [once.sh](ralph/once.sh) | Single supervised iteration |
| [loop.sh](ralph/loop.sh) | AFK loop with iteration cap and stop conditions |

### Decision cards (`cards/`)

| Card | The decision it makes |
|------|----------------------|
| [token-economics.md](cards/token-economics.md) | Clear vs compact vs model switch vs kill an MCP |
| [parallelism.md](cards/parallelism.md) | Subagents vs agent view vs agent teams vs dynamic workflows |
| [automation-tiers.md](cards/automation-tiers.md) | HTTP vs browser vs computer use |
| [terminal-moves.md](cards/terminal-moves.md) | The 10 terminal fluency moves |

## Versioning

v1.0, June 2026. Verified against Claude Code docs as of this date: Opus 4.8 and Sonnet 4.6 as the current models, skills with progressive disclosure, hooks in settings.json, agent definitions in `.claude/agents/`. When the tool moves, this repo moves.

## License

MIT. Use it, fork it, ship with it.

## Attribution

Pattern origins and credits are documented in [SOURCES.md](SOURCES.md).

## Community skills worth studying

Curated from GitHub, June 2026. Different authors, all active, licenses checked. Audit any third-party skill before installing - read the SKILL.md and every bundled script, because skills execute code. Borrow patterns, keep your set small.

| Repo | Author | What it is | License |
| --- | --- | --- | --- |
| [anthropics/skills](https://github.com/anthropics/skills) | Anthropic | Official pack: frontend-design, mcp-builder, webapp-testing, skill-creator, plus document skills (xlsx, docx, pdf, pptx) | per-skill |
| [obra/superpowers](https://github.com/obra/superpowers) | Jesse Vincent | The biggest community framework: brainstorm -> plan -> subagent execution -> TDD -> review. Study the structure even if you adopt none of it | MIT |
| [trailofbits/skills](https://github.com/trailofbits/skills) | Trail of Bits | Security research and vulnerability-audit skills from a real security firm. Pairs with our security-audit skill | CC-BY-SA-4.0 |
| [garrytan/gstack](https://github.com/garrytan/gstack) | Garry Tan (YC) | A full agentic coding stack (AGENTS.md, architecture, browser, design docs) - a reference setup, not a skill pack | MIT |
| [thedotmack/claude-mem](https://github.com/thedotmack/claude-mem) | thedotmack | Persistent cross-session memory via hooks - captures what your agent does and restores context | Apache-2.0 |
| [JuliusBrussee/caveman](https://github.com/JuliusBrussee/caveman) | Julius Brussee | Token-diet skill claiming ~65% cuts - pairs with lesson 1.4's token economics | MIT |
| [OthmanAdi/planning-with-files](https://github.com/OthmanAdi/planning-with-files) | Othman Adi | Crash-proof markdown planning for long agentic tasks - complements the PRD/plan chain | MIT |
| [blader/humanizer](https://github.com/blader/humanizer) | blader | Strips AI tells from generated writing - useful for content workflows | MIT |
| [JimLiu/baoyu-skills](https://github.com/JimLiu/baoyu-skills) | Jim Liu (Baoyu) | Content-creation skill pack from one of the most-followed CN AI authors | check repo |
| [nowork-studio/NotFair](https://github.com/nowork-studio/NotFair) | nowork.studio | SEO, GEO, Google Ads, and Meta Ads skills - marketing automation for builders | MIT |
| [lackeyjb/playwright-skill](https://github.com/lackeyjb/playwright-skill) | lackeyjb | Model-invoked Playwright browser automation - tier 2 of the automation ladder | MIT |
