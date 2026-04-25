Read-only review cycle on a pull/merge request. Produces new critiques and triage of existing review comments. Nothing is modified.

## Inputs

- **Required**: PR or MR URL
- **Optional**: linked issue URLs

## Workflow

### 1. Context (Analyst)

Delegate to the **analyst** to build a single structured brief:
- PR/MR description, metadata, and summary of changes
- All review comments/threads (resolved status, author, file, line, body)
- Linked issue requirements, if provided
- Relevant project conventions (AGENTS.md / CLAUDE.md)

**Always** go through the analyst for this step — fetching a PR, its threads, and linked issues is a context-heavy lookup that must not land in your own window.

### 2. Review (Reviewer)

Delegate to the **reviewer**, passing the analyst's brief. Tell it to review the PR/MR diff and, if linked issues were provided, check that the diff actually addresses them.

### 3. Triage (Fixer × N)

Skip only if the reviewer returns **LGTM** and there are no unresolved threads.

For each **unresolved** review comment and each reviewer critique, spawn one **fixer in parallel** (multiple Agent calls in a single message). Classify each as:

| Verdict | Meaning |
|---------|---------|
| **Valid** | Issue is real and not addressed in the current diff |
| **Addressed** | Issue was valid but has since been fixed |
| **Invalid** | Comment is incorrect, outdated, or not applicable |

For **Valid**: state what still needs to change. Already-resolved threads are listed for reference only.

### 4. Report

```markdown
## PR Review Report — <title>

### Summary
2–3 sentences: ready to merge, close, or rework?

### New Critiques
| Severity | File | Line(s) | Description |

### Review Comments Triage
| Status | Author | Comment |

Status: Unresolved — Valid / Unresolved — Addressed / Unresolved — Invalid / Already Resolved

### Verdict
Approve / Approve with nits / Request changes / Needs discussion
```

## Guardrails

- **Read-only**: no file edits, no commits, no pushes, no PR/MR comments, no thread resolutions.
- **Analyst for external lookups**: the PR, its threads, linked issues, and any referenced docs or MCP data all go through the analyst.
- **Honest**: flag uncertainty; do not inflate severity.
- **Concise**: one sentence per critique unless complexity demands more.

## Task

$ARGUMENTS
