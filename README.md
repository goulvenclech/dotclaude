# ~/.claude

My global [Claude Code](https://docs.claude.com/en/docs/claude-code) configuration 🤖

## Philosophy

One main agent does the work. Any investigation or tool context-heavy gets delegated to a subagent. Every change runs through the « Reviewer → Fixer → Main Agent » loop until it earns an **LGTM**. With soft (in commands and agents) and hard (in tools and hooks) guardrails, and designed to keep an engaged human (me?) in the loop.

For the longer thinking behind it, read my « [Thoughts on AI agents](https://goulven-clech.dev/2026/ai-agents/) ».

## Notable files

- [`commands/update-workflow.md`](commands/update-workflow.md) — brief tour of the workflow and the up-to-date list of agents and skills; also the guided update pass to keep them coherent.
- [`commands/investigate.md`](commands/investigate.md) + [`commands/build-this.md`](commands/build-this.md) — my main commands, `investigate` confirms a bug or refactor idea before I launch `build-this` in plan mode, then accept Claude's plan in auto. ([`commands/plan-this.md`](commands/plan-this.md) is still wip, and I'm still debating its usefulness tbh)
- [`agents/reviewer.md`](agents/reviewer.md) + [`agents/fixer.md`](agents/fixer.md) — my « review cycle », where reviewer flags issues on the current diff, one fixer per critique triages in parallel, the main agent applies valid fixes and re-runs until **LGTM**.
- [`hooks/block-dangerous-git.sh`](hooks/block-dangerous-git.sh) — pre-tool-use hook that blocks dangerous git commands (`push --force`, `reset --hard`, branch deletion, etc.).

## Installation

```sh
git clone <repo> ~/.claude
```

Or selective symlinks if `~/.claude` already exists.
