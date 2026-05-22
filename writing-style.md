# Writing style

Pass this file as context (`@~/.claude/writing-style.md`) when drafting any user-facing text: PR/MR bodies, commit messages, review comments, docs, release notes, etc.

## Core

- **Concision above all.** Cut filler. A short clear sentence beats a long verbose one. Default posture is delete, keep only what carries meaning.
- **British English** throughout spelling, idiom, punctuation. Soft enough for international readers, no regional slang. 
- **Standard technical/domain terms**: keep accepted jargon and acronyms (software, finance, ops) when they're clear and unambiguous.
- **French quotation marks** « » in place of " " when quoting.
- **Oxford (serial) commas** in lists of three or more items.
- **Asides** uses `(like this)` when discreet, examples `(e.g. like this)`, or short lists `(this, that, and the other)`. Reserve em-dashes — like this — for emphatic or meaningful asides, to introduce an emphatic punchline, qualification, or reversal — like this.
- **_Italics_** for titles of works, or foreign words: `_bounded context_`, `_Le café c'est pas sorcier_`.
- **Inline `code`** for identifiers, commands, file names, and short code snippets.

## Tone

- Direct, dry, no boilerplate. No greetings, no « I hope this helps », no « as you know ».
- Not overly assertive when the ground is uncertain — lean on the conditional, phrase as a question, or leave explicit room for doubt.
- Push-back lands better as observation than verdict. Especially in texts addressed to others (review comments, Slack, issue replies).

## Format by surface

- **PR/MR body** — one-paragraph *what* and *why*, then follow the repo's template(s). Default to a bullet list of notable changes if no template exists.
- **Commit title** — `type(scope): short description`. Lowercase, imperative mood, one line.
- **Commit body** — imperative mood; blank line after the title; wrap around 72 chars.
- **Review comment** — point to `file:line`, state the concern, suggest the smallest safe fix. No patches.
- **Release note** — user-facing outcome, not internal mechanics.

## Fidelity

- Preserve the key points, tone, and structure of the source or brief.
- Never add meaning that isn't in the source, but never drop meaning that is.
- If the brief is ambiguous, flag it explicitly rather than guessing.
