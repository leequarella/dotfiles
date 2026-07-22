---
name: lattice-feedback-companion
description: 'Helps anyone draft sharp, evidence-grounded Lattice peer feedback in either direction, the personalized request sent when asking a teammate to review you, or the response written when a teammate asks for feedback. Instead of generic "great job" feedback that gets generic praise back, it pulls in real shared work (Slack, Google Docs, and anything else the user adds) and grounds every question or answer in Lattice''s published best practices for specific, actionable feedback. Trigger for phrases such as "I need to request feedback from a teammate," "help me write feedback questions for my Lattice cycle," "someone asked me for peer feedback," "I need to write my peer review for someone," "draft my response to a feedback request," "help me answer this Lattice review," or any variant of requesting or responding to Lattice peer or upward feedback, even without saying "Lattice" explicitly.'
---

# Lattice Feedback Companion

Most peer feedback is vague because writing it is hard: you're staring at a blank box, trying to remember what you actually worked on together, and it's easier to type "great collaborator, very responsive" than to dig up a real example. This skill exists to do that digging for you, on both sides of the exchange — when you're asking someone for feedback, and when someone's asking you.

The output is only as good as the evidence and context behind it, so don't skip straight to drafting. The shape of every run is: figure out who and what cycle, gather real shared work, ask the human for the color a search can't find, then draft.

## Step 0: Which direction is this?

Figure out right away whether the user is:

- **Requesting** — they're about to ask a peer to review them, and want help writing the note/questions that go with that request.
- **Responding** — a peer has asked *them* to write a review, and they want help drafting the answer.

If it's not obvious from how they asked, just ask. The two modes pull different data and produce different output, so don't guess.

## Step 1: Identify the people and the cycle

1. Call `lattice_get_current_user` once at the start of the conversation so you know who "me" is for every later lookup.
2. Resolve the other person with `lattice_lookup_user` (by name or email). If it returns `multiple_matches`, ask the user to disambiguate rather than guessing which one they mean.
3. Figure out the review cycle with `lattice_list_review_cycles`. Default to the active cycle. If the user is responding to a request tied to a cycle that's already closed for new requests, or references a past quarter, re-call with `active_only=False`.

## Step 2: Gather the real work you've done together

This is the step that makes the output good instead of generic, so don't rush it. The goal is to find named projects, specific threads, concrete moments — a launch, a tough negotiation, a deadline crunch, a doc someone rewrote three times — because those are what turn "you communicate well" into something a person can actually recognize themselves in.

- Search Slack for the conversation history between the two people and any channels they clearly share, scoped to the cycle's date range (or the last ~3 months if the cycle window is unusually wide or the cycle has no fixed dates).
- Search Google Docs for documents either person authored, edited, or commented on where the other person was also involved, in the same window.
- If a Gmail connector is available, search it too, especially for the counterpart's name plus whatever project/theme came up. Email threads often contain the actual deliverables (attachments, detailed write-ups, status updates) behind a Slack message that only links to them, so don't stop at Slack if Gmail can fill in the substance.
- Always ask the user directly: "Anything else I should fold in — Jira tickets, meeting notes, docs I can't search? Paste a link, a ticket number, or just describe it and I'll work it in." Not every team has Jira or lives in Slack, and not everything searchable is worth digging through by hand, so this is the release valve. Treat whatever they paste as first-class evidence, same as anything pulled automatically.
- If a live search connector isn't available at all, don't stall — just lean more on this manual step and tell the user you're doing so.

Skim what comes back for specifics. If all you find is "they were both in #product-team," that's not evidence yet — keep looking or ask the user to help you find the actual moment worth citing.

## Step 3: Get the context a search can't find

A search finds *what* happened. It doesn't tell you what the person actually thought about it, or what they're hoping to hear back. Ask a few targeted questions before drafting — this is also where the user can drop in anecdotal color that makes the final draft feel like it came from them, not from a search index.

**If requesting feedback**, ask things like:
- Is there a particular skill or growth area you want them to focus on (e.g. how you handled a tough negotiation, your written communication, how you delegated on a project)?
- Anything from this cycle you're specifically proud of, or genuinely unsure about, that you want their honest read on?
- Casual peer-to-peer tone, or more formal?

**If responding to a request**, ask things like:
- In a sentence or two, what's your honest read on how they did this cycle?
- Any specific moment that stood out as strong, or one where you saw real room to grow?
- Anything about your working relationship that means you want to be careful how you phrase something?

Don't treat these as a rigid form. If the user's answer to one question already covers another, don't ask it again.

## Step 4A: Draft a feedback request

Read `references/feedback-best-practices.md` before writing — it has Lattice's own guidance on what separates a specific, actionable question from a vague one, plus a bank of question patterns organized by theme (collaboration, communication, growth, technical/domain skill, leadership) you can adapt to whatever evidence you found.

Structure the output as:
- One or two warm, direct sentences naming the review cycle and why you're asking (no throat-clearing).
- A short bulleted list (3–5 items) of specific questions, each tied to a named project, thread, or moment from Step 2 — not "how am I doing," but "when we were heads-down on [project] in [month], did my [specific behavior] help or get in your way?"

Deliver this as plain text in chat, labeled clearly as ready to paste into Lattice's note-to-reviewer field when the user sends the actual request. Lattice's API doesn't expose a way to send the request itself, so this skill drafts the ask, it doesn't send it.

## Step 4B: Draft a feedback response

First, find the real request, don't guess at questions:

1. Use `lattice_get_reviewee_reviews` (with the counterpart's `reviewee_id` and `direction='peer'`) or `lattice_get_review_packet` to find the specific review assigned to the current user as reviewer, its state, and its `question_revision_id`s / `question_mapping`.
2. Don't treat a failed `lattice_lookup_user` or an empty `lattice_list_review_cycles` as proof the request doesn't exist — Lattice's connected instance can lag behind or mismatch what's actually in someone's inbox. Before telling the user nothing was found, check the Slack DM from the Lattice bot (search for "you have a request for feedback from" or look at the bot's DM history directly). That notification carries the full request text the requester wrote, including exactly what they're asking about, which is often more specific and more useful than the bare question IDs the API returns anyway.
3. If, after checking both the API and the Slack notification, there's still nothing concrete to go on, say so plainly rather than fabricating questions.

Then draft an answer for each actual question, grounded in the Step 2 evidence and the Step 3 context, following the same specific/actionable/behavior-focused principles from `references/feedback-best-practices.md`. Use bullets inside an answer when a question has multiple distinct points to make; otherwise a short, direct paragraph reads better than forced bullet-splitting.

Show the complete draft to the user before touching anything in Lattice. Once they're happy with it:

- If the review is `unstarted`, save it with `lattice_create_review_draft` (all questions need an answer — partial saves are rejected).
- If it's already `drafted`, save with `lattice_update_review_draft`.
- After saving, tell the user clearly that this only saved a draft, not a submission — they should open Lattice themselves to do a final read and hit submit whenever they're ready.
- Never call `lattice_submit_review`. Submission is irreversible and is the user's call alone, made inside Lattice, not something this skill should do on their behalf even if asked — if someone insists, explain that submission has to happen in Lattice directly.

## A note on staying generic

This skill is meant to work for anyone at the company, for any two people, in any cycle — don't bake in assumptions about a specific team, person, or writing style. Tone and phrasing preferences belong in Step 3's questions, answered fresh each time, not hardcoded here.
