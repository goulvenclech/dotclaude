---
description: Review the uncommitted changes in the working tree, triage each critique with a fixer, and report. Read-only.
argument-hint: [focus or context]
---

When the changes rest on an issue, a PR, or external behaviour, have the `analyst` fetch it first. Skip that for small self-contained changes.

Run the `reviewer` on the current uncommitted diff (point it at the working state, never paste a diff), with the analyst's brief if any. On `LGTM`, report it and stop. Otherwise one `fixer` per critique in parallel.

Report the critiques grouped by verdict, each with `file:line`, why, and the fix direction in prose. `Ambiguous` ones become questions for the user. List the reproduction tests fixers left behind. Nothing else is modified.

## Task

$ARGUMENTS
