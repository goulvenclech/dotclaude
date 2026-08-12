---
description: Investigate a bug, a refactor, an unfamiliar domain, or a pre-feature question in depth.
---

## Workflow

A sustained loop, not a pipeline. Investigating is **your** job as the main agent. You keep a living **findings ledger** and work it until confidence stops moving and your tools are spent. Analysts do the bulk lookups, and exploit every available MCP, so your context stays clean for reasoning, while fixers confirm or refute findings — strongest by a focused reproduction test, by close analysis where that is not possible or apt.

### The findings ledger

Your durable working memory. Maintain it as a markdown file under a per-project folder: `~/.claude/investigations/<project>/<slug>.md` (create the folder if needed; `<project>` is the project name — `remote`, `sampo`, `satteri`, …). The `<slug>` is concise kebab-case but packs the keywords you would search on to find it again — domain, main module touched, ticket id, etc. (e.g. `audit-trail-missing-source`, `npm-oidc-trusted-publishers`). This lets the loop run long without bloating your context. Carry a **Last updated** date at the top. Seed it from the prompt, grow it as you probe, and let *it* — not a fixed step list — drive what you do next.

Before seeding, **look for prior art** in the project's folder (start from its index, below) for an existing ledger on the same subject. If one is recent — under a month old — and on-topic, resume it instead of starting fresh: re-verify each finding still holds against current code and data before trusting its confidence, then refresh the **Last updated** date. Link ledgers from a related thread with `[[slug]]` wherever it helps the reader follow the trail.

Keep a per-project index at `~/.claude/investigations/<project>/INDEX.md` — one line per ledger (`slug` · description · Last updated) — and create or update its entry as you go, so prior art stays findable. The description is **strictly under 250 characters**: the idea of the investigation plus the keywords a future investigation would search to judge relevance. No state that goes stale immediately (branch status, current confidence, next steps).

One row per **finding** — a falsifiable claim, a domain fact, a risk, or a design question — each carrying:
- **Claim** — one line, tied to a `file:line` or a named source (issue, MCP record, log)
- **Type** — bug · domain-fact · risk · design-question
- **Confidence** — earned by evidence, never assumed:
  - **Confirmed** — a reproduction that behaves as predicted, or unambiguous data from an authoritative source
  - **Likely** — code and data converge, but nothing reproduces it directly
  - **Possible** — one plausible signal, not yet probed hard
  - **Refuted** — actively disproven; keep one line so it is not re-opened
  - **Discarded** — irrelevant or subsumed; keep one line why
- **Evidence** — the TLDR that earns the confidence: reproduction-test path, MCP data, code citation, command output
- **Next probe** — what would move the confidence, or `blocked — needs <tool/access>` when nothing you have can

A design-question carries no tool-driven confidence; it is for the user.

### The loop

Repeat until you converge:
1. **Pick the weak point** — the finding whose confidence most needs moving, or a gap with no finding yet. The ledger chooses, not a script.
2. **Probe it**, spawning independent work in parallel (multiple Agent calls in one message):
   - **Analysts** for bulk lookups — codebase traversal, `git log`, issues/PRs, logs, docs (internal and dependency/vendor, wherever accessible, relevant, and current), and every relevant **MCP** (Notion, Linear, Honeycomb, Sentry, Snowflake, trackers, dashboards, etc), pulled to the max
   - **Fixers**, one per claim to validate — strongest by a focused reproduction test where the claim is replicable (kept on a confirming verdict, deleted otherwise), by close analysis where it is not
3. **Update the ledger** — raise, lower, or discard confidence; rewrite each evidence TLDR; add findings the probe surfaced; flag design-questions; mark `blocked` where a tool or access is missing.
4. **Decide** — if any confidence can still move, loop; otherwise stop.

### When to stop

Converge when every finding is **Confirmed**, **Refuted/Discarded**, **blocked** on a clearly-named missing tool or access, or a **design-question** for the user — and a full pass surfaces nothing new. Push to the end of what your tools allow; do not settle at the first plausible answer. If a design or policy decision blocks further analysis, surface it to the user mid-loop and carry on with the parts that don't depend on it.

### Report

Write the most useful, honest report you can. Shaped for the reader, not to a fixed template, but it should:
- lead with a TLDR with what the investigation establishes, and how much to trust it
- present the findings clearly and honestly by confidence — a **Likely** is not a **Confirmed** — each with its evidence and any reproduction test behind it
- separate genuine **design questions** for the user from what the tools can settle (do not invent ambiguity)
- name what you could not settle, and the exact tool, credential, or access that would have closed it

Stop here. Your job is not to plan the fix or implement it.

## Guardrails

- **Read-only on the repo and the world**: no fixes, commits, pushes, issue/PR creation, or MCP writes. The only writes are the findings ledger and its index (working notes outside the repo) and fixer reproduction tests (kept on confirming verdicts, deleted otherwise).
- **Subagents for all lookups**: codebase traversal, docs, issues, APIs, MCP, test runs, data exploration — always delegate, in parallel when independent. Exploit every available MCP. Judgement stays with you.
- **Confirm, don't assert**: confidence only rises on evidence. **Confirmed** demands a reproduction or unambiguous data.
- **Honesty over completeness**: when your tools cannot settle a point, name the gap. Never paper over it with a confident-sounding guess.
- **Production forbidden**: never create, modify, or delete anything in production environments.

## Task

$ARGUMENTS
