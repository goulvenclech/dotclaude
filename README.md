# ~/.claude

My global [Claude Code](https://docs.claude.com/en/docs/claude-code) configuration.

## Versioned contents

- `settings.json` — harness settings
- `agents/` — subagents (analyst, reviewer, fixer)
- `commands/` — slash commands (skills)
- `hooks/` — shell hooks referenced from `settings.json`
- `cursor/permissions.json` — Cursor IDE auto-run allowlist (symlinked from `~/.cursor/permissions.json`)
- `rules/`, `output-styles/` — rules and output styles
- `CLAUDE.md` — global instructions

Everything else (sessions, caches, history, plugins) is ignored.

## Workflow

See [`commands/update-workflow.md`](commands/update-workflow.md) for the philosophy and the up-to-date list of agents and skills.

## Installation

```sh
git clone <repo> ~/.claude
```

Or selective symlinks if `~/.claude` already exists.
