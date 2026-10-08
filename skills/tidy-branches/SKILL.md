---
description: Delete local branches and worktrees whose work has landed upstream, and report what was kept and why.
argument-hint: [scope]
disable-model-invocation: true
---

Fetch with prune first, or « merged » reads stale. Then take stock of every local branch (upstream, tracking status) and every worktree (branch, clean or dirty, locked).

A branch is merged when its upstream is gone after the PR/MR merged, the only signal that catches squash merges. Commits all present in the default branch confirm fast-forward and merge-commit cases but miss squashes, so never rely on that alone. Anything that fails both is kept.

For each merged branch, remove its worktree first, then the branch with `git branch -d`. A squash-merged branch needs `-D`, which the hook denies: print those deletions in one `bash` block for me to run. Prune worktree entries whose directory is gone. Never touch the current branch, the default branch, the primary worktree, a branch with commits that exist nowhere upstream, or a dirty or locked worktree. Flag those instead.

Report in a few lines: what was removed, what was kept and why, each with the one thing to do about it if any.

Local only, no pushing, no remote deletion. Any doubt that work is preserved means keep and flag.

## Task

$ARGUMENTS
