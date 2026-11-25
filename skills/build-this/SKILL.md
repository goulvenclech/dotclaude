---
description: Implement a feature or fix end-to-end, through the review cycle.
argument-hint: <issue, ticket, or description>
---

Have the `analyst` gather the context (issue or PR, relevant files, conventions, external docs, MCP data) and implement from its brief yourself. Delegate again whenever you need more context mid-way.

Before writing code, climb this ladder and take the first rung that fully works:

1. Does it need to exist?
2. Does this codebase already do it?
3. Does the standard library or the platform?
4. Does an installed dependency?
5. Otherwise, what is the smallest change that fully solves it?

Find every place the change must reach (callers, tests, fixtures, config) before editing, and fix a bug once at its root, in the shared code. Write idiomatic code that matches the existing patterns, with no guard for a state no caller produces (trust boundaries excepted). What the task asks for, security, accessibility, and error handling that prevents data loss are never cut for a shorter diff. Handle and test an edge case only when it can plausibly happen and its impact outweighs what it costs in code, performance, and maintenance. Test the behaviours the task adds or changes, business rules first, extending an existing test before adding one. Skip glue and wiring with no logic of their own. Tests target behaviour units, fail when their behaviour breaks, with no flaky setup and no mocking of the behaviour under test. Comment only what the code cannot say: a constraint, an invariant, a non-obvious why. The project's formatter, linter, type checker, and test suite must pass.

Then the review cycle: the `reviewer` on the current uncommitted changes (point it at the working state, never paste a diff), one `fixer` per critique in parallel. When the change touches docs or interface text, `prose` on the docs and `ui-copy` on the interface text also review it, in `review` mode, and their critiques go to fixers like the reviewer's. Apply `Valid` and the valid part of `Partly valid` yourself, defer `Out of scope`, skip `Invalid`, leave `Not worth it` for the report, ask the user on `Ambiguous`. Fixers may leave reproduction tests behind, which your fix makes pass. Each pass reviews the whole change, with the first pass's brief. A critique raised again on unchanged code keeps its verdict. Loop until every review returns `LGTM` or only `Invalid`, `Out of scope`, and `Not worth it` critiques remain.

Report what is implemented, what is not, trade-offs, `Out of scope` and `Not worth it` critiques with the fixer's reason, the commands run with their results, reproduction tests left behind, open questions, then `pre-commit` as the next step. No restated code.

Stay within the task and flag the rest. Say what is blocked or unverified.

## Task

$ARGUMENTS
