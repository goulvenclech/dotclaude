---
description: Pre-commit check. Fixes lint issues, prunes comments/docs, and drafts or updates the MR/PR body and commit title for the staged diff, and prints the commit/push command.
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

**Analyst call** returning: any open MR/PR on this branch (body verbatim, plus linked issue), the last few merged bodies the user authored in this repo, and recent `git log` titles.

- **An open MR/PR exists** → do **not** write a new body. Treat it as source of truth and propose only the smallest targeted edits, and only **if necessary** (when the staged changes have made it stale, wrong, or really incomplete).
- **None** → draft a fresh body following the repo's template when one exists.

Whichever path:
- **Never simplify a template**: every section it provides, in order, blank or N/A ones included.
**Same delete-first test as Step 2**, a line earns its place only if not obvious from the diff, the title, or the linked issue. Cut implementation narration, inventories of changed files, decision logs, restatements of the issue, and every cosmetic nit. The free description is one or two sentences on what the change accomplishes. A gotcha goes in only if genuinely surprising — an expected decision is not one, don't manufacture one.

Then a **conventional commit title** in the sampled `git log` style.

Print the commit title and the body (or the proposed body edits) so the user can copy them.

### 4. Commit & push command

One fenced `bash` block per repo or worktree holding staged changes, ready to run as-is:

```bash
cd /absolute/path/to/worktree && git commit -m "<title>" && git push -u origin <branch>
```

Absolute path so it runs from anywhere, the branch actually checked out there, and the title alone — no body, no co-author trailer.

## Guardrails

- **Analyst for external lookups**: if the diff refers to an issue, external doc, or MCP data, delegate the fetch to the **analyst** rather than loading it into your own context.
- **No commits, no pushes**: you prepare artefacts and print the command; never run it yourself.
- **Scope discipline**: do not fix unrelated code or expand the diff.
- **Honesty**: if something is unclear (ambiguous lint fix, unknown convention), ask rather than guess.

## Task

$ARGUMENTS
