---
name: client-portal-generator
description: |
  Generates a read-only, branded client status portal for any project — a single self-contained HTML
  dashboard showing phase progress, deliverables, open/closed issues, releases, and next steps. Use to
  give clients visibility without exposing the repo. Triggers: "client portal", "status dashboard",
  "client-facing status page", "share progress with client", after a phase completes.
disable-model-invocation: false
allowed-tools: Read, Write, Edit, Bash
context: fork
---

# Client Portal Generator

Produces a polished, self-contained status portal per project so clients see progress at a glance — separate from the internal GitHub Pages walkthrough.

## When to Use
- After any phase completion (alongside `github-pages-publisher`).
- When a client asks "where are we?"

## Inputs (pulled, never invented)
- `PORTFOLIO.md` / project phase state
- `PLAN.md` + `TASK.md` (progress %)
- `git-issue-maintainer` output (open/closed issues)
- `git-release-maintainer` releases (versions shipped)
- `phase-advisor` reports (next step per phase)

## Output
`projects/[slug]/docs/portal/index.html` — one self-contained file (inline CSS), ScaleSync-branded (Growth Orange #F37021, Yukti Green #1D8A17, Scale Navy #1B2A38). Contains:
- Project header + current phase badge + overall % complete
- Phase timeline (done / in-progress / upcoming)
- Deliverables shipped (with release versions)
- Issues: open vs resolved counts + recent activity
- "What's next" (from latest phase-advisor)
- Last updated timestamp

## Rules
- **Read-only.** No secrets, no source code, no internal risk notes — client-safe content only.
- Self-contained HTML (no external assets) so it can be emailed or hosted anywhere.
- Pull real data; never fabricate progress.
- Outward-facing → confirm with human before sharing externally (AOP).

## Standing Rules
- The portal is the client's window; the GitHub Pages walkthrough is the internal record.
- See [[github-pages-publisher]], [[phase-advisor]], [[git-issue-maintainer]], [[git-release-maintainer]].
