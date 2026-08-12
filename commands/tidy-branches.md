---
description: Survey local branches and worktrees, delete the ones already merged upstream, and report a short state summary.
---

## Procedure

### 1. Survey

Refresh remote-tracking state and prune deleted upstreams first — otherwise "merged" reads stale. Then take stock of every local branch (its upstream and tracking status) and every worktree (its branch, and whether it's clean).

### 2. Decide what's merged

A branch is safe to drop once its work has landed upstream. Cross-check signals rather than trusting one:
- Its upstream is gone — the remote branch was deleted after the PR/MR merged. Strongest signal, and the only one that catches squash merges.
- All its commits already exist in the default branch. Catches fast-forward and merge commits, never squash merges — don't rely on it alone.

Treat anything that fails both as *not merged*.

### 3. Clean the clear cases

For each merged branch: if a worktree holds it, remove the worktree first, then the branch. Also prune worktree entries whose directory is already gone.

Never touch:
- the current branch or the default branch;
- a branch carrying commits that exist nowhere upstream (unpushed work);
- a worktree with uncommitted changes, or a locked one — flag it instead;
- the primary worktree.

### 4. TLDR

A short, scannable report:
- what was removed;
- what was kept and why — active work, unmerged commits, dirty worktrees, or a merge status too ambiguous to call — each with the one thing to do about it, if anything.

## Guardrails

- **Delete only the unambiguous.** Any doubt that work is preserved → leave it and flag it. Merged, recoverable work only; never destructive to unpushed or uncommitted state.
- **No pushing, no remote deletion.** Local hygiene only.
- **Honesty over tidiness.** A cluttered-but-safe report beats a clean-but-lossy one.

## Task

$ARGUMENTS
