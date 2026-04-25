Plan a feature or fix before any code is written. Accepts an issue/PR URL, a ticket reference, or a free-form task description. Read-only — nothing is modified.

## Workflow

### 1. Gather context (Analysts)

Planning is **your** job — the main agent. Analysts only do bulk lookups so your context stays clean for reasoning.

Spawn **multiple analyst subagents in parallel** (multiple Agent calls in a single message) for independent lookups. Typical splits:
- One to fetch the issue/PR and any linked tickets (via `gh`, `glab`, or equivalent)
- One to map the touched code paths: callers, callees, data flow, existing tests
- One to surface prior art: similar past changes (`git log`), related issues/PRs, conventions (AGENTS.md / CLAUDE.md), reusable abstractions
- More as needed for external docs or MCP data

**Every doc read, issue/PR fetch, MCP call, or data exploration goes through an analyst** — never spend your own context on raw lookups, even mid-planning. If you need more context later, spawn more analysts.

### 2. Surface risks & gotchas

**You** list the risks (the analysts surface facts, not judgement). Include **only** those concretely supported by the code or the issue:
- Concurrency, ordering, idempotency, migration, or backwards-compat hazards visible in the touched paths
- Hidden coupling: callers that would silently break, invariants enforced elsewhere
- External dependencies (APIs, MCP, infra) that may be unreliable or rate-limited
- Known-bad patterns the project already has guardrails against

**Do not invent risks.** If a hazard is plausible but unverified, spawn another analyst to verify before listing it. If still unverified, drop it.

### 3. Ask the user about gaps

Re-read the prompt/issue against the analysts' briefs. List behaviours or edge cases that are **genuinely unspecified**:
- Inputs the prompt doesn't pin down (empty, malformed, oversized, concurrent)
- Outputs or side effects the prompt is silent on (errors, retries, telemetry, audit)
- Scope ambiguities (does « X » include Y?)

Ask these as a numbered question list. **Do not invent ambiguity** — if the prompt or the code answers the question, do not ask it. Wait for answers before finalising the plan.

### 4. Propose the plan

A short, actionable plan focused on **architecture and intended behaviour**, not implementation details:
- Ordered steps, each one a coherent unit of behaviour change
- Files / modules / boundaries each step touches
- Known gotchas to avoid, mapped to the steps that hit them
- Verification approach per step (what proves it works)

Skip generic quality requirements (tests, lint, comments, conventions) — those live in AGENTS.md / CLAUDE.md and the agent prompts. The plan is about *what* and *where*, not *how well*.

### 5. Split if too large

If the plan obviously exceeds a day of focused work (e.g. spans unrelated subsystems, requires multiple migrations, or stacks several independent behaviours), propose a split into multiple issues:
- One issue per coherent, independently-shippable slice
- Stated dependencies between issues
- Suggested order

Otherwise, ship the plan as a single unit.

## Guardrails

- **Read-only**: no file edits, no commits, no pushes, no issue/PR creation.
- **Analysts for all external lookups**: docs, issues, APIs, MCP tools, data exploration — always delegate, in parallel when independent. Planning and judgement stay with you.
- **No invention**: every risk and every clarification question must trace back to the code or the prompt. When in doubt, drop it or verify it.
- **Architecture, not implementation**: the plan describes behaviour and boundaries, not line-by-line code.
- **Honesty**: if the task is under-specified to the point the plan would be guesswork, say so and stop at Step 3.

## Task

$ARGUMENTS
