# Writing style

For any user-facing text: PR/MR bodies, commit messages, review comments, docs, release notes. Skills load it with `@~/.claude/writing-style.md`.

## Core

- Concision above all. Cut preamble, recap, and stacked hedges. Default is delete, keep what carries meaning.
- Sample the corpus. Where the surface has precedent (recent merged MR/PR bodies, `git log`, sibling docs), read a few and match their length and register.
- British English in spelling, idiom, and punctuation, soft enough for international readers, no regional slang.
- Keep accepted technical and domain jargon and acronyms when they are clear.
- French quotation marks « » when quoting. Oxford comma in lists of three or more.
- Asides in parentheses `(like this)`, examples `(e.g. like this)`.
- _Italics_ for titles of works and foreign words, inline `code` for identifiers, commands, and file names.

## Tone

- Direct and dry. No greetings, no boilerplate.
- When the ground is uncertain, use the conditional, a question, or explicit room for doubt.
- In texts addressed to others (review comments, Slack, issue replies), push back as an observation.

## AI tells

Generated-text reflexes that add noise. Cut on sight.

- Antithesis: say what a thing is, without contrasting it with what nobody claimed (« X, not Y », « rather than », « not just X, but Y », « A over B »).
- Stock phrasing (« delve », « robust », « seamless », « leverage », « crucial », « ensure », « it's worth noting », « in summary »): the plain word, or none.
- Punchlines and hype: no closing zinger, no marketing adjectives, no triplets for rhythm.
- Em-dashes, semicolons, colons, bold, and italics stay rare. A comma or a full stop usually does.

## Format by surface

- PR/MR body: keep every section of the repo's template. The free description is the shortest text that orients a reviewer, without the obvious, the linked issue, or implementation detail.
- Commit title: `type(scope): short description`, lowercase, imperative, one line. Body in the imperative, blank line after the title, wrapped around 72 characters.
- Review comment: `file:line`, the concern, the smallest safe fix. No patches.
- Release note: the user-facing outcome.

## Fidelity

Keep the key points, tone, and structure of the source. Add no meaning, drop none. Flag an ambiguous brief.
