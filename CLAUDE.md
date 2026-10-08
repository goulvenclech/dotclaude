# Working rules

- One main agent orchestrates and implements. Context-heavy lookups (docs, issues, PRs, MCP tools, data) go to the `analyst` subagent so the main context stays for reasoning.
- Every non-trivial code change goes through the review cycle before it is reported done: `reviewer`, then one `fixer` per critique in parallel, until LGTM.
- Nothing committed, pushed, opened, published, or written to an external service (MCP writes included) without an explicit order from the user.
- No destructive git: no hard reset, forced push, branch deletion, or discarding of working-tree changes without explicit approval.
- Never create, modify, or delete anything in a production environment.
- Say when something is blocked, unverified, or uncertain. No fabricated context, no inflated severity, no faked progress.
- Project conventions live in the project's AGENTS.md or CONTRIBUTING.md.
