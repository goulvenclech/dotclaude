Review the uncommitted changes in the current working tree. Read-only — nothing is modified.

## Workflow

### 1. Optional context (Analyst)

If the changes reference an issue, PR, or external behaviour, delegate to the **analyst** to fetch:
- The linked issue/PR description and acceptance criteria
- Any docs, MCP data, or external references the diff depends on

Skip for small, self-contained changes. Any doc, issue, or MCP lookup must go through the analyst — never load it into your own context.

### 2. Review (Reviewer)

Delegate to the **reviewer** subagent. Tell it to review the current uncommitted diff — never paste the diff. Pass the analyst's brief if one was produced.

### 3. Triage critiques (Fixer × N)

If the reviewer returns **LGTM**, stop and report it.

Otherwise, spawn one **fixer** per critique **in parallel** (multiple Agent calls in a single message). Each returns a verdict: Valid — fix needed / Valid — out of scope / Partly valid / Invalid / Ambiguous.

### 4. Report

Return the validated critiques grouped by verdict. For each valid critique include `file:line`, rationale, and the minimal fix direction (no patches). Surface Ambiguous items as questions for the user.

## Guardrails

- **Read-only**: no file modifications, no commits, no pushes.
- **Analyst for external lookups**: docs, issues, MCP, data — always delegate.
- **Signal over noise**: drop nits a formatter/linter already catches.
- **Honesty**: flag uncertainty; do not inflate severity.

## Task

$ARGUMENTS
