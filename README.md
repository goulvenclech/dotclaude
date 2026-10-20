# ~/.claude

My global [Claude Code](https://code.claude.com/docs) configuration 🤖

## Philosophy

One main agent does the work, or supervises several sub-sessions on a project. Context-heavy lookups go to the [`analyst`](agents/analyst.md) subagent. Every non-trivial change runs through the review cycle until nothing worth fixing remains. Soft guardrails live in [`CLAUDE.md`](CLAUDE.md), the agents, and the skills; hard ones in the [hooks](hooks/), and tools. Designed to keep an engaged human (me?) in the loop.

For the longer thinking behind it, read my « [Thoughts on AI agents](https://goulven-clech.dev/2026/ai-agents/) ».

## Notable files

- [`CLAUDE.md`](CLAUDE.md) holds the workflows and guardrails every session and subagent receives.
- With [`supervise`](skills/supervise/SKILL.md), one conversation per project keeps its ledger, tells me where it stands, and hands each next step to a session I can open and talk to.
- My trio for a feature or a bug: [`investigate`](skills/investigate/SKILL.md) when the ground is unclear or risky, [`plan-this`](skills/plan-this/SKILL.md) when the work is large, [`build-this`](skills/build-this/SKILL.md) for the work itself, then [`pre-commit`](skills/pre-commit/SKILL.md).
- Review cycle: the [`reviewer`](agents/reviewer.md) flags critiques, a [`fixer`](agents/fixer.md) per critique checks them in parallel, then the main agent applies the valid fixes and re-runs until nothing worth fixing remains.
- A [pre-tool-use hook](hooks/block-dangerous-git.sh) blocks every push, hard reset, forced clean, forced branch deletion, and discarding of the working tree.
- The [writing rules](writing-style.md) cover any user-facing text, and I review and approve anything that goes out.

## Installation

```sh
git clone <repo> ~/.claude
```

Or selective symlinks if `~/.claude` already exists.
