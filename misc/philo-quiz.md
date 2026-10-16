---
name: philo-quiz
description: "Run a guided philosophy quiz that maps the user's intuitions onto major philosophical currents (metaphysics, epistemology, ethics, free will, mind, politics, religion, meaning), probes when answers are vague, then synthesises their stance in technical vocabulary and recommends two authors, one aligned and one opposed. Use only when the user explicitly asks for a philosophy quiz (\"quiz philo\", \"test philo\", \"philosophy quiz\", \"philosophy test\"). Do not use for general philosophy questions, ad-hoc author or book recommendations, or debates about a specific position."
---

# Philo-Quiz

A conversational quiz, usually for someone with no training in philosophy. It helps them articulate their own stance, name it with the proper vocabulary, and find authors who will deepen or challenge it. It should feel like a philosophical conversation that takes half-formed intuitions seriously and helps put them into words, over about ten turns.

## Axes

| Axis | Currents to discriminate |
|---|---|
| Metaphysics (what is real?) | realism / idealism / materialism / dualism / nominalism / essentialism |
| Epistemology (how do we know?) | rationalism / empiricism / pragmatism / constructivism / scepticism |
| Philosophy of mind | functionalism / identity theory / eliminative materialism / property dualism / substance dualism / illusionism / panpsychism |
| Free will and agency | determinism / free will / compatibilism / fatalism |
| Ethics (what makes an action right?) | consequentialism / deontology / virtue ethics / care ethics |
| Political philosophy | liberalism / communitarianism / libertarianism / socialism / republicanism |
| Religion and the divine | theism (personal god) / deism / pantheism or panentheism / naturalistic atheism / agnosticism / religious naturalism |
| Meaning and values | existentialism / absurdism / nihilism / eudaimonism / stoicism / hedonism |

Blends and midpoints are normal (a materialist realist, an empiricist with constructivist leanings), and the synthesis names them as blends. Ask about every axis by the end, unless an earlier answer has already settled it clearly.

## Questions

Reply in the user's language. One short framing sentence, then the first question. One question per turn, a concrete scenario or short prompt that surfaces the axis without naming it. No jargon, and no steering towards a right answer. Start with metaphysics or epistemology, and let each answer suggest the next axis.

From the second question on, chain off the previous answer in one of two ways.

**Bridge.** Echo a phrase from the answer, then pivot to an adjacent axis.

> *Previous answer (ethics):* « I'd lie. The harm avoided matters more than the principle. »
> *Bridge to epistemology:* « You weighed the likely consequences over the rule, which presumes we can know enough about outcomes to act on them. More broadly, where does most of your trust in knowledge come from: careful reasoning from first principles, or what the world keeps showing us through experience? »

**Tension.** Build the question on an apparent contradiction between an earlier answer and another axis, so the user has to refine or extend their position.

> *Previous answer (free will):* « Our choices are essentially the output of prior causes. »
> *Tension with ethics:* « Hold that thought. Someone commits a serious wrong. Does it still make sense to blame them, to say they deserve consequences, given what you just said about causation? Or does “deserve” need a different grounding for you? »

When neither link is natural, open the new axis with a standalone scenario, as for the first question.

> *Ethics:* A close friend asks you to lie to protect a third person from real harm. When you decide whether to lie, what carries the most weight: the likely consequences, the principle that you shouldn't lie, or the kind of person you'd be if you did?

> *Metaphysics:* Take a mathematical truth, say that 7 is prime. Does it feel like something we discovered (true before anyone thought of it) or something we constructed (true because of how we set up the system)?

> *Religion:* Think of a moment of real awe (a clear night sky, certain music, a storm). Does that feeling point to something beyond it (a presence, a deeper order, a sacred dimension of the world), or is the feeling itself the whole story, a natural human response with nothing further behind it?

## Probing

When an answer is too brief, vague, or hedged (« ça dépend », « both, kind of ») to place the user on the axis, ask one follow-up that sharpens the framing, surfaces a missing distinction, or forces a trade-off. One probe per axis. If they stay undecided, record the axis as ambivalent and move on. Vagueness can itself be a position, often pragmatist or pluralist.

## Synthesis

Three parts, one screen in total, then a one-sentence invitation to continue.

1. **Technical summary.** The position on each axis in proper vocabulary, blends and hesitations named honestly (« a naturalist compatibilist with consequentialist leanings and a sensitivity to virtue ethics on questions of character »). Name an overall tradition (pragmatism, stoicism, existentialism, etc.) only when it fits.
2. **Aligned author.** Their work fits at least two of the user's strongest axes. One entry-point text and a sentence or two on why it fits.
3. **Challenging author.** A serious thinker who steelmans the opposing view on the axis where the user is most confident (Anscombe for a confident consequentialist). Same format, with a sentence or two on where the disagreement is productive.

Both authors must be readable without academic training. Prefer primary sources (Camus, Mill, Arendt, Nussbaum, Sartre, Hadot). Mix eras (a contemporary like Korsgaard, Nagel, MacIntyre, or Han is often the more accessible pick). Confucian, Buddhist, Ubuntu, or classical Indian authors fit when the stance maps onto them.

## Tone

Professional, curious, even-handed. Every credible stance has serious defenders, and Claude's own views stay out of the questions and the recommendations. No preamble before a question.
