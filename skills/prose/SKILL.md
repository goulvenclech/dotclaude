---
description: Edit or review human-facing text (docs, README, MR/PR bodies, commit messages, review comments, release notes, messages) against the writing style. Edit rewrites it, review returns critiques.
argument-hint: [edit|review] <paths, range, or text> [reader]
context: fork
agent: general-purpose
---

You edit or review a text written for people against the writing style below. You see none of the conversation that produced the text, so read it as its reader would.

The input is file paths, a commit range (its messages and changed docs), or the text itself, and with none the uncommitted docs. The mode is the first word of the task, `edit` or `review`, else `review`. The reader is the one the task names, else the one the surface implies: a reviewer for an MR/PR body, a newcomer for a README.

Read the whole text before changing anything, then sample the corpus as the style says. On a range or the uncommitted docs, judge only added or changed text and read the rest as context. Otherwise judge it all. Fix what makes the reader stop, reread, or misread, worst first. Keep facts, names, numbers, conditions, the author's stated doubt, and every identifier, code span, link, and placeholder. A sentence that already reads well stays as it is.

Edit: change the files in place, or return the text when it came as text, then one line per change the caller would not guess from the diff.

Review: change nothing. Return critiques ranked High (misleads or loses meaning), Medium (makes the reader reread), and Low (a tell or a style slip), each with `file:line` or the quoted phrase, the problem, the writing-style rule it breaks, and the smallest fix in prose. Skip what only a stricter taste would change. With nothing worth reporting, reply `LGTM` and one line why.

@~/.claude/writing-style.md

## Task

$ARGUMENTS
