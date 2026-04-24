Pre-commit check. Fixes lint issues, tightens comments/docs, and drafts the MR/PR body and commit title for the staged diff.

## Procedure

### 1. Lint & format

Run the project's format and lint commands (see AGENTS.md / CLAUDE.md). Auto-fix all findings. If a fix is ambiguous, ask.

### 2. Review comments & docs

Get the staged diff. For every comment, docstring, and test description **added or modified** in the diff, evaluate:

- Does it explain *why* (intent, invariants, trade-offs) — not *how*?
- Is it concise and non-redundant with the code or surrounding context?
- Does it match the repo's existing tone and density?
- Is it used as a decorator or section separator? Remove it.

Apply fixes directly. Delete comments that add no value. Reword the rest.

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
