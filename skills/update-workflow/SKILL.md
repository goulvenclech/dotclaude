---
description: Tour of the agentic workflow, and the guided update pass that keeps agents, skills, and CLAUDE.md coherent.
argument-hint: [change to make]
---

## The workflow

One main agent orchestrates and implements. The constant rules live in `~/.claude/CLAUDE.md`, the writing rules in `~/.claude/writing-style.md` (loaded with `@~/.claude/writing-style.md` by the skills that draft text), the hard guardrails in `~/.claude/hooks/`. Nothing assumes a Git host, a language, or a tooling, except the personal skills that name their own sources.

Agents (`~/.claude/agents/`):
- `analyst`: read-only context gathering, every connected MCP included. Called for any context-heavy lookup.
- `reviewer`: read-only critique of the current diff or a named target. Ranked list or `LGTM`.
- `fixer`: validates one critique per call, with a reproduction test when the branch is local. Verdicts: `Valid`, `Out of scope`, `Partly valid`, `Invalid`, `Ambiguous`.

Skills (`~/.claude/skills/`): `investigate` (ledger-driven, read-only, ends with a report), `plan-this` (on top of an investigation), `build-this` (analyst, implement, review cycle), `review-current`, `review-pr`, `pre-commit`, `explain`, `tidy-branches`, `mytodo`, `myweek`, and this one. Each file's description is its reference, this list only names them.

## The update pass

Ask what should change. Have the `analyst` read every file under `~/.claude/agents/`, `~/.claude/skills/`, and `~/.claude/hooks/`, plus `~/.claude/CLAUDE.md` and `~/.claude/README.md`. Propose the minimal edit set that keeps every file describing the same concept in agreement, apply on approval, and report a short diff summary.

## Task

$ARGUMENTS
