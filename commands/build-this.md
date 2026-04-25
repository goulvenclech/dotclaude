Implement a feature or fix end-to-end. Accepts an issue/PR URL, a ticket reference, or a free-form task description.

## Workflow

### 1. Gather context (Analyst)

Delegate to the **analyst** subagent to produce a scoped brief:
- Fetch the issue/PR if one is provided (via `gh`, `glab`, or the project's equivalent)
- Identify relevant files, conventions (AGENTS.md / CLAUDE.md), and constraints
- Query any external docs, MCP tools, or data sources the task needs
- Return: goal, files concerned, risks, acceptance criteria

**Always delegate any doc reading, issue/PR fetch, MCP call, or data exploration to the analyst** — never spend your own context on raw lookups, even mid-implementation. If you need more context later, delegate again.

### 2. Implement

Write the change yourself, following the analyst's brief and project conventions:
- Idiomatic code matching existing patterns
- Thorough tests, including edge cases, on real behaviour, not implementation details
- Comments explain **why**, not **how**, and never used as a decorator
- Run the project's formatter, linter, and test suite — all must pass

### 3. Review cycle

Delegate to the **reviewer** subagent. Never pass a diff — tell it to review the current uncommitted changes.

For each critique the reviewer returns, spawn one **fixer** per critique **in parallel** (multiple Agent calls in a single message). Each fixer returns one of:
- `Valid — fix needed` → apply the smallest safe fix yourself
- `Valid — out of scope` → note and defer
- `Partly valid` → treat the valid part as "fix needed"
- `Invalid` → skip
- `Ambiguous` → ask the user

After applying fixes, call the reviewer again. Loop until the reviewer returns **LGTM** or every remaining critique is Invalid / out-of-scope.

### 4. Report

Honest and concise:
- What is fully implemented, what is not, trade-offs, deferred items
- Commands run and their results (format, lint, test)
- Open questions or follow-up suggestions

No restated code. The diff speaks for itself.

## Guardrails

- **Analyst for all external lookups**: docs, issues, APIs, MCP tools, data exploration — always delegate.
- **Explicit order required**: never commit, push, open PRs/MRs, or create/modify issues without a direct user request.
- **No destructive git**: no `reset --hard`, `push --force`, branch deletion, or similar without explicit approval.
- **Scope discipline**: stay within the task. Flag out-of-scope findings; do not fix them.
- **Honesty over theatre**: if something is blocked or cannot be verified, say so — do not fake progress.
- **Production forbidden**: never create, modify, or delete anything in production environments.

## Task

$ARGUMENTS
