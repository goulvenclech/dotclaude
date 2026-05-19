---
name: epistemological-apparatus
description: Apply Goulven's 5-axis epistemological apparatus (Lakatos-Branahl diachronic, Schindler synchronic, social-Longino-Zollman-Romero, Sprenger-Hartmann-Wimsatt-Schupbach formalisation, Bird/Dellsén teleological) plus the Stanford safeguard to diagnose how solid a research result, paper, document, or claim is. Trigger whenever Goulven asks to "audit", "diagnose", "apply the apparatus", "check the solidity of", "what do you think of this study", or any French equivalent ("audit critique", "qu'en penses-tu de ce papier", "fais une passe sur ce résultat", "applique l'appareil"). Especially when assessing a Claude deep-research output, a scientific paper, a research summary, a philosophical argument, or any claim where epistemic robustness matters.
---

# Epistemological Apparatus — Quick Diagnostic

Apply Goulven's 5-axis epistemological apparatus to evaluate the solidity of the artefact under review.

**Best suited to**: programme trajectories, scientific currents, traditions of thought, widely discussed theories or arguments. Less suited to a single isolated paper (some axes — diachronic, social — are under-evidenced from one document). If asked to audit an isolated paper, flag this scope limit and audit what can be audited.

**Output is brief and actionable**: 2-3 sentences per axis, then a global verdict. Conciseness over completeness. Judge from the evidence in the artefact and any background knowledge available; do not invent missing evidence, but do flag what is missing.

## The five questions

### 1. Diachronic — does the programme anticipate new facts, or accommodate them after the fact?

Lakatos amended by Branahl 2025. **Progressive** = predicts novel facts that get corroborated. **Degenerating** = ad hoc patches accumulate to absorb anomalies. **Stagnant** = internally coherent, few patches, but no new predictions either — awaiting external constraint lifting (instrumental, computational, conceptual).

*Operational tiebreaker stagnant vs degenerating*: count the ad hoc moves over the last decade. Few or none, and the programme keeps its shape intact → stagnant. Many, each rescuing a different anomaly without a common gain → degenerating. If patches multiply *and* internal coherence erodes, the case for degeneration is strong.

### 2. Synchronic — does the theory cover much with little, without contradictions or ad hoc adjustments?

Schindler 2018. Check the five theoretical virtues: empirical accuracy, consistency (internal + with established corpus), unifying power, simplicity, fertility. Joint convergence = quality signature. Systematic drift towards dedicated patches = degeneration signature.

### 3. Social — is the community carrying this programme structured to detect and correct its own errors?

Longino, Douglas, Zollman (nuanced by Rosenstock-O'Connor-Bruner 2017), Romero. Look for: working venues for criticism, uptake of objections, public standards, intellectual authority not concentrated; explicit handling of inductive risk; replication track record; risk of premature lock-in, durable polarisation, or invisible degeneration via publication bias.

### 4. Formalisation — do the conclusions hold across genuinely independent routes of access?

Sprenger-Hartmann + Wimsatt + Schupbach. Triangulation by methods that don't share hidden presuppositions. Convergence within a single instrument, discipline, or theoretical frame is weak evidence.

*Operational test of independence*: do the converging methods share (a) the same instrument family, (b) the same discipline, (c) the same theoretical frame, (d) the same auxiliary hypothesis? The more answers are "no", the stronger the triangulation. Genuine independence cuts across at least two of these dimensions. Convergence within one dimension only = mono-method risk, flag it.

### 5. Teleological — does the programme put us in a position to better understand the phenomena at stake?

Currently TODO in Goulven's framework (Bird epistemic vs Dellsén noetic). Apply pragmatically: does the artefact accumulate true knowledge (Bird) or organise understanding (Dellsén)? Note both readings if they diverge.

### Meta — have serious alternatives been explored?

Stanford 2006. No verdict is decisive if the space of competing hypotheses has not been taken seriously. Flag missing rivals as a global caveat.

## Output example

```
**Axis 1 (diachronic):** [verdict + 1-2 sentences]
**Axis 2 (synchronic):** [verdict + 1-2 sentences]
**Axis 3 (social):** [verdict + 1-2 sentences]
**Axis 4 (formalisation):** [verdict + 1-2 sentences]
**Axis 5 (teleological):** [verdict + 1-2 sentences]
**Stanford meta:** [verdict + 1 sentence]

**Verdict: [solid / defensible with reservations / fragile / inconclusive-by-evidence / inconclusive-by-balance]**
**Principal pathology (if fragile or worse):** [pick from the fixed vocabulary below, or "none" if solid/defensible]

Strongest: ...
Weakest: ...
Worth checking further: ...
Charitable defence against this verdict: ...
```

### Verdict typology

- **solid** — most axes positive, no major pathology, alternatives well explored.
- **defensible with reservations** — net positive but one or two axes show real weakness.
- **fragile** — at least one axis severely compromised; identify which via the pathology label.
- **inconclusive-by-evidence** — the artefact does not provide enough information to verdict; ask for more before deciding.
- **inconclusive-by-balance** — sufficient evidence, but axes pull in opposite directions and no net verdict emerges. Report the split.

### Principal pathology — fixed vocabulary

Use these labels (one only) to name *why* a programme is fragile or worse:

- **ad-hocness** — survives by accumulated patches (axis 1 degeneration).
- **untestability** — no novel predictions are even formulable (axis 1 stagnation hardening into uselessness, or axis 2 fertility nil).
- **mono-method** — convergence holds within a single instrument, discipline, or frame (axis 4 failure).
- **lock-in** — community converged prematurely, dissent suppressed (axis 3, Zollman pathology).
- **insularity** — institutional isolation from the broader scientific corpus (axis 3, polarisation or marginal community).
- **alternative-blindness** — serious rivals have not been explored or even formulated (Stanford meta).
- **overfit** — virtues degraded by dedicated distinctions for each anomaly (axis 2 + Williamson 2024 analogue).
- **invisible degeneration** — publication bias or replication failures hide the actual state (axis 3, Romero pathology).

If two pathologies apply, pick the primary one and mention the secondary in the body.

### Adversarial self-check

The final line of the verdict block must propose the best charitable defence a partisan of the audited programme would offer against the verdict. This catches the "illusion of comprehensiveness" — five axes producing a complete-looking audit that nonetheless misses something obvious. If the charitable defence is strong, downgrade the confidence of the verdict accordingly.

## Full rationale

For the complete construction, sources, audit trail, and the conscious TODOs (axis 5 Bird vs Dellsén, position on Schindler's convergent realism), see:

https://www.notion.so/goulvennev/Epistemological-Apparatus-3649a9d2f693804398efd83c801c729e
