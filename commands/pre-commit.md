Pre-commit check. Fixes lint issues, tightens comments/docs, and drafts the MR/PR body and commit title for the staged diff.

## Procedure

### 1. Lint & format

Run the project's format and lint commands (see AGENTS.md / CLAUDE.md). Auto-fix all findings. If a fix is ambiguous, ask.

### 2. Review comments & docs

**Delegate to a neutral subagent** (`general-purpose`) so judgement is based on the code alone, not the task history. Do **not** pass any context from this conversation — no recap of what was built, why, or which comments you wrote. The subagent must come in cold.

Pass it exactly this brief:

> Run `git diff --cached` to get the staged diff. For every comment, docstring, and test description **added or modified** in that diff, apply this rubric:
>
> - Does it explain *why* (intent, invariants, trade-offs) — not *how*? If it just restates the code, **delete it**.
> - Is it concise and non-redundant with the code or surrounding context? If it repeats what an identifier or adjacent line already says, **delete it**.
> - Is it used as a decorator or section separator? **Delete it**.
> - Does it match the repo's existing tone and density? If the file has terse comments and yours is a paragraph, **shorten it**.
>
> Default posture is delete. Apply edits directly to the files. Do not ask questions, do not explain your reasoning, do not produce a report — just edit. When done, reply with a one-line summary of how many comments were deleted vs. reworded.

### 3. Draft MR/PR body & commit title

Re-read the staged diff — Step 2 may have changed files.

Produce:

1. **Conventional commit title** — `type(scope): short description` (follow the repo's `git log` style). One line, lowercase, imperative mood.
2. **MR/PR body** — if the repo has a template, follow it. Otherwise: one-paragraph summary of *what* and *why*, then a bullet list of notable changes. No boilerplate, no filler.

Print both so the user can copy them.

## Guardrails

- **Analyst for external lookups**: if the diff refers to an issue, external doc, or MCP data, delegate the fetch to the **analyst** rather than loading it into your own context.
- **No commits, no pushes**: you only prepare artefacts; never run `git commit` or publish anything.
- **Scope discipline**: do not fix unrelated code or expand the diff.
- **Honesty**: if something is unclear (ambiguous lint fix, unknown convention), ask rather than guess.

## Task

$ARGUMENTS
