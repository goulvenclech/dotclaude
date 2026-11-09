---
name: "epistemological-apparatus"
description: "Apply Goulven's 5-axis epistemological apparatus (diachronic, robustness, synchronic, social, unconceived alternatives) to diagnose how solid a research result, paper, argument, or claim is. Trigger whenever Goulven asks to \"audit\", \"diagnose\", \"apply the apparatus\", \"check the solidity of\", \"what do you think of this study\", or any French equivalent, especially for Claude deep-research outputs, scientific papers, research summaries, or philosophical arguments."
---

# Epistemological Apparatus

Apply Goulven's 5-axis epistemological apparatus to evaluate the solidity of the artefact under review.

The apparatus suits programme trajectories, scientific currents, traditions of thought, and widely discussed theories or arguments, less so a single isolated paper, since the diachronic and social axes are under-evidenced from one document. If asked to audit one, flag the limit and audit what can be audited.

Keep the output brief, a verdict plus one or two sentences per axis, then a global verdict, conciseness over completeness in the write-up, not in the research. Judge from the evidence in the artefact and any background knowledge available; do not invent missing evidence, but flag what is missing. With no artefact under review, survey the field before auditing, the less visible programmes included.

## Five questions about the programme under review

### 1. Diachronic — does it predict new facts, rely on ad hoc patches, or make predictions nobody can test yet?

Lakatos, amended by Branahl 2025: a programme is **progressive** when it predicts novel facts that get corroborated, **degenerating** when ad hoc patches accumulate to absorb anomalies, and **stagnant** when it stays coherent with few patches but makes predictions that current instruments or budgets cannot test. A pseudo-problem at the core counts as degeneration.

To tell stagnant from degenerating, count the ad hoc moves over the period the field itself treats as a crisis. Many, each rescuing a different anomaly without a common gain → degenerating. Few → stagnant, provided no rival programme is gaining ground, the core holds no pseudo-problem, and the community still invests in it (renewed funding, new researchers entering, see the social axis).

### 2. Robustness — do genuinely independent methods reach the same result?

Following Duhem, Wimsatt 1981 and Bovens-Hartmann 2003, look for triangulation by methods that do not share hidden presuppositions. Convergence within a single instrument, discipline, or theoretical frame is weak evidence.

To test independence, ask whether the converging methods share

- (a) the same instrument family,
- (b) the same discipline,
- (c) the same theoretical frame,
- (d) the same auxiliary hypothesis.

The more answers are "no", the stronger the triangulation. Genuine independence cuts across at least two of these dimensions. Convergence within one dimension only → mono-method risk, flag it.

### 3. Synchronic — is it falsifiable, parsimonious, and consistent with established theory?

Three checks, in order, drawn from Popper, Kuhn 1977 and Williamson 2024.

1. Testability. Does it have consequences that could fail? None → untestability.
2. External consistency. Does it contradict well-established neighbouring theories? A contradiction is a cost, not a verdict; it raises the bar on the diachronic and robustness axes.
3. Degrees of freedom. Count the clauses or parameters added for specific anomalies. One per anomaly → overfit.

Kuhn's values influence the choice without determining it. Simplicity and scope beyond these three checks count only as a tiebreaker when the diachronic and robustness axes leave the verdict open; accuracy and fertility are scored under those two axes, not here.

### 4. Social — is the community behind it organised to catch and correct its own errors?

