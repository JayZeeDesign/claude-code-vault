# Automation Tiers Decision Card

Everything inside the repo automates with skills and loops. For the rest of your work, pick the right tier. The wrong tier costs 10x in tokens or 10x in setup time.

## The three tiers

| Tier | Speed | Cost/run | Setup | Breaks when | Use for |
|------|-------|----------|-------|-------------|---------|
| **HTTP/API** | Fast | Cents | Highest (auth, docs) | API changes (rare, versioned) | Anything you'll run weekly+ with a documented API |
| **Browser automation** | Slower | Tens of cents | Low (Chrome integration) | Site redesigns | JS-only sites, no API, form flows, data extraction |
| **Computer use** | Slowest | Dollars per task | Lowest | UI moves at all | Native apps, file dialogs, legacy tools; nothing else reaches them |

Each tier down is roughly an order of magnitude slower and costlier per run, but cheaper to start.

## The rule: prototype up, productionize down

Prototype one tier up (general, low setup), productionize one tier down (fast, cheap, brittle in ways you now understand).

- Prototype with browser automation to learn the workflow, then productionize as a direct-API script once you know which 3 endpoints matter.
- Prototype with an MCP server, then convert to a skill with a bundled script (the mcp-to-skill skill in this vault). Same move, one level lower.
- Computer use is the prototype surface of last resort. If a task succeeds there, immediately ask: can a browser script do it? Can an API?

## Decision walk

1. Does a documented API cover the task? HTTP tier. Let Claude curl it once before building anything.
2. No API, but it's in a browser? Browser tier.
3. Native app or file dialog in the way? Computer use, and budget for it.
4. Will this run more than weekly? Whatever tier you prototyped in, productionize one down.

## Scheduling whatever you built

- **Routines** (Anthropic cloud): runs with your repo on a schedule or GitHub events; your machine can be off.
- **Desktop scheduled tasks**: local machine, local file access.
- **/loop**: in-session repetition; polling and watch-loops while you work.

ToS note: platform automation can violate terms of service. Know where the line is for each service you touch.
