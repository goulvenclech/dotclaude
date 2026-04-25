Brief tour of the agentic workflow, and a guided update pass to keep agents and skills coherent with each other.

## Philosophy

- **One main agent orchestrates and implements the majority of the work.**
- **Analyst for every context-heavy lookup.** Docs, issues, PRs, MCP tools, data exploration — always delegated to preserve the main agent's context window.
- **Review cycle on every change.** Every code change goes through a reviewer → fixer(s) → « apply fixes » loop until the reviewer returns **LGTM**, or every remaining critique is Invalid / out-of-scope.
- **Guardrails are constant.** Read-only where possible. Nothing committed, pushed, opened, or published without an explicit user order. No destructive git. Never touch production. Honesty over theatre.
- **Agnostic.** No assumption about Git provider, language, or tooling. Project-specific conventions live in CONTRIBUTING.md and/or AGENTS.md.

## Agents (subagents invoked via the Agent tool)

- **analyst** — read-only context gatherer. Codebase search, docs, GitHub/GitLab, MCP, read-only commands. Called before any non-trivial task, and any time the main agent would otherwise spend its own context on raw lookups.
- **reviewer** — read-only. Critiques the current diff or a named branch against project conventions. Returns a ranked list or `LGTM`.
- **fixer** — read-only. Validates **one** reviewer critique per call. Returns a verdict: Valid — fix needed / Valid — out of scope / Partly valid / Invalid / Ambiguous.
- **poet** — drafts written content (PR/MR body, Slack, review comment, release note, etc.) using repo templates when available. Returns a draft only; never publishes.

## Skills (slash commands)

- **/plan-this** — read-only planning pass. Analyst → risks → clarifying questions → actionable plan, split into multiple issues if too large.
- **/build-this** — implements a feature or fix end-to-end. Analyst → implement → reviewer+fixer loop → report.
- **/review-current** — review cycle on the current uncommitted changes. No modifications.
- **/review-pr** — review cycle on a PR/MR URL, including triage of existing review comments. No modifications.
- **/pre-commit** — lint, tighten comments, draft MR/PR body and commit title for the staged diff.
- **/update-workflow** — this skill. Briefs the workflow and keeps the definitions above in sync.

## When invoked to update

1. Ask the user which change they want (new guardrail, new subagent, renamed skill, tightened wording, etc.).
2. Delegate to the **analyst** to read every file under `~/.claude/agents/` and `~/.claude/commands/` referenced here, so you see the current state without burning your context.
3. Propose a minimal, coherent edit set covering every file the change touches. Divergence between two files that describe the same concept is the failure mode to watch for.
4. On user approval, apply the edits directly and report a short diff summary.

## Task

$ARGUMENTS
