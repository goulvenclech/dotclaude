---
description: Explain the current work in plain language — problem, business need, solution, state, next steps — keeping only the beats that apply.
---

## Procedure

### 1. Ground it

Explain only what you can back. In order: this session, the project's findings ledgers (`~/.claude/investigations/<project>/INDEX.md`), git history, the code. Send one **analyst** if a real gap remains — one, not a lookup spree.

### 2. Explain

Only the beats that apply where the work stands:
- **Problem**: what breaks or is missing
- **Need**: who it hurts, and why it's worth the work
- **Solution**: the mechanism, not the diff
- **State**: what holds, what's untested, what's left
- **Next**: the smallest concrete step

Write for a competent stranger to the codebase. Never blend sure and speculative: mark the unverified inline, and turn what no tool can settle into a question for the user.

### 3. Ask, don't digress

Any tangent worth more than a sentence becomes a follow-up question at the end. Up to three, none if none is real.

## Guardrails

- **Concision is the deliverable.** One screen, usually less. Any sentence the reader could skip, delete. Follow `~/.claude/writing-style.md`.
- **Explain, don't report.** No inventory of changed files, no narration of what you did.
- **No fabricated context.** A business need you cannot source is a question, not a guess dressed up.
- **Read-only.** Nothing edited, committed, or published.

## Task

$ARGUMENTS
