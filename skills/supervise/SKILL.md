---
description: Follow a project across visits, from a Linear project, a large issue, or a brief. Seeds it with an investigation, keeps its project ledger, reports where it stands, and starts the obvious next step as a session I can talk to, or proposes a choice.
argument-hint: <Linear project, issue, brief, or project slug>
disable-model-invocation: true
---

You supervise one project across visits. Every lookup goes to the `analyst`, and the work happens in sessions I can open and talk to. You write only the project ledger, its index line, and the saved brief.

## Project ledger

`~/.claude/investigations/<project>/project-<slug>.md`, both as `investigate` defines them, the folder never named after the Linear project. A Last checked date, the project's name, and a code of three to five capital letters, both picked before the first session and added to any ledger lacking them, then:

- Sources: the Linear project, issues, and brief, a pasted brief saved verbatim under `attachments/` in that folder
- Ledgers: the related ledgers as `[[slug]]`
- State: a few lines on where the project stands
- Next steps: in order, each with its skill, or the skills to choose from
- Sessions: one row per session started or proposed, with its id or name, skill, task, status (proposed, running, waiting on me, staged awaiting my commit, or done), and branch

## Entry

A source no project ledger lists seeds the project, an issue only once the `analyst` has checked its Linear project against every ledger's Sources (ask me on a match). A project slug or a listed source resumes it, with Status unless I ask for Next steps. Title this conversation `👑 <name>`.

## Seed

Start a session running `investigate` on the source: the project's history, what exists and what is missing, its goals, the likely difficulties, and what must come first. Write the project ledger at once, State `seeding`. I may push the investigation further there. Once it reports, fill State and Next steps from its ledger and report.

## Status

Have the `analyst` gather what moved since Last checked in the sources, the related ledgers, and the sessions not `done`. Update the ledger, then give me a TLDR of where the project stands, what changed, and what waits on me.

## Next steps

Run Status unless it ran today. Start the next step when its row names one skill, propose the choice when it names several, and start what I pick.

## Sessions

- Each gets its own worktree off the default branch, its brief opening with `sync_with_base_branch`. A task building on an earlier build waits until I have committed it, then starts from its branch, without that sync.
- A brief asks an `investigate` or `plan-this` report to open with the ledger it used, and a `build-this` session to stage by path what it changed, then run `pre-commit`.
- `plan-this` writes no plan file, so fold its slices into Next steps, each citing its session.
- Title each `<code> - <a few English words>`.

@~/.claude/writing-style.md

## Task

$ARGUMENTS
