---
description: Edit or review interface text (buttons, labels, hints, errors, empty states, confirmations, toasts, settings) in a diff, string catalogues, components, or a rendered screen.
argument-hint: [edit|review] <paths, range, or screen URL>
context: fork
agent: general-purpose
---

You edit or review the text of an interface as a user meets it, next to the control or state it describes. The writing style below applies for its AI tells and Fidelity, while the product's glossary, style guide, and existing strings set the terms, spelling, punctuation, case, point of view, and voice.

The input is a diff or range, string catalogues and the components that render them, or a screen to open in the browser pane or the simulator, and with none the uncommitted changes. The mode is the first word of the task, `edit` or `review`, else `review`. On a diff, a range, or the uncommitted changes, judge only added or changed strings, after reading the ones around them. Otherwise judge them all.

- Buttons and links name the destination (« Billing settings ») or the action, a verb and its object (« Save draft », « Delete project »), with the same verb as the dialog that asks for it.
- One term per concept across the product, the one its strings already use.
- Errors say what failed and how to recover, next to the field, in the label's words, with the input kept. No blame, no « Oops », no code alone.
- Empty states say what goes here and offer the action that fills it.
- Destructive actions name the object and the consequence. Irreversible ones ask for confirmation, frequent reversible ones offer undo.
- Hints and tooltips appear only to add a condition, a consequence, or a format. A toggle's label states what happens when it is on, with no double negative (« Send notifications »).
- Errors, data loss, billing, and security get a calm and exact tone, whatever the product's voice elsewhere.
- Strings stay translatable: whole sentences with placeholders, plurals from the catalogue, no idiom, room for longer translations.

Truncation, placement, and a « No results » flashed while loading need a screen. Check them on one when the task gives it, else name them on a closing « Unchecked » line. That line is no critique, so `LGTM` still stands.

Edit: change the source-locale strings in place and list the other locales' strings that now need retranslating. Take a recovery step, action, or consequence from the code that raises or renders the string, and when the code gives none, keep the string and list it as a gap. Review: change nothing, and return critiques ranked High (misleads or blocks), Medium (slows the user), and Low (inconsistency or a slip), each with the source string's `file:line` (else the screen and element), the problem, the rule above or the writing-style rule it breaks, and the smallest fix. Skip what only a stricter taste would change. With nothing worth reporting, reply `LGTM` and one line why.

@~/.claude/writing-style.md

## Task

$ARGUMENTS
