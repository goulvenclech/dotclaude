---
description: Pre-commit check. Fixes lint issues, prunes comments/docs, and drafts or updates the MR/PR body and commit title for the staged diff.
---

## Procedure

### 1. Format, lint, type-check, test

Run the project's format, lint, type-check (when the language/setup has one), and test commands (see AGENTS.md / CLAUDE.md). Auto-fix format/lint findings; if a fix is ambiguous, ask. Type errors and failing tests must be resolved before commit — escalate if the cause is unclear.

### 2. Review comments & docs

**Delegate to a neutral subagent** (`general-purpose`) so judgement is based on the code alone, not the task history. Do **not** pass any context from this conversation — no recap of what was built, why, or which comments you wrote. The subagent must come in cold.

Pass it exactly this brief:

> Run `git diff --cached` to get the staged diff. A comment, docstring, or test description **added or modified** in that diff earns its place only if it tells the reader something the code, names, types, and tests don't already — a constraint, an invariant, a non-obvious *why*. Everything else, delete:
>
> - Restates what the code does, or expected behaviour the tests already cover (or should cover).
> - Changelog narration ("was", "previously", "now handles", "added because") that's git history and the MR body's job, it rots on merge.
> - Explains a design decision that doesn't change how the reader uses or modifies the code.
> - Decorator, section separator, or review hint.
> - Names identifiers or internal specifics that go stale as surrounding code shifts (doctests and contract-generating docs excepted).
>
> Comments left should be as short and dry as possible, matching the file's existing tone and density. If a comment needs heavy rewording to survive, delete it instead. Apply edits directly to the files. Do not ask questions, do not explain your reasoning, do not produce a report —> just edit. When done, reply with a one-line count: deleted vs. shortened.

### 3. Draft or update the MR/PR body & commit title

Re-read the staged diff — Step 2 may have changed files. Follow the writing-style guidelines in `~/.claude/writing-style.md` (concision, British English, tone, format by surface).

**Check whether the current branch already has an open MR/PR** — delegate the lookup to the **analyst** (return the existing body verbatim, plus any linked issue).

- **An open MR/PR exists** → do **not** write a new body. Treat the existing body as source of truth and propose only the smallest targeted edits, and only **if necessary** (when the staged changes have made it stale, wrong, or really incomplete).
- **No open MR/PR** → draft a fresh body following the repo's template(s) when one exists.

Whichever path:

- **Never simplify the template.** Keep every section the repo's template provides, in order, including ones left blank or marked N/A.
- **Keep the free description short**, usually one or two sentences on what the change accomplishes. Cut anything a reviewer infers from the diff: no implementation narration, no list of decisions, no inventory of changes, no restating the linked issue. Flag a gotcha only if one genuinely exists, something surprising the code doesn't reveal. An expected, logical decision is not a gotcha, so don't manufacture one.

Also produce a **conventional commit title** matching the repo's existing `git log` style.

Print the commit title and the body (or the proposed body edits) so the user can copy them.

## Guardrails

- **Analyst for external lookups**: if the diff refers to an issue, external doc, or MCP data, delegate the fetch to the **analyst** rather than loading it into your own context.
- **No commits, no pushes**: you only prepare artefacts; never run `git commit` or publish anything.
- **Scope discipline**: do not fix unrelated code or expand the diff.
- **Honesty**: if something is unclear (ambiguous lint fix, unknown convention), ask rather than guess.

## Task

$ARGUMENTS
