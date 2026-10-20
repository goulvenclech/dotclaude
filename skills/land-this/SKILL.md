---
description: One tick on an open MR/PR, returning its state and the caller's next move. One call per MR/PR, in parallel, under /loop until every move is Merge or Stop.
argument-hint: <MR/PR URL>
context: fork
agent: analyst
background: false
---

Read the MR/PR: head sha and branch, pipeline with each failed job's log tail, threads and comments (author, file, line, body, resolved or not, who replied last), approvals given and required, merge status as the host reports it, whether the base moved since the head was pushed.

Reply with the state in a few lines, then the caller's moves, each with what it needs to act:
- Merge: the host reports it mergeable. Stop: merged or closed.
- Fix: the pipeline failed on something the diff explains, with the job and the lines that say why.
- Retry: a flaky or infrastructure failure, with the command.
- Rebase: a stale or conflicting base.
- Triage: threads awaiting the author, one line each with `file:line`.
- Wait: none of the above. Next check when a running pipeline should end, else in 30 minutes.

## Task

$ARGUMENTS
