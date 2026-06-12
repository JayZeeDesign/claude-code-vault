---
name: write-a-skill
description: Use when creating or revising any Claude Code skill, or when the user says "write me a skill for X". Encodes the house conventions: frontmatter style, body structure, when to bundle scripts, and project vs user scope.
---
<!-- Community meta-skill pattern. Prompt text original. See SOURCES.md -->


# Write a Skill

The skill that writes skills. Follow these conventions and every new skill comes out consistent, cheap to load, and discoverable at the right moments.

## Anatomy

`.claude/skills/<kebab-name>/SKILL.md`. YAML frontmatter with exactly `name` and `description`. Only the frontmatter loads by default; the body loads on invoke. That asymmetry is the design: a 60-token frontmatter can guard an 8K-token body. Spend effort on the description, keep the body as short as the job allows.

## The description is a trigger contract

Write it as "Use when..." conditions: the situations, user phrases, and task shapes that should activate the skill. A description that describes ("helps with database work") never fires; one that triggers ("Use when writing or reviewing SQL migrations, or when the user mentions schema changes") fires exactly when needed. Include 2-3 distinct trigger conditions. If the skill is only ever user-invoked by name, the description still helps the model confirm it picked the right one.

## Body structure

1. One line restating the job.
2. Numbered procedure or short rule list. Imperative voice, addressed to the agent.
3. Constraints and failure handling: what never to do, when to stop and report.

Under 50 lines for most skills. If the body needs long reference material (API docs, schemas, examples), move it to a `REFERENCE.md` in the skill folder and point to it; it loads only when followed.

## When to bundle scripts

Deterministic work goes in `scripts/` inside the skill folder; judgment stays in prose. Signals you need a script: the same API calls every run, pagination/retries/auth, output that must be exactly formatted. Script contract: CLI flags in, JSON to stdout, errors to stderr with nonzero exit, secrets from env vars by name. If a step needs model judgment mid-script, split the script there: fetch, decide, apply.

## Project vs user scope

- Project (`.claude/skills/`): the skill encodes THIS repo's workflow, references its paths, or teammates should get it via git.
- User (`~/.claude/skills/`): personal, cross-repo, or contains your private conventions.
- When in doubt: project. Moving to user scope later is a `cp`.

## Before calling it done

Test in a fresh session: does it trigger on a natural phrasing of the task? Does the procedure run without the author in the room? Iterate on failures; treat reliability like a metric, not a vibe.
