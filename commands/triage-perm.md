Triage one command that just prompted for permission: add to allow-list, leave on ask, or block via hook.

## Inputs

The exact command string that triggered the prompt, via `$ARGUMENTS`. May be a shell pipeline (`cd … && cmd | tail`) or an MCP `server:tool` call.

## Procedure

### 1. Parse
Split on `&&`, `||`, `;`, `|`, `bash -c '…'`. For each atomic segment, extract executable + flags + args.

### 2. Check current state
- Allow-list: `~/.claude/cursor/permissions.json` (symlinked from `~/.cursor/permissions.json` for Cursor IDE). Keys: `terminalAllowlist`, `mcpAllowlist`. If a segment is already covered, the prompt comes from a stale Cursor window → recommend *Developer: Reload Window*.
- Hooks: `~/.claude/settings.json` (`hooks.PreToolUse`) + scripts under `~/.claude/hooks/`. Note any segment already blocked.

### 3. Classify each uncovered segment
- **ALLOW** — strictly read-only or non-destructive (lookups, `--check`, dry-run, tests, idempotent installs). Pin via the narrowest pattern (`cmd:argsGlob*`).
- **ASK** — destructive only with specific flags, or safety depends on run-time context. Keep as-is, explain why.
- **BLOCK** — irreversible or production-affecting with no useful auto-run case. Extend an existing hook regex when related, else propose a new hook script.

### 4. Propose
One tight verdict block per segment:

    SEGMENT: <command>
    VERDICT: ALLOW | ASK | BLOCK
    REASON:  <one sentence>
    ACTION:  <exact diff or "(no change)">

ALLOW → JSON line to insert in `~/.claude/cursor/permissions.json`.
BLOCK → regex to add to `~/.claude/hooks/block-dangerous-git.sh`, or path + body of a new hook script under `~/.claude/hooks/` plus the `~/.claude/settings.json` patch.

### 5. Apply on approval
Edit only after explicit user approval. Remind to reload Cursor if the allow-list was touched.

## Guardrails

- **Read-only by default**: classify first, edit only after approval.
- **Narrowest pattern wins**: prefer `cmd:argsGlob*` over bare `cmd` to avoid over-allowing.
- **No `bash -c` allow-listing**: it's an arbitrary-code escape hatch — always ASK or refactor.
- **No multi-token base hacks**: never invent `git -C:* …` or similar undocumented Cursor syntax — recommend a refactor instead.
- **Hooks are the only deny mechanism**: Cursor IDE has no denylist, so real blocks must go through a `PreToolUse` hook.

## Task

$ARGUMENTS
