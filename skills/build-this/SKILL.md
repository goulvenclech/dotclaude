---
description: Implement a feature or fix end-to-end, through the review cycle.
argument-hint: <issue, ticket, or description>
---

Have the `analyst` gather the context (issue or PR, relevant files, conventions, external docs, MCP data) and implement from its brief yourself. Delegate again whenever you need more context mid-way.

Write idiomatic code that matches the existing patterns and reuses their helpers, with no guard for a state no caller produces (trust boundaries excepted). Cover key behaviours and plausible edge cases with tests on behaviour units that fail when their behaviour breaks, with no flaky setup and no mocking of the behaviour under test. Comment only what the code cannot say: a constraint, an invariant, a non-obvious why. The project's formatter, linter, type checker, and test suite must pass.

Then the review cycle: the `reviewer` on the current uncommitted changes (point it at the working state, never paste a diff), one `fixer` per critique in parallel. Apply `Valid` and the valid part of `Partly valid` yourself, defer `Out of scope`, skip `Invalid`, leave `Not worth it` for the report, ask the user on `Ambiguous`. Fixers may leave reproduction tests behind, which your fix makes pass. Each pass reviews the whole change, with the first pass's brief. A critique raised again on unchanged code keeps its verdict. Loop until the reviewer returns `LGTM` or only `Invalid`, `Out of scope`, and `Not worth it` critiques remain.

Report what is implemented, what is not, trade-offs, `Out of scope` and `Not worth it` critiques with the fixer's reason, the commands run with their results, reproduction tests left behind, open questions, then `pre-commit` as the next step. No restated code.

Stay within the task and flag the rest. Say what is blocked or unverified.

## Task

$ARGUMENTS
