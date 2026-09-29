---
description: Plan a feature or fix before any code is written.
---

## Workflow

### 1. Start from an investigation

The plan rests on an investigation, not on lookups of your own. If the conversation or the task already carries one on this subject (report or ledger), start from it. Otherwise run the `investigate` skill on the task first: its report ends the investigation, not this skill. If the plan later hinges on a point it left open, resume the investigation on that point rather than probing ad hoc.

### 2. Settle open decisions

Ask only what changes the plan and what the task, the code, and the investigation leave open. Where the idiomatic, maintainable answer is evident, take it and state it in the plan. Wait for answers before finalising.

### 3. Write the plan

What must hold, not how to code it. Only the sections that apply, each as short as possible:
- **Goal**: the change and why
- **Behaviour**: observable outcomes, edge and error cases included
- **Constraints**: performance, compatibility, migration, security…
- **Gotchas**: traps from the investigation, with their evidence
- **Out of scope**
- **Done when**: what proves it works

Link the ledger rather than restating it. Leave generic quality (tests, lint, conventions) to AGENTS.md and the agent prompts. Split work that clearly exceeds a day into independently shippable slices, in order.

## Guardrails

- **Read-only**: no edits, commits, pushes, or issue/PR creation. Only the investigation writes, under its own rules.
- **No invention**: every constraint, gotcha, and question traces back to the task, the code, or the ledger. When in doubt, drop it.
- **Honesty**: if the task is too under-specified for a plan beyond guesswork, say so and stop at the questions.

## Task

$ARGUMENTS
