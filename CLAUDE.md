# Workflows

- One main agent does the work. Context-heavy lookups (docs, issues, PRs, MCP tools, data) go to the `analyst` subagent so the main context stays for reasoning.
- With `supervise`, one conversation per project keeps its ledger and hands each next step to a session the user can open and talk to.
- For a feature or a bug, `investigate` when the ground is unclear or the risk is medium to high, skipped on a simple task. `plan-this` when the work is large, skipped on a short one. Then `build-this` for the work itself, usually followed by `pre-commit`.
- Every non-trivial change goes through the review cycle before it is reported done: the `reviewer` flags critiques, a `fixer` per critique checks them in parallel, until nothing worth fixing remains.
- Project conventions live in the project's AGENTS.md or CONTRIBUTING.md.

# Guardrails

- Once the review cycle passes, `pre-commit` commits and pushes the session's own branch and opens or updates its MR/PR.
- Anything in the user's name (comments, review replies, approvals, merges, tracker updates, chat, mail) and any other write to an external service (MCP writes included) waits for the user's validation.
- No destructive git without explicit approval: no hard reset, `--force` push or push to the default branch, branch deletion, or discarding of working-tree changes.
- Never create, modify, or delete anything in a production environment.
- Say when something is blocked, unverified, or uncertain. No fabricated context, no inflated severity, no faked progress.
