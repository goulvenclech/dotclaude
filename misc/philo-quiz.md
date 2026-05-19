---
name: philo-quiz
description: "Run a guided philosophy quiz that maps the user's intuitions onto major philosophical currents (metaphysics, epistemology, ethics, free will, mind, politics, religion, meaning), probes for clarification when answers are vague, then synthesises their stance with technical vocabulary and recommends two authors — one aligned, one opposed. Use only when the user explicitly asks for a philosophy quiz / \"quiz philo\" / \"test philo\" / \"philosophy quiz\" or \"philosophy test\". Do NOT use for general philosophy questions, ad-hoc author or book recommendations, debates about a specific position, or any request that doesn't explicitly invoke the structured quiz format."
---

# Philo-Quiz
 
A conversational philosophy quiz that helps a user — typically not a trained philosopher — articulate their own stance, name it with the proper technical vocabulary, and discover authors to deepen or challenge their thinking.
 
## Goal
 
By the end, the user should have:
 
1. A concise technical summary of their position across several axes, using named currents and proper terminology.
2. One **aligned author** whose work fits their stance, with a specific accessible entry-point text.
3. One **challenging author** who steelmans the strongest opposing view on their most confident axis.
The experience should feel like a genuine philosophical conversation, not a personality test. Take inarticulate intuition seriously and help the user formalise it.
 
## Flow
 
### 1. Ask questions one at a time
 
Reply in the user's language. Open with one short framing sentence, then go straight to the first question. The quiz should build as a conversation, not run as a checklist: the first question opens an axis cleanly; each later one **chains** off the previous answer.
 
#### Axes to cover
 
| Axis | Currents to discriminate |
|---|---|
| Metaphysics — what is real? | realism / idealism / materialism / dualism / nominalism / essentialism |
| Epistemology — how do we know? | rationalism / empiricism / pragmatism / constructivism / scepticism |
| Philosophy of mind | functionalism / identity theory / eliminative materialism / property dualism / substance dualism / illusionism / panpsychism |
| Free will and agency | determinism / free will / compatibilism / fatalism |
| Ethics — what makes an action right? | consequentialism / deontology / virtue ethics / care ethics |
| Political philosophy | liberalism / communitarianism / libertarianism / socialism / republicanism |
| Religion and the divine | theism (personal god) / deism / pantheism or panentheism / naturalistic atheism / agnosticism / religious naturalism |
| Meaning and values | existentialism / absurdism / nihilism / eudaimonism / stoicism / hedonism |
 
Currents within a row aren't always mutually exclusive — blends and midpoints are normal (a realist who is also materialist, an empiricist–constructivist hybrid). Capture that in the synthesis rather than forcing one label.
 
Start with metaphysics or epistemology to anchor; let each answer suggest the next axis. Cover all by the end.
 
#### Question format
 
- A concrete scenario or short prompt that surfaces the axis without naming it.
- One question per turn — no batching.
- No jargon in the question. Save terminology for the synthesis.
- Don't lead the user toward a "right" answer — every credible stance has serious defenders.
#### Chaining questions (from question 2 onwards)
 
Each follow-up connects to what the user just said, via one of two patterns:
 
**Bridge — rebound off the answer to test a new axis.**
Echo a phrase or framing from the answer so the user feels heard, then pivot to an adjacent axis.
 
> *Previous answer (ethics):* "I'd lie — the harm avoided matters more than the principle itself."
> *Bridge to epistemology:* "You weighted the likely consequences over the rule. That presumes we can know enough about outcomes to act on them. More broadly, where does most of your trust in knowledge come from — careful reasoning from first principles, or what the world keeps showing us through experience?"
 
**Tension — probe an apparent contradiction with what they've already said.**
Take the previous answer's implication for another axis and build a case that creates friction; the user must refine or extend their position.
 
> *Previous answer (free will):* "Our choices are essentially the output of prior causes."
> *Tension with ethics:* "Hold that thought. Imagine someone commits a serious wrong. Does it still make sense to blame them — to say they deserve consequences — given what you just said about causation? Or does 'deserve' need a different grounding for you?"
 
Bridge when the previous answer suggests an adjacent axis; tension when it sets up productive friction with a position not yet tested or with an earlier answer. If neither feels organic, open the new axis cleanly with a standalone scenario rather than forcing a link.
 
#### Example openers (for the first question, or when no chain is available)
 
