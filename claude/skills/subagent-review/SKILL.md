---
name: subagent-review
description: Run a fresh-context code review in the background and save findings to the project's gitignored ./tmp/ dir. Wraps the built-in /code-review with backgrounding, project-tmp output, and a P0/P1 commit gate. Use before committing a feature/beat or before a push, or when the user asks for a subagent/background review.
---

Run a fresh-context code review of the current change set as a background task, so the
user can keep working/playtesting while it runs. This wraps the built-in `/code-review`
engine with three conventions: backgrounding, project-`./tmp/` output, and a P0/P1 commit
gate.

This is to be an unbiased/blind review. Don't point it at anything specific unless the user prompts for that.

## Output location — read carefully

All review notes go in the project's own `tmp/` directory — the `tmp/` folder at the git
repository root (i.e. `./tmp/` relative to the repo, an absolute path like
`<repo-root>/tmp/`). Never the machine's filesystem root `/tmp/`. Always write a
repo-relative path (`tmp/review-<topic>.md`), never a leading-slash absolute path.

## Steps

1. Pick the target. Default to the current working-tree diff / branch. If the user passed
   an argument, honor it: a PR number/URL, or a git range (e.g. `master..HEAD`).

2. Derive a `<topic>` slug — a short kebab-case name for what changed (from the branch
   name, the dominant changed area, or the user's words). Used for the filename.

3. Launch the review in the background. Spawn a subagent with the Agent tool,
   `run_in_background: true`, as a no-context reviewer (so it isn't biased by the author's
   rationale). Instruct it to:
   - Perform a `/code-review`-style review of the target — correctness/logic bugs first,
     then reuse / simplification / efficiency cleanups. Prefer invoking the built-in
     `/code-review` skill if available, so the review rides built-in improvements;
     otherwise apply the same rubric directly.
   - Anchor on the project's own standards if present: read `CLAUDE.md` and
     `docs/architecture.md` (or any architecture/conventions doc) and review against them.
     If a project has neither, do a general correctness + cleanliness review.
   - Verify, don't trust, the author's intent; check edge cases and missed call sites.
   - Categorize every finding P0 (must fix before commit), P1 (should fix), P2
     (nice-to-have), each with `file:line`, the problem, and a concrete suggested fix.
     Note test-coverage gaps for new behavior.
   - Write the full review to the project's `tmp/review-<topic>.md` (repo-relative, not
     `/tmp/`) and return a concise P0/P1 summary as its final message.

5. When it returns, report the P0/P1 findings and point to `tmp/review-<topic>.md`.

## Commit gate

Treat P0 and P1 as blocking: resolve (or get explicit sign-off to defer) every P0/P1
before committing or pushing. P2s are optional.

## Notes

- Per-commit LLM review is too slow/costly — review at feature/beat granularity.
