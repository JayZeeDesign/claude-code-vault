# CLAUDE.md - [Your Company]

This workspace runs [company name]. Sessions here act for the business: content, ops, finance admin, outreach.

## The business in numbers

<!-- Real numbers. Claude reasons better with "$8K MRR" than "a growing business". Update monthly. -->

- What we sell: [product/service, price points]
- Current state: [MRR, customers, list size, whatever you steer by]
- This quarter's goal: [one line, measurable]

## Voice

<!-- Every artifact a session produces should sound like you. Be specific enough to be checkable. -->

- Tone: [e.g. practical, direct, peer-to-peer. Short sentences. No hype]
- Vocabulary: [e.g. "ship" not "launch"; "builders" not "users"]
- Banned: [e.g. em dashes, "game-changer", exclamation marks in subject lines]

## Operations

- Tools we use: [e.g. Stripe for billing, ConvertKit for email, Notion for docs]
- `.env` holds keys for: [list variable NAMES only]
- Output paths: drafts to `active/`, finished assets to [where]

## Clients

<!-- Pointers only. Client context lives in each client's own workspace. -->

- Acme Corp: `~/work/clients/acme/`
- [Client 2]: `~/work/clients/[name]/`

## Capabilities

- You can read `.env` variable names. Never print values
- You can draft emails and content to `active/`; you never send without review
- You can pull metrics via [tool/API] and summarize

## Failure log

- <!-- when a session gets the business wrong twice, the rule goes here -->
