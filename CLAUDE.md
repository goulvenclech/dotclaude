# Working rules

- One main agent orchestrates and implements, under a `supervise` conversation when a project spans several sessions. Context-heavy lookups (docs, issues, PRs, MCP tools, data) go to the `analyst` subagent so the main context stays for reasoning.
- For a feature or a bug, `investigate` when the ground is unclear or the risk is medium to high, skipped on a simple task. `plan-this` to clarify, batch, or slice large work, skipped on a short one. Then `build-this`, the work itself, usually followed by `pre-commit`.
- Every non-trivial code change goes through the review cycle before it is reported done: `reviewer`, then one `fixer` per critique in parallel, until nothing worth fixing remains.
- Nothing committed, pushed, opened, published, or written to an external service (MCP writes included) without an explicit order from the user.
- No destructive git: no hard reset, forced push, branch deletion, or discarding of working-tree changes without explicit approval.
- Never create, modify, or delete anything in a production environment.
- Say when something is blocked, unverified, or uncertain. No fabricated context, no inflated severity, no faked progress.
- Project conventions live in the project's AGENTS.md or CONTRIBUTING.md.