Following Longino 1990, Douglas 2009, Zollman 2010 (nuanced by Rosenstock-Bruner-O'Connor 2017) and Romero 2016, look for working venues for criticism, uptake of objections, public standards, intellectual authority not concentrated, explicit handling of inductive risk, a replication track record, and no sign of premature lock-in, failure to converge, or invisible degeneration via biased reporting.

Four questions, answerable from public documents.

- (a) Are critiques of the core published in the field's own venues and answered on the merits, rather than dismissed or pushed outside?
- (b) Did the consensus form on a single result, and does the field hold a written evidence standard before adoption (5σ, preregistration, multi-site replication)?
- (c) Are there direct replications by independent teams, and are null results published?
- (d) Is the acceptance threshold public and justified by the cost of each error? Mark it "not applicable" where no decision depends on the result.

The more answers are "yes", the stronger the axis. A "no" on (a) or (b) → lock-in. A "no" on (c) → invisible degeneration. Institutional isolation → insularity.

### 5. Unconceived alternatives — how hard has anyone looked for rivals?

Following Stanford 2006, Stanford 2019 and Dellsén 2017, the absence of a serious rival is evidence only in proportion to the search behind it (the size, time, and incentives the community had to find one). The social axis scores the correction of hypotheses already on the table; this one scores the search for those that are not.

Search for rivals yourself before concluding, beyond those already named, then answer two questions.

- (a) Does the programme's standing rest on elimination ("the only viable option") rather than on the diachronic and robustness axes?
- (b) Has the space been searched, with a long-standing consensus, many independent groups, and alternative programmes funded and published?

(a) "yes" and (b) "no" → cap the verdict at fragile, with alternative-blindness. Only one of the two → cap at defensible. On claims with independent routes of access (robustness axis strong), caveat only.

## Output example

```
**Axis 1 (diachronic):** [verdict + 1-2 sentences]
**Axis 2 (robustness):** [verdict + 1-2 sentences]
**Axis 3 (synchronic):** [verdict + 1-2 sentences]
**Axis 4 (social):** [verdict + 1-2 sentences]
**Axis 5 (unconceived alternatives):** [verdict + 1-2 sentences]

**Verdict: [solid / defensible / fragile / inconclusive (evidence) / inconclusive (balance)] [(stagnant)]**
**Principal pathology (if fragile or worse):** [pick from the fixed vocabulary below, or "none" if solid/defensible]

Strongest: ...
Weakest: ...
Worth checking further: ...
Charitable defence against this verdict: ...
```

### Verdict typology

- **solid** — most axes positive, no major pathology, alternatives well explored.
- **defensible** — net positive but one or two axes show real weakness.
- **fragile** — at least one axis severely compromised; identify which via the pathology label.
- **inconclusive (evidence)** — the artefact does not provide enough information to verdict; ask for more before deciding.
- **inconclusive (balance)** — sufficient evidence, but axes pull in opposite directions and no net verdict emerges. Report the split.

Add the "(stagnant)" tag after the level when the diachronic axis is stagnant. A cap from the unconceived-alternatives axis overrides an otherwise solid or defensible reading.

### Principal pathology — fixed vocabulary

One label only, to name *why* a programme is fragile or worse; the axes state the thresholds.

- **ad-hocness** — survives by accumulated patches (diachronic degeneration).
- **mono-method** — convergence within one dimension only (robustness).
- **untestability** — no consequence that could fail (synchronic). Predictions out of empirical reach fall under diachronic stagnation instead.
- **overfit** — a dedicated clause or parameter per anomaly (synchronic, Williamson 2024). Judged on present structure; what those clauses later predicted is ad-hocness.
- **lock-in** — premature convergence, by over-weighting an early result or by failing to take up dissent (social, Zollman and Longino).
- **insularity** — isolation from the broader scientific corpus, by polarisation or a marginal community (social).
- **invisible degeneration** — biased reporting or absent replication hides the actual state (social, Romero).
- **alternative-blindness** — standing rests on elimination over an unsearched space (unconceived alternatives).

If two pathologies apply, pick the primary one and mention the secondary in the body.

### Adversarial self-check

The charitable defence on the last line is the one a partisan of the audited programme would offer against the verdict. It catches the "illusion of comprehensiveness", five axes producing a complete-looking audit that nonetheless misses something obvious. If the defence is strong, downgrade the confidence of the verdict accordingly.

## Full rationale

For the complete construction, sources, and audit trail, see:

https://goulven-clech.dev/2026/epistemological-apparatus/
