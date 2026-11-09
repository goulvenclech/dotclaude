# Agentic Workflow

## Philosophy

One main agent does the work, or supervises several sub-sessions on a project. Context-heavy lookups (docs, issues, MR/PRs, MCP tools, data) go to the [`analyst`](agents/analyst.md) subagent. Every non-trivial change runs through the review cycle before it is reported done. Project conventions live in the project's AGENTS.md or CONTRIBUTING.md.

## Notable skills & agents

- With [`supervise`](skills/supervise/SKILL.md), one conversation per project keeps its ledger, tells the user where it stands, and hands each next step to a session the user can open and talk to.
- With [`sentinel`](skills/sentinel/SKILL.md), one conversation per account triages what the [watcher](bin/watcher.sh) finds on GitHub or GitLab each minute without a model call, and forwards each item to the right project, drops it, or proposes a session.
- The trio for a feature or a bug: [`investigate`](skills/investigate/SKILL.md) when the ground is unclear or risky, [`plan-this`](skills/plan-this/SKILL.md) when the work is large, [`build-this`](skills/build-this/SKILL.md) for the work itself, then [`pre-commit`](skills/pre-commit/SKILL.md).
- Review cycle: the [`reviewer`](agents/reviewer.md) flags critiques, a [`fixer`](agents/fixer.md) per critique checks them in parallel, then the main agent applies the valid fixes and re-runs until nothing worth fixing remains. [`review-pr`](skills/review-pr/SKILL.md) runs it on other contributors' MR/PRs.

## Guardrails

- Once the review cycle passes, `pre-commit` commits and pushes the session's own branch, or the target branch the task names, and opens or updates its MR/PR.
- Anything in the user's name (comments, review replies, approvals, merges, tracker updates, chat, mail) and any other write to an external service (MCP writes included) waits for the user's validation.
- No destructive git without explicit approval: no hard reset, `--force` push or push to the default branch, branch deletion, or discarding of working-tree changes.
- Never create, modify, or delete anything in a production environment.
- Say when something is blocked, unverified, or uncertain. No fabricated context, no inflated severity, no faked progress.
