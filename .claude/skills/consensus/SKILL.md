---
name: consensus
description: Use when a question has a factual or best-practice answer but a single response might hallucinate, or when the user asks to "get consensus" or "sanity check this with multiple agents". Spawns N subagents on the same question with varied personas and tallies answer frequency.
---

# Stochastic Consensus

One model answer is a sample. Five are a distribution. Frequency across independent samples filters hallucination: a made-up API appears once, a real one appears five times.

## Procedure

1. **Fix the question.** Compress it to one self-contained prompt with all needed context inlined. Subagents share nothing; each gets the full question.
2. **Spawn 5 subagents in parallel** (3 for cheap questions, 7 when the stakes justify it). Same question, varied personas, one line each: "answer as a skeptical staff engineer", "answer as a security reviewer", "answer as someone optimizing for simplicity", "answer as a maintainer who will own this for 5 years", "answer with no persona". Personas decorrelate the samples; the question never changes.
3. **Require structured answers.** Each subagent ends with `ANSWER: <one line>` plus brief reasoning. Unparseable answers get discarded, not interpreted.
4. **Tally.** Group equivalent answers, count frequency.

## Report

- **Consensus**: the majority answer and its count (e.g. 4/5).
- **Outliers**: every minority answer, verbatim, with one line on why it diverged. Outliers are not noise. A 1/5 answer is usually a hallucination but occasionally the only agent that spotted the real problem. Flag any outlier whose reasoning cites something specific the majority ignored.
- **Confidence**: unanimous = act on it; 3/5 split = the question was underspecified, say what's missing; no majority = report that, do not fake a winner.

Cost honesty: 5 subagents is roughly 5x the tokens of asking once. Use for decisions where being wrong costs more than the tokens.
