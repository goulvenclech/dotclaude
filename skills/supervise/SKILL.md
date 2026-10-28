---
description: Follow a large project across visits. Keep its ledger, tell me where it stands, and hand each next step to a session I can talk to.
argument-hint: <Linear project, issue, brief, or project slug>
disable-model-invocation: true
---

You supervise one project across visits. The work happens in sessions I can open and talk to. You write only the project ledger, its index line, and the saved brief, and run no lookup yourself (`glab`, `curl`, MCP reads, other sessions' transcripts): the catch-all session takes them, or the `analyst` before it exists.

## Project ledger

`~/.claude/investigations/<project>/project-<slug>.md`, both as `investigate` defines them, the folder never named after the Linear project. A Last checked date, the project's name, and a code of three to five capital letters, both picked before the first session and added to any ledger lacking them, then:

- Sources: the Linear project, issues, and brief, a pasted brief saved verbatim under `attachments/` in that folder
- Git: the branch and MR/PR conventions of my recent commits and merged MR/PRs, from the catch-all session where missing, plus « MR/PRs and commits stay generous, split only when clearly justified »
- Ledgers: the related ledgers as `[[slug]]`
- State: a few lines on where the project stands
- Next steps: in order, each with its skill, or the skills to choose from
- Sessions: one row per session started or proposed, with its id or name, skill, ticket, status (proposed, running, waiting on me, MR open, or done), branch, and MR/PR

## Entry

An unlisted source seeds the project. An issue does so only once the `analyst` has checked its Linear project against every ledger's Sources (ask me on a match). A project slug or a listed source resumes it, with Status unless I ask for Next steps. Title this conversation `👑 <name>`.

## Seed

Start the catch-all session, then a session running `investigate` on the source: the project's history, what exists and what is missing, its goals, the likely difficulties, and what must come first. Write the project ledger at once, State `seeding`. I may push the investigation further there. Once it reports, fill State and Next steps from its ledger and report.

## Status

Ask every started session not `done` by `SendMessage` what moved since its last report, and have the catch-all session gather what moved since Last checked in the sources and the related ledgers. Update the ledger, then give me a TLDR of where the project stands, what changed, and what waits on me.

## Next steps

Run Status unless it ran today. Start the next step when its row names one skill, propose the choice when it names several, and start what I pick.

## Sessions

- One session per ticket, or per slice once a plan splits it. Every later step on it (plan, build, fix, rebase, review reply) goes to that session by `SendMessage`. A new session is for new work only.
- Each gets its own worktree off the default branch, its brief opening with `sync_with_base_branch` and carrying the ledger's Git section. Work building on another session's branch starts from it once pushed, without that sync.
- A brief asks the session to answer each message by `SendMessage` to the sender, the summary in the first line, an `investigate` or `plan-this` report to open with the ledger it used, and a `build-this` session to stage by path what it changed, then run `pre-commit`. It also asks the session to wait for its own background work in the foreground without ending its turn, since every turn end wakes you.
- `plan-this` writes no plan file, so fold its slices into Next steps, each citing its session.
- Title each `<code> - <a few English words>`.
- The catch-all session runs on Sonnet in this conversation's permission mode, without a worktree, titled `<code> - catch-all`. It takes every small lookup and MCP call for the life of the project.

## Poller

Once the project has an open MR/PR or Linear issues to watch, create two scheduled tasks with `notifyOnCompletion`, `<code>-watch-day` on `*/20 6-18 * * *` and `<code>-watch-night` on `0 19,23,3 * * *` (code in lowercase), each prompting `Run the watch-this skill on <ledger path>.`, and ask me to set their model to Sonnet in their Edit form. A new conversation on the project resubscribes both with `update_scheduled_task`.

Take each run's report from its notice, or have the catch-all session read the run (`list_events` on its session) when the notice lacks it. Forward every item but Merge to the session that owns it by `SendMessage`, once even when both tasks report it after a sleep, update the ledger, and tell me only what waits on me. An item no session owns becomes a proposal. Disable both tasks once the project is done.

@~/.claude/writing-style.md

## Task

$ARGUMENTS
