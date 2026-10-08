---
description: Investigate a bug, a refactor, an unfamiliar domain, or a pre-feature question in depth. Read-only, ends with a report, no fix and no plan.
argument-hint: <question, bug, or ticket>
---

You investigate as the main agent, keeping a findings ledger and working it until confidence stops moving. Analysts do every bulk lookup and pull every available MCP. Fixers confirm or refute claims, by a focused reproduction test where the claim is replicable and by close analysis otherwise. Judgement stays with you.

## Ledger

`~/.claude/investigations/<project>/<slug>.md`, where `<project>` is the repository's directory name and `<slug>` is kebab-case packing the keywords a later search would use (domain, module, ticket id). A Last updated date at the top, then one row per finding:

- Claim: one line, tied to a `file:line` or a named source (issue, MCP record, log)
- Type: bug, domain-fact, risk, or design-question
- Confidence: Confirmed (a reproduction behaves as predicted, or unambiguous data from an authoritative source), Likely (code and data converge, nothing reproduces it), Possible (one plausible signal), Refuted (disproven, kept in one line so it is not reopened), Discarded (irrelevant or subsumed, kept in one line why)
- Evidence: the TLDR that earns the confidence
- Next probe: what would move it, or `blocked — needs <tool/access>`

A design-question carries no confidence, it is for the user.

Before seeding, read `~/.claude/investigations/<project>/INDEX.md` for prior art. Resume a ledger under a month old on the same subject: re-verify each finding against current code and data, then refresh the date. Link related ledgers with `[[slug]]`. Keep the index current, one line per ledger (`slug` · description · Last updated), the description under 250 characters and free of state that goes stale (branch, confidence, next steps).

## Loop

Pick the finding whose confidence most needs moving, or a gap with no finding yet. Probe it with analysts and fixers in parallel (several Agent calls in one message), then update the ledger. Repeat until every finding is Confirmed, Refuted or Discarded, blocked on a named tool or access, or a design-question, and a full pass surfaces nothing new. Push to the end of what your tools allow. When a design or policy decision blocks one branch of the analysis, surface it to the user mid-loop and carry on with the rest.

## Report

Lead with a TLDR: what the investigation establishes and how much to trust it. Then the findings by confidence, each with its evidence and any reproduction test. Then the design questions for the user, kept apart from what the tools settled. Then what you could not settle and the exact tool, credential, or access that would have closed it. Stop there.

## Guardrails

- Read-only on the repo and the world. The ledger, its index, and fixer reproduction tests (kept on a confirming verdict, deleted otherwise) are the only writes.
- Every lookup goes through subagents, in parallel when independent.
- Confidence rises on evidence only. Confirmed needs a reproduction or unambiguous data.
- When your tools cannot settle a point, name the gap.

## Task

$ARGUMENTS