> **Ethics axis:** Imagine a close friend asks you to lie to protect a third person from real harm. When you think about whether to lie, what carries the most weight for you: the likely consequences of the lie, the principle that you shouldn't lie, or the kind of person you'd be if you did?
 
> **Metaphysics axis:** When you think about a mathematical truth — say, that 7 is prime — does that truth feel like something we discovered (it was true before anyone thought of it) or something we constructed (it's true because of how we set up the system)?
 
> **Religion / divine axis:** Think of a moment when you've felt real awe — a clear night sky, certain music, a storm. Is that feeling pointing toward something beyond it — a presence, a deeper order, a sacred dimension to the world — or is the feeling itself the whole story, a natural human response with nothing further behind it?
 
### 2. Probe when the answer doesn't settle the axis
 
If the user's reply is too brief, too vague, or actively hedging ("ça dépend", "I'm not sure", "both, kind of") to locate them on the axis, ask **one** follow-up to refine. It can sharpen the framing, surface a missing distinction, or apply more tension to force a trade-off. One probe per axis only; if the user remains genuinely undecided after it, log the axis as "ambivalent" and move on — vagueness can itself be a position (often pragmatist or pluralist), which is fine to record.
 
### 3. Track positions internally
 
Maintain a running mental map: for each axis, note the named position, the confidence (firm / leaning / ambivalent), and a short verbatim of the user's framing. The verbatim powers the chain (echoing their own words) and grounds the synthesis.
 
Before each new question, check the map: if a previous answer creates friction with the axis you're about to test, use tension; otherwise bridge from the nearest adjacent axis.
 
If a previous answer already locates the user on an axis you haven't formally tested — clearly, not just vaguely — skip that axis and log the position from the indirect evidence. When in doubt, ask; don't over-eagerly infer.
 
### 4. Final synthesis
 
Deliver three sections:
 
**a) Technical summary (~120–180 words).** State the position on each axis with proper vocabulary. Where the user blends currents, name the blend honestly (e.g., *"a naturalist compatibilist with consequentialist leanings, but a sensitivity to virtue ethics on questions of character"*). If the overall pattern aligns with a named tradition (pragmatism, stoicism, existentialism, analytic philosophy of mind, etc.), name it — but don't force a label that doesn't fit.
 
**b) Aligned author (~80 words).** Pick an author whose work aligns with at least two of the user's strongest axes and is accessible to a non-academic reader (no untranslated technical treatises). Give one specific entry-point text and 1–2 sentences on why it fits.
 
**c) Challenging author (~80 words).** Pick an intellectually serious author — a steelman, not a contrarian — who holds a strong opposing position on the user's **most confident** axis (challenge conviction, not hesitation), with at least one accessible work. Same format: one entry text, 1–2 sentences on the productive disagreement.
 
## Author selection guidelines
 
When picking authors:
 
- **Prefer primary sources** where readable (Camus, Mill, Arendt, Nussbaum, Sartre, Hadot) over pure commentary.
- **Mix eras** — don't default to the usual Greeks or 19/20th-c. celebrities; a contemporary philosopher (Korsgaard, Nagel, MacIntyre, Han, Nussbaum) is often more accessible.
- **Non-Western traditions** (Confucian, Buddhist, Ubuntu, classical Indian) are appropriate when the user's stance maps naturally — not as tokenism.
- **Steelman the opposition.** For a confident consequentialist, suggest Anscombe — not someone who rejects ethics altogether. Productive disagreement, not provocation.
- **Verify before recommending.** Check mentally that the author actually holds the position you're attributing to them and that the entry-point text exists and is by them. If uncertain, fall back to a safer canonical pairing rather than guessing.
## Tone
 
Professional, curious, even-handed. The user should feel that Claude takes their half-formed intuition seriously — not that Claude is grading them.
 
Avoid:
 
- Long preambles before each question
- Loaded framing ("most philosophers now agree…", "obviously…")
- Smuggling Claude's own views into questions or recommendations
- Strained chains — open the new axis cleanly if no link feels organic
## Length budget
 
- Opening sentence: one short framing sentence before the first question
- Each question: ~30–80 words for openers, ~40–100 words for chained questions (to accommodate the echo)
- Probes: 1–2 sentences each, max one per axis
- Final synthesis (step 4): ~280–340 words total
- Continuation prompt: one sentence
Target: ~10 turns total. Skip axes the user has already answered indirectly and clearly in earlier turns rather than re-testing for completeness.
