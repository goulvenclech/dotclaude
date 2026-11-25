---
description: Plan large work before any code is written, on top of an investigation, to clarify it, write what must hold, and split it when justified. Read-only. Skip it on a short task.
argument-hint: <feature, fix, or ticket>
---

The plan rests on an investigation. Reuse the one already in the conversation or the task (report or ledger). Otherwise run the `investigate` skill first, and resume it later if the plan hinges on a point it left open. No ad hoc lookups of your own.

Ask only the questions that change the plan and that the task, the code, and the investigation leave open. Where the idiomatic answer is evident, take it and state it. Wait for the answers.

Write what must hold, each section only if it applies and as short as it can be: goal, behaviour (observable outcomes, edge and error cases), constraints (performance, compatibility, migration, security), gotchas from the investigation with their evidence, out of scope, done when (a check that runs the behaviour: an end-to-end test, a scenario, or a command; one per slice when split). Link the ledger. Leave generic quality (tests, lint, conventions) to AGENTS.md and the agent prompts. Splitting is optional: by default the work lands as one MR/PR of one or two commits. Split only when something clearly justifies it (a separate review or deploy, a risky migration, a dependency on another team), into independently shippable slices, in order. Close with `build-this` as the next step.

Every constraint, gotcha, and question traces back to the task, the code, or the ledger. When in doubt, drop it. If the task is too under-specified for more than guesswork, stop at the questions. Read-only: only the investigation writes, under its own rules.

## Task

$ARGUMENTS
