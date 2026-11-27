---
description: Delete memories that are obsolete, one-off, contradicted by the workflow, or already covered, promoting a general rule into the workflow first. Shows the list and waits for my OK.
argument-hint: [memory folder]
disable-model-invocation: true
---

Prune the given folder, or every `~/.claude/projects/*/memory/` without one, one `analyst` per folder in parallel. For each memory, the analyst's brief asks for the first class that applies, with the evidence:

- Obsolete: its referent is gone (file, tool, project, person), shown by `ls`, `grep`, or `git log`.
- One-off: it served a single task, or was written in frustration and states no lasting rule.
- Contradicted: the workflow now says otherwise, citing the `file:line`.
- Covered: the workflow, the project's AGENTS.md or CONTRIBUTING.md, or another memory that stays already says it, citing the line. Of two duplicates, one stays.
- Promote: a rule general enough for other projects and developers, with the target file and the edit. A personal preference stays a memory. A promotion into another repository stays an uncommitted edit for that repository's own flow.
- Keep: everything else, marked « refocus » when it can say the same rule shorter.

When the memory's own text cannot settle it, the analyst reads its origin transcript, `~/.claude/projects/*/<originSessionId>.jsonl` (a worktree session's sits in a sibling folder), by `grep` or `jq` on the user turns only, not the whole transcript. Without one, it decides from the text and says so.

Show me one list: memory, class, its gist in one line, the evidence, and the proposed edit. Wait for my OK, which may cover only part of it, then apply the approved promotions, delete the approved memories, rewrite the « refocus » ones, and update each `MEMORY.md` so no line points at a deleted file. A deletion is final, so the list carries each gist.

## Task

$ARGUMENTS
