Pre-commit check. Fixes lint issues, tightens comments/docs, and drafts the MR/PR body and commit title for the staged diff.

## Procedure

### 1. Format, lint, type-check, test

Run the project's format, lint, type-check (when the language/setup has one), and test commands (see AGENTS.md / CLAUDE.md). Auto-fix format/lint findings; if a fix is ambiguous, ask. Type errors and failing tests must be resolved before commit — escalate if the cause is unclear.

### 2. Review comments & docs

**Delegate to a neutral subagent** (`general-purpose`) so judgement is based on the code alone, not the task history. Do **not** pass any context from this conversation — no recap of what was built, why, or which comments you wrote. The subagent must come in cold.

Pass it exactly this brief:

> Run `git diff --cached` to get the staged diff. For every comment, docstring, and test description **added or modified** in that diff, apply this rubric:
>
> - Does it explain *why* (intent, invariants, trade-offs) — not *how*? If it just restates the code, **delete it**.
> - Is it used as a decorator or section separator? **Delete it**.
> - Does it justify a decision only meaningful inside this MR (review hints, "added because of X")? It rots on merge and should be in the MR/PR description, **delete it**.
> - Does it match the repo's existing tone and density? If the file has terse comments and yours is a paragraph, **shorten it**.
> - Does it name identifiers, internal APIs, or other technical specifics that will go stale as surrounding code shifts? Unless it's doctests or a contract-generating doc, **shorten it**.
> - Is the prose chatty, hedging, or boilerplate? Keep it clear, technical, direct, dry — **shorten it**.
>
> Default posture is delete. Apply edits directly to the files. Do not ask questions, do not explain your reasoning, do not produce a report — just edit. When done, reply with a one-line summary of how many comments were deleted vs. reworded.

### 3. Draft MR/PR body & commit title

Re-read the staged diff — Step 2 may have changed files. Follow the writing-style guidelines in `~/.claude/writing-style.md` (concision, British English, tone, format by surface).

Produce a **conventional commit title** and an **MR/PR body** per the surface rules in `~/.claude/writing-style.md`. Match the repo's existing `git log` style for the title, and the repo's template(s) for the body when one exists.

Print both so the user can copy them.

## Guardrails

- **Analyst for external lookups**: if the diff refers to an issue, external doc, or MCP data, delegate the fetch to the **analyst** rather than loading it into your own context.
- **No commits, no pushes**: you only prepare artefacts; never run `git commit` or publish anything.
- **Scope discipline**: do not fix unrelated code or expand the diff.
- **Honesty**: if something is unclear (ambiguous lint fix, unknown convention), ask rather than guess.

## Task

$ARGUMENTS
