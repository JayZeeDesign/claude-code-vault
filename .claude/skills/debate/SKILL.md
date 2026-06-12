---
name: debate
description: Use when a question has real trade-offs and no single right answer: architecture choices, library selection, design direction. Runs a multi-round debate where agents see each other's positions across rounds, converge, and a synthesis is produced. For factual questions, use consensus instead.
---

# Debate

Consensus counts independent answers. Debate makes the answers fight. Use it when the value is in the arguments, not the tally: trade-off decisions where you want the strongest case for each side before choosing.

## Procedure

**Round 1 - positions.** Spawn 3 subagents in parallel with the same fully-specified question and distinct stances: one argues the boldest option, one the most conservative, one optimizes for long-term maintenance. Each produces: position, top 3 arguments, and the strongest objection to itself it can think of.

**Round 2 - rebuttals.** Spawn 3 fresh subagents (subagents don't persist; the transcript is the memory). Each gets the question plus ALL Round 1 positions, assigned to defend one position: rebut the other two's best arguments, concede any point that is simply correct, update the position if a rebuttal fails. Forced concessions are the mechanism; a debate where nobody concedes anything is theater.

**Round 3 - convergence (only if Round 2 moved positions).** One subagent gets the full transcript and writes where the positions now agree, where they still differ, and what fact or constraint would settle each remaining difference.

## Synthesis

You (the orchestrator) write the final answer, not a subagent:

- The recommendation, in one line
- The arguments that survived rebuttal (these are the durable reasons)
- The concessions made (these are the recommendation's known costs)
- The conditions under which the losing option wins ("if you expect 10x traffic in year one, flip this")

Three agents, two to three rounds. More agents add cost faster than insight. If Round 1 comes back unanimous, stop there and say so; the debate was already settled.
