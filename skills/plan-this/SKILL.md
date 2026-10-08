---
description: Plan a feature or fix before any code is written, on top of an investigation. Read-only.
argument-hint: <feature, fix, or ticket>
---

The plan rests on an investigation. Reuse the one already in the conversation or the task (report or ledger). Otherwise run the `investigate` skill first, and resume it later if the plan hinges on a point it left open. No ad hoc lookups of your own.

Ask only what changes the plan and what the task, the code, and the investigation leave open. Where the idiomatic answer is evident, take it and state it. Wait for the answers.

Write what must hold, each section only if it applies and as short as it can be: goal, behaviour (observable outcomes, edge and error cases), constraints (performance, compatibility, migration, security), gotchas from the investigation with their evidence, out of scope, done when. Link the ledger. Leave generic quality (tests, lint, conventions) to AGENTS.md and the agent prompts. Split work that clearly exceeds a day into independently shippable slices, in order.

Every constraint, gotcha, and question traces back to the task, the code, or the ledger. When in doubt, drop it. If the task is too under-specified for more than guesswork, stop at the questions. Read-only: only the investigation writes, under its own rules.

## Task

$ARGUMENTS
