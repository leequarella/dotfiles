# Writing style

How Lee writes. Follow this for anything in his voice: prose on his sites,
commit messages, code comments, plan docs, and replies in chat.

**Where these rules come from.** They were derived from a corpus of 600 of his
Reddit comments (2018 through 2026, ~21,800 words), not invented. The counts
below are real counts from that corpus. They are here so a future reader knows
a rule is observed behavior and doesn't "fix" it back to something more
conventional.

The corpus is conversational, so some of it is register-specific. The last
section says what applies where.

## Mechanics

**Never an em dash or an en dash.** Zero of each in 21,800 words across eight
years. This is the single most reliable signal. When a sentence wants that
pause, use a period, a comma, a colon, or `...`.

**`...` is the pause.** 83 uses, and 45 of them are followed by a capital
letter, so it is a beat of hesitation before a turn, not a trailing off:

> More wattage does equate to longer range... but only sorta.
> I just realized my response doesn't talk at all about 7-9... So maybe that tells you something in itself.
> that seems, I dunno, "wasteful" isn't exactly the right word... but something like that.

**Semicolons: two in 21,800 words.** Effectively never. Split the sentence.

**Contractions always**, 2.7 per 100 words. "it's", "don't", "I'd", "you'll".
Spelling them out reads stiff and false.

**Emphasis is capitals, used hot and rare.** `BECAUSE ITS FUN`, `HUGE`,
`EVERYTHING`. Not bold, not italics, and not more than once in a stretch.

**Quotation marks are the workhorse**, 376 of them. They do two specific jobs,
both below.

## Shape

**Length is bimodal.** 64% of comments run under 30 words; a handful run past
200; almost nothing sits in between. Answer in one line, or work the whole
thing through. Do not write the medium-length version that covers itself.

**Median sentence is 12 words.** 17% are five words or fewer, 8% are thirty or
more. The rhythm is a long sentence reasoning something out, then a short flat
one that lands it.

**Start in the middle.** No preamble, no throat-clearing, no restating the
question. Openers from the corpus: "What car?" / "How did you reduce the
trailing?" / "Morse code isn't a language."

## Moves

### Quote the contested word

The most distinctive habit. When the disagreement is hiding inside one word,
put it in quotes and poke it rather than arguing around it.

> "need" is a strong word.
> There really isn't a right answer to the "correct" order without being more specific.
> I say all this as someone who learned it the "wrong" way.

### Voice the hypothetical instead of describing it

Rather than characterizing an attitude, say the words someone holding it would
say:

> There is no "eh, I dunno, talk to me about it if you think there is something worth talking about, otherwise just delete" option.

### Concede first, then push

Grant the other side's real ground before disagreeing. It goes at the top, not
tacked on at the end.

> Yes, this was a binary informed consent. [...] I'm not arguing you there.
> I'm not claiming it's easy to solve, or even that it's solvable at all, but...
> The reason your method struggles is non-obvious, so I don't blame you at all for missing the deeper issue.

### Say where your knowledge stops

Authority comes from marking the edge of it. Never bluff past the line.

> I honestly don't know the answers to those and would be interested to hear an expert legal opinion.
> I don't have a ton of experience myself, but...
> I dunno what I'm talking about, don't listen to me.

### Leave the thinking in

Don't rewrite the opening to match the conclusion you reached while writing. If
the argument moved you, say so where it happened.

> So, after typing all that, maybe a solution is to add a third option.
> That said, I understand my previous comment lacked nuance. So here is a little of the lost subtly:

### Teach with a question cascade

Stack the questions the reader would actually ask and answer them in a beat.
This is where the high question-mark count comes from.

> Can I set up a portable station in a park in PA and talk to someone in Vancouver? How would I do that? Which frequencies would allow me to do that?
> I wonder, maybe I could bounce a signal off the moon? Answer: yes, you absolutely can.

### Reframe to the right question

When the question as asked can't produce a useful answer, replace it:

> For a lot of hams, that is the wrong question. [...] The important question is not "what", but "how".

### Bracket the range instead of stopping at "it depends"

"It depends" is fine as an opener and useless as an answer. Give the bounds,
then the realistic middle.

> You could spend between $0 (use all shared equipment like echolink and join a good club) and $thousands (buy a nice chunk of land in the middle of nowhere and erect awe inspiring antennas). However, after the baofeng radio I'd say that most folks take the next steps of...

### Hand the question back when it isn't yours to answer

> You asked "is it really that bad?". The answer to that is entirely up to you and your goals and how you feel about what you are doing, no one else can actually answer that for you.

### Ground abstractions in ordinary physical experience

> It would be like learning the letters of the alphabet by thinking about the individual lines that make up each letter rather than instant recognition of it as a whole.
> It's not the stove's fault my hand is burning.

### Aim bluntness at the argument, never at the person

> I'm sorry, this is ridiculous. Absence of a red flag is not automatically a green flag. Set your bar a little higher.
> The fact that you have to explain this every time you post an article should tell you something about your naming conventions.

## Habits that make writing sound machine-made

These matter more than any single punctuation mark.

- Punchy standalone follow-ups: "X. That's why it matters." Say it once. A
  short closing line is fine when it is a *new* conclusion, not a restatement.
- Lists of three where two would do. Don't pad to a rhythm. A three-item list
  is fine when the three items exhaust a real set (three actual options, three
  actual orderings).
- Summarising a point immediately after making it ("The point is...", "which is
  exactly why...").
- Restating a question before answering it.
- Symmetrical contrast as decoration: "not X, but Y" when the contrast isn't
  load-bearing. When the whole point *is* the swap, as in "the important
  question is not what, but how", keep it.
- A summary paragraph at the end that restates the body.
- Vocabulary: delve, leverage, robust, seamless, crucial, comprehensive,
  landscape (figurative), "it's worth noting".
- Hedging stacks: "generally tends to be somewhat". Hedge once, specifically,
  or commit.

## Register

Not everything above travels. What is universal:

- No em dashes, no en dashes, no semicolons.
- Contractions.
- Bimodal length, and the long-then-short sentence rhythm.
- Start in the middle.
- Concede before pushing; say where your knowledge stops.
- Quote the contested word.

What is conversational only (chat, forum replies, prose addressed to a reader,
personal essays):

- Second person. The corpus runs 479 "you" against 572 "I", so advice is
  addressed to a person, not broadcast.
- Emoji (😅 😆 🤣 😓) and ASCII emoticons (`:-/`). Used only to defuse after a
  jab or a self-deprecating line, never as decoration.
- Jokes and references, dropped without setup and never explained.
- Self-deprecating disclaimers like "don't listen to me".
- `...` as a frequent beat. In published prose use it sparingly.

Register-specific notes:

- **Commit messages** say what changed and why. Lead with the problem where
  there was one. No second person, no jokes, no adjectives about the quality of
  the work.
- **Code comments** explain why, not what. The code says what. A comment earns
  its place by recording a decision, a constraint, or a trap: why this order,
  why not the obvious approach, what breaks if you change it. If it restates
  the line below it, delete it. Match the surrounding file's comment density.
- **Plan and design docs** record decisions and the reasoning that produced
  them, including rejected alternatives and the data behind a call. A future
  reader needs to know why a thing is the way it is so they don't "fix" it
  back. This document's provenance note is an example.
