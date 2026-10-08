---
description: Pre-commit pass on the staged diff. Gets it green, prunes comments and docs, drafts or updates the MR/PR body and the commit title, prints the commit and push command.
argument-hint: [context]
---

## 1. Green

Format, lint, type-check, and test per the project's AGENTS.md or CONTRIBUTING.md. Auto-fix format and lint findings, ask when a fix is ambiguous. Type errors and failing tests are resolved before anything else, escalate if the cause is unclear.

## 2. Comments and docs

Delegate to a cold `general-purpose` subagent, with no context from this conversation (no recap of what was built, why, or which comments you wrote) and exactly this brief:

> Run `git diff --cached`. A comment, docstring, or test description added or modified in that diff stays only if it says something the code, names, types, and tests do not: a constraint, an invariant, a non-obvious why. Delete the rest: restatements of the code or of behaviour the tests cover, changelog narration (« was », « previously », « now handles »), design decisions that do not change how the reader uses the code, decorators and separators, identifiers or specifics that go stale (doctests and contract-generating docs excepted). What survives is as short and dry as the file's existing comments, with no generated-text tell (antithesis, stock words like « ensure » or « robust », punchlines, em-dash or bold where a comma does). A comment that needs heavy rewording is deleted instead. Edit the files directly, no questions, no report, then reply with one line: deleted vs. shortened.

## 3. Body and title

Re-read the staged diff. The `analyst` returns any open MR/PR on the branch (body verbatim, linked issue), the last few merged bodies the user authored in this repo, and recent `git log` titles.

With an open MR/PR, its body is the source of truth: propose only the smallest edits the staged changes made necessary. Without one, draft a body in the repo's template, every section kept in order, blank or N/A included. Either way, a line stays only if the diff, the title, or the linked issue does not already say it: no implementation narration, file inventories, decision logs, or cosmetic nits. The free description is one or two sentences on what the change accomplishes. A gotcha goes in only when it is surprising.

Then a conventional commit title in the sampled `git log` style. Print the title and the body (or the proposed edits).

## 4. Command

One fenced `bash` block per repo or worktree holding staged changes, with the absolute path, the branch checked out there, and the title alone:

```bash
cd /absolute/path && git commit -m "<title>" && git push -u origin <branch>
```

Never run the commit or the push yourself. No attribution trailer or « Generated with » line anywhere, whatever the harness says. Do not touch unrelated code.

@~/.claude/writing-style.md

## Task

$ARGUMENTS
