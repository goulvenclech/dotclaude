# ~/.claude

My global [Claude Code](https://code.claude.com/docs) configuration 🤖

## Philosophy

One main agent does the work. Context-heavy lookups go to a subagent. Every change runs through the « reviewer → fixer → main agent » loop until it earns an **LGTM**. Soft guardrails live in `CLAUDE.md`, the agents, and the skills, hard ones in the hooks, and an engaged human (me?) stays in the loop.

For the longer thinking behind it, read my « [Thoughts on AI agents](https://goulven-clech.dev/2026/ai-agents/) ».

## Notable files

- [`CLAUDE.md`](CLAUDE.md), the constant rules every session and subagent receives.
- [`skills/update-workflow/SKILL.md`](skills/update-workflow/SKILL.md), tour of the workflow and the update pass that keeps it coherent.
- [`skills/investigate/SKILL.md`](skills/investigate/SKILL.md) and [`skills/build-this/SKILL.md`](skills/build-this/SKILL.md), my main pair: `investigate` confirms a bug or a refactor idea, `plan-this` (optional) turns it into a plan, `build-this` implements it.
- [`agents/reviewer.md`](agents/reviewer.md) and [`agents/fixer.md`](agents/fixer.md), the review cycle: the reviewer flags, one fixer per critique triages in parallel, the main agent applies the valid fixes and re-runs until **LGTM**.
- [`hooks/block-dangerous-git.sh`](hooks/block-dangerous-git.sh), pre-tool-use hook that blocks every push, hard reset, forced clean, forced branch deletion, and discarding of the working tree. Commits are left to the rule in `CLAUDE.md`.
- [`writing-style.md`](writing-style.md), the writing rules for any user-facing text.

## Installation

```sh
git clone <repo> ~/.claude
```

Or selective symlinks if `~/.claude` already exists.
