---
description: One poll of the Git host and Linear for a supervised project, reporting what changed since the last poll and which session owns it. Run by the project's scheduled tasks.
argument-hint: <project ledger path>
---

Read the ledger's Sources and Sessions, then `project-<slug>.poll.json` beside it (absent on the first poll, which reports everything open): the last poll's time, the state last reported for each MR/PR and issue, and the ids of the todos or notifications already reported. Then read:

- The Git host (`glab` or `gh`): pending todos or notifications, and each open MR/PR the Sessions rows name, one by one (head pipeline, merge status, unresolved threads, approvals), since a list never shows a finished pipeline.
- Linear, through its MCP: the Sources issues updated since the last poll, with new comments and status changes.

Keep what concerns the project and differs from the saved state, or is a todo or notification not yet reported, and write the new state back. Reply with one line per item, giving its URL, what changed, the session that owns it (or none), and the move:
- Fix: the pipeline failed, with the failed jobs. The owning session reads the logs and decides between a fix and a retry.
- Rebase: a conflict or a stale base.
- Triage: new comments or threads awaiting the author.
- Merge: the host reports it mergeable, for the user. Stop: merged or closed.
- Note: anything else (a review request, a mention, a Linear status or comment).

With nothing new, reply `Nothing new.` alone.

## Task

$ARGUMENTS
