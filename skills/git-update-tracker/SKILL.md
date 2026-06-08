---
name: git-update-tracker
description: |
  Maintains the private git repo for each project: commits work, pushes, updates the changelog and
  progress tracking, and keeps a clean phase-by-phase history. Use after any meaningful unit of work
  and at every phase boundary. Triggers: "commit and push", "update the repo", "track progress",
  "update changelog", after phase-advisor / after an approved execution step.
disable-model-invocation: false
allowed-tools: Read, Write, Edit, Bash
context: fork
---

# Git Update Tracker

Owns the project's git history and progress tracking. Every project lives in its own private repo at github.com/Anand195/[project].

## When to Use
- After an approved unit of work (AOP Phase 6 → human confirmed git action).
- At every phase boundary (after `phase-advisor`).

## Responsibilities
1. **Repo init (first time)** — if no repo: `git init`, create private GitHub repo via `gh repo create Anand195/[project] --private`, set remote, enable GitHub Pages source = `docs/`.
2. **Branching** — never commit straight to `main` for feature work. Use `phase/[N]-[name]` or `feat/[slug]` branches; PR into `main`. Use `sp-using-git-worktrees` for parallel work.
3. **Commit** — conventional commits:
   ```
   feat(phase-3): implement frontend dashboard
   fix(api): correct token expiry check
   docs(phase-3): publish walkthrough
   chore(docker): harden backend image
   ```
4. **Changelog** — update `changelogs/[project]/changelog-DD-MM-YYYY.md` per AOP Phase 7 (What/Why/Impact/Sources).
5. **Progress tracking** — update `PLAN.md` / `TASK.md` checkboxes; update `PORTFOLIO.md` phase column.
6. **Push** — push branch, open PR (`gh pr create`), link issues.

## Commit message footer
End every commit with:
```
Co-Authored-By: Claude Opus 4.8 <noreply@anthropic.com>
```

## Guardrails
- Commit/push ONLY after explicit human approval (AOP — git is an outward action).
- If on `main`, branch first.
- Never force-push shared branches. Never commit secrets — run a quick scan (`git secrets` / grep for keys) before commit.
- Verify `.gitignore` excludes `.env`, build artifacts, `node_modules`, etc.

## Workflow per phase close
1. Ensure changelog + PLAN/TASK updated.
2. Stage, commit on phase branch.
3. Push, open PR to `main`.
4. Hand to `git-issue-maintainer` (open/close issues) and `github-pages-publisher` (docs).
5. On phase acceptance → `git-release-maintainer` tags the release.

## Standing Rules
- One project = one private repo. Clean, conventional, phase-aligned history.
- No commit/push without approval. No secrets in history.
- Use `gh` CLI for all GitHub actions; never hardcode tokens.
- See [[git-issue-maintainer]], [[git-release-maintainer]], [[github-pages-publisher]], [[sp-using-git-worktrees]].
