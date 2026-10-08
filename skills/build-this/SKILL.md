---
description: Implement a feature or fix end-to-end, through the review cycle.
argument-hint: <issue, ticket, or description>
---

Have the `analyst` gather the context (issue or PR, relevant files, conventions, external docs, MCP data) and implement from its brief yourself. Delegate again whenever you need more context mid-way.

Write idiomatic code that matches the existing patterns. Cover key behaviours and plausible edge cases with tests on behaviour units, with no flaky setup and no mocking of the behaviour under test. Comment only what the code cannot say: a constraint, an invariant, a non-obvious why. The project's formatter, linter, type checker, and test suite must pass.

Then the review cycle: the `reviewer` on the current uncommitted changes (point it at the working state, never paste a diff), one `fixer` per critique in parallel. Apply `Valid` and the valid part of `Partly valid` yourself, defer `Out of scope`, skip `Invalid`, ask the user on `Ambiguous`. Fixers may leave reproduction tests behind, which your fix makes pass. Loop until the reviewer returns `LGTM` or only `Invalid` and `Out of scope` critiques remain.

Report what is implemented, what is not, trade-offs and deferred items, the commands run with their results, reproduction tests left behind, open questions. No restated code.

Stay within the task and flag the rest. Say what is blocked or unverified.

## Task

$ARGUMENTS
