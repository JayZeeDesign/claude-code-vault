---
name: email-labeler
description: Use when triaging an inbox: fetching unprocessed emails, classifying each into a label taxonomy, and applying labels via the provider's API. Provider-agnostic skeleton; scripts/label.py must be wired to your email provider before first use.
---
<!-- Pattern as taught by Nick Saraev. Prompt text original. See SOURCES.md -->


# Email Labeler

Inbox triage as a skill. The script handles fetching and labeling (deterministic); you handle classification (judgment). This is the Lab 3 artifact from Claude Code 101, stripped to a provider-agnostic skeleton.

**Setup required**: `scripts/label.py` has TODO markers for provider auth and API calls. Wire it to Gmail, Outlook, or Fastmail once; the skill works forever after. Ask Claude to do the wiring: "implement the TODOs in scripts/label.py for Gmail using the Gmail API".

## Label taxonomy

Four labels. Edit to taste; the taxonomy is the part that's yours.

| Label | Meaning |
|-------|---------|
| `action-required` | A human must do something: reply, decide, pay, sign |
| `waiting-on` | You're blocked on someone else; their reply closes it |
| `reference` | Keep: receipts, confirmations, documents worth finding later |
| `newsletter-ish` | Bulk content. Read never or in batches |

## Procedure

1. Fetch the batch: `python scripts/label.py fetch --max 50`. Returns JSON: id, sender, subject, snippet per email.
2. Classify each email into exactly one label. Rules of thumb: a question aimed at the user = `action-required`; an automated confirmation = `reference`; anything with an unsubscribe link = `newsletter-ish` unless it asks for action. When genuinely ambiguous, prefer `action-required`; a false alarm beats a missed deadline.
3. Apply: `python scripts/label.py apply --input labels.json` where labels.json maps email id to label.
4. Report counts per label and list the `action-required` subjects so the user sees what needs them.

Never delete or archive anything. Labeling only. Never label more than the fetched batch in one run.

## Scheduling

Once trusted, run it on a schedule: a `/loop` in a session, or a scheduled task invoking this skill daily. Start supervised for the first few runs; spot-check 10 classifications before going hands-off.
