---
name: pr-description
description: Draft a PR description for the current branch using the target repo's own PR template. Use when the user asks for a PR description/summary, or to fill out the PR template, for the current change set.
---

Draft a PR description for the current branch's changes, filling in whatever PR template
the target repo actually uses. Different repos (e.g. ibex vs zenpayroll) have different
templates — never assume one from memory; read it fresh from the repo every time.

**Keep it high-level.** A PR description orients a reviewer; it does not substitute for
reading the diff. Default to short: a few sentences per section, not a per-file or
per-field rundown. If you find yourself restating what the code already makes obvious —
naming every file touched, every field added, every spec file written — stop and cut it.
That level of detail belongs in the diff and the code review, not the description. If the
code genuinely needs that much prose to be understood, that's a code-readability problem,
not a PR-description problem — say so rather than compensating with a longer description.

## Steps

1. **Find the template.** Look in the current repo for, in order:
   - `.github/pull_request_template.md` (or `PULL_REQUEST_TEMPLATE.md`, case-insensitive)
   - `.github/PULL_REQUEST_TEMPLATE/*.md` (multiple templates — ask which one if more than one exists)
   - `docs/pull_request_template.md`
   If none exist, ask the user for the template (or their preferred section headings) rather
   than inventing one — templates vary enough between orgs/repos that guessing produces a
   description that doesn't match what reviewers expect.

2. **Determine the diff scope.** Default to everything the PR will actually contain: the
   commit range from where the current branch diverged from its base. Prefer, in order:
   - `git diff @{upstream}...HEAD` if the branch tracks a remote and that remote is ahead
     of the true base (check `git log <base>..HEAD` isn't accidentally empty because local
     and remote base branches have diverged — diff against `origin/<base>` if so, not just
     the local base branch).
   - `git diff main...HEAD` / `git diff master...HEAD` otherwise.
   - If the user passed an explicit range, PR number, or branch name, use that instead.
   Also pull `git log <base>...HEAD` for the commit messages — they carry "why" context the
   diff alone doesn't.

3. **Gather context beyond the diff.** The template's "why" section needs motivation the
   code can't state on its own. Pull from, in priority order: the current conversation
   (what the user said prompted this work, any linked tickets/PRs they mentioned), commit
   messages, and PR descriptions of any paired/related PRs in other repos that were
   discussed. Don't invent a ticket link — use the template's own placeholder syntax
   (e.g. `<insert link here>`) if none is known, rather than fabricating one.

4. **Fill in the template faithfully** — same section headings and checkbox structure as
   the file you read in step 1, in the same order, but staying high-level per the note
   above. Notes per common section type:
   - **What**: 2-4 sentences on the shape of the change at a high level — what capability
     or behavior it adds/fixes, not a per-file/per-field breakdown.
   - **Why**: 1-3 sentences of motivating context — the problem, ticket, or paired PR that
     made this worth doing — not a re-derivation of the diff's purpose from first
     principles.
   - **How tested**: name the *kinds* of testing done (e.g. "unit specs across the changed
     layers, plus an end-to-end integration spec exercising the real pipeline" or "manual
     verification via X") — not a list of every spec file or test case. Map onto whatever
     Happy-Path/Sad-Path/Edge-Case checklist the template has, checking a box only when
     that category was genuinely covered; leave it unchecked (with a short note) if not.
   - **Other info for reviewers**: only genuinely surprising callouts — known gaps,
     deliberate scope cuts, follow-up work — not anything the diff already makes obvious.
   - **AI-assistance checkbox** (if present): check it when the session did substantive
     AI-driven code generation (which is the common case for Claude Code sessions) — don't
     leave it unchecked by default.

5. **Output.** Print the filled-in template as a single fenced markdown block so the user
   can copy it straight into GitHub. Don't create or edit the actual PR (`gh pr create`,
   `gh pr edit`) unless the user explicitly asks — drafting the text and publishing it are
   different levels of commitment.

## Notes

- If the repo has no template file and the user doesn't want to be asked, fall back to:
  What / Why / How tested / Other info for reviewers — but say explicitly that no repo
  template was found and this is a generic fallback structure.
- Re-derive the template on every invocation. Don't cache or hardcode one repo's template
  in this skill file — that's exactly the drift this skill exists to avoid.
