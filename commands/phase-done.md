---
description: Close the current phase — advisor report, issues, GitHub Pages walkthrough, commit
argument-hint: [project-slug]
allowed-tools: Read, Write, Edit, Bash, WebSearch, Agent, Skill
---

# /scalesync:phase-done

Close a development phase with the full ScaleSync close-out ritual.

Project: **$ARGUMENTS**

Steps:
1. Invoke skill `phase-advisor` → produce the Advisor Report (what built, gates, risks, next step, best practice live-researched, deployment readiness, trend alert, next phase plan).
2. Invoke `git-issue-maintainer` → open/close phase issues.
3. Invoke `github-pages-publisher` → publish `docs/phases/phase-N.md`.
4. Invoke `git-update-tracker` → commit, PR, changelog update.
5. On human acceptance → `git-release-maintainer` tags vX.Y.Z + GHCR.
6. Wait for human go/no-go before next phase (AOP gate).
