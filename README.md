# ~/.claude

My global [Claude Code](https://code.claude.com/docs) configuration 🤖

## Philosophy

One main agent does the work, with a `supervise` conversation above it when a project outgrows one session. Context-heavy lookups go to a subagent. Every change runs through the « reviewer → fixer → main agent » loop until nothing worth fixing remains. Soft guardrails live in `CLAUDE.md`, the agents, and the skills, hard ones in the hooks, and an engaged human (me?) stays in the loop.

For the longer thinking behind it, read my « [Thoughts on AI agents](https://goulven-clech.dev/2026/ai-agents/) ».

## Notable files

- [`CLAUDE.md`](CLAUDE.md), the constant rules every session and subagent receives.
- [`skills/update-workflow/SKILL.md`](skills/update-workflow/SKILL.md), tour of the workflow and the update pass that keeps it coherent.
- [`skills/supervise/SKILL.md`](skills/supervise/SKILL.md), one conversation per project that keeps its ledger, tells me where it stands, and hands each next step to a session I can open and talk to.
- [`skills/investigate/SKILL.md`](skills/investigate/SKILL.md), [`skills/plan-this/SKILL.md`](skills/plan-this/SKILL.md), and [`skills/build-this/SKILL.md`](skills/build-this/SKILL.md), my trio for a feature or a bug: `investigate` when the ground is unclear or risky, `plan-this` when the work is large, `build-this` for the work itself, then `pre-commit`.
- [`agents/reviewer.md`](agents/reviewer.md) and [`agents/fixer.md`](agents/fixer.md), the review cycle: the reviewer flags, one fixer per critique weighs it in parallel, the main agent applies the valid fixes and re-runs until nothing worth fixing remains.
- [`hooks/block-dangerous-git.sh`](hooks/block-dangerous-git.sh), pre-tool-use hook that blocks every push, hard reset, forced clean, forced branch deletion, and discarding of the working tree. Commits are left to the rule in `CLAUDE.md`.
- [`writing-style.md`](writing-style.md), the writing rules for any user-facing text.

## Installation

```sh
git clone <repo> ~/.claude
```

Or selective symlinks if `~/.claude` already exists.
