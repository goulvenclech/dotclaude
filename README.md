# ~/.claude

My global [Claude Code](https://docs.claude.com/en/docs/claude-code) (and sometimes Cursor) configuration 🤖

See [`commands/update-workflow.md`](commands/update-workflow.md) for the philosophy and the up-to-date list of agents and skills. For the longer thinking behind it, read [AI agents](https://goulven-clech.dev/2026/ai-agents/).

## Notable files

- [`agents/reviewer.md`](agents/reviewer.md) + [`agents/fixer.md`](agents/fixer.md) — my « review cycle », where reviewer flags issues on the current diff, one fixer per critique triages in parallel, the main agent applies valid fixes and re-runs until **LGTM**.
- [`hooks/block-dangerous-git.sh`](hooks/block-dangerous-git.sh) — pre-tool-use hook that blocks dangerous git commands (`push --force`, `reset --hard`, branch deletion, etc.).

## Installation

```sh
git clone <repo> ~/.claude
```

Or selective symlinks if `~/.claude` already exists.
