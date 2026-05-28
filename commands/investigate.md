Investigate a bug or a refactor idea in depth before starting work. Accepts an issue/PR URL, a ticket reference, or a free-form description of the suspected problem. Read-only — confirms findings without fixing them.

## Workflow

### 1. Gather context (Analysts)

Investigating is **your** job — the main agent. Analysts only do bulk lookups so your context stays clean for reasoning.

Spawn **multiple analyst subagents in parallel** (multiple Agent calls in a single message) for independent lookups. Typical splits:
- One to fetch the issue/PR and any linked tickets or reports (via `gh`, `glab`, or equivalent)
- One to follow the suspect logic end-to-end: entry points, callers, callees, data flow, and the data actually returned at each hop
- One to surface prior art: similar past bugs or refactors (`git log`), related issues/PRs, conventions (AGENTS.md / CLAUDE.md), invariants enforced elsewhere
- More as needed for external docs, MCP data, or logs

**Every doc read, issue/PR fetch, MCP call, test run, or data exploration goes through an analyst** — never spend your own context on raw lookups, even mid-investigation. If you need more context later, spawn more analysts. Analysts report observed behaviour (run existing tests, read logs) but write nothing.

### 2. Form candidate findings

**You** consolidate the analysts' briefs into a ranked list of **falsifiable claims**, each tied to a `file:line`:
- For a **bug**: where the logic breaks, the bad data path, the violated invariant
- For a **refactor**: hidden coupling, callers that would break, side-channel invariants, migration or ordering hazards

Each candidate is a *hypothesis to confirm or refute* — not yet a fact. **Do not invent findings**: every one must trace to the code or the analysts' data. If a hypothesis is plausible but unverified, keep it as a candidate for Step 4 rather than asserting it.

### 3. Surface risks & gotchas

Optional. List **only** risks concretely supported by the code or the issue:
- Concurrency, ordering, idempotency, migration, or backwards-compat hazards in the touched paths
- Hidden coupling: callers that would silently break, invariants enforced elsewhere
- External dependencies (APIs, MCP, infra) that may be unreliable or rate-limited
- Known-bad patterns the project already has guardrails against

**Do not invent risks.** If a hazard is plausible but unverified, spawn another analyst to verify before listing it. If still unverified, drop it.

### 4. Validate each finding (Fixer × N)

Spawn one **fixer per candidate finding in parallel** (multiple Agent calls in a single message). Frame each as a critique = its `file:line` + the claim. When the code is checked out locally and the claim is replicable, the fixer writes a focused reproduction test (kept on a confirmed verdict, deleted otherwise) — this is the "write a test to confirm the problem" step. Map each fixer's verdict:
- `Valid — fix needed` → finding **confirmed**, real problem
- `Valid — out of scope` → confirmed, but belongs to a separate task
- `Partly valid` → confirmed in part; record which part
- `Invalid` → **refuted**; drop it
- `Ambiguous` → needs user input; becomes an open question

### 5. Report + open questions

Honest and concise:
- **Confirmed findings**: each with `file:line`, evidence, root cause if found, and the reproduction-test path left behind by the fixer
- **Refuted / unconfirmed**: one line each, so you know what was ruled out
- **Risks & gotchas** to watch when the work starts
- **Open questions**: genuinely unspecified decisions for the user (do not invent ambiguity)
- **Suggested next step**: `/plan-this` or `/build-this`

Stop here — investigate does not plan the fix or implement it.

## Guardrails

- **Read-only**: no fixes, no commits, no pushes, no issue/PR creation. The only writes are fixer reproduction tests (kept on confirmed verdicts, deleted otherwise).
- **Analysts for all external lookups**: docs, issues, APIs, MCP tools, test runs, data exploration — always delegate, in parallel when independent. Judgement stays with you.
- **No invention**: every finding, risk, and question must trace back to the code or the prompt. When in doubt, validate it via a fixer or drop it.
- **Confirm, don't assert**: a hypothesis is not a finding until a fixer validates it or you can cite direct evidence.
- **Production forbidden**: never create, modify, or delete anything in production environments.

## Task

$ARGUMENTS
