---
name: git-issue-maintainer
description: |
  Creates and maintains GitHub issues for each project: bugs, tasks, risks, and resolutions, linked
  to phases and changelog entries. Use to open issues when work/bugs/risks are identified, and close
  them with resolution notes when fixed. Triggers: "open an issue", "track this bug", "create tickets
  for phase", "close issue", "log this risk", after qa-engineer/security-engineer find defects.
disable-model-invocation: false
allowed-tools: Read, Write, Edit, Bash
context: fork
---

# Git Issue Maintainer

Runs the issue tracker for each project repo so every bug, task, and risk is visible and traceable to its resolution.

## When to Use
- Phase planning → open task issues for the phase.
- `qa-engineer` / `security-engineer` / `performance-engineer` find defects → open bug issues.
- `risk-analyst` flags a risk → open risk issue.
- A fix lands → close issue with resolution.

## Issue Conventions

### Labels
- `type:bug` `type:task` `type:risk` `type:tech-debt` `type:security`
- `phase:1`..`phase:6`
- `priority:p0`..`p3`
- `status:triage` `status:in-progress` `status:blocked` `status:done`

### Issue body template
```markdown
## Summary
[what + where]

## Context
- Phase: [N]
- Found by: [skill/agent]
- Severity: [p0-p3]

## Steps / Evidence
[repro steps or scan output, exact]

## Acceptance criteria
- [ ] ...

## Resolution (filled on close)
- Root cause: ...
- Fix: [commit/PR link]
- Verified: [how]
- Changelog: [link to changelog entry]
```

## Workflow
1. **Open** — `gh issue create` with title, body, labels, milestone (= phase).
2. **Link** — reference issue in the related commit/PR (`Fixes #N`).
3. **Maintain** — update status labels as work progresses.
4. **Close** — `gh issue close` only after fix is verified; fill Resolution section.
5. **Report** — feed open/closed issue list to `github-pages-publisher` (phase walkthrough "Issues" section) and `phase-advisor`.

## Milestones
- One milestone per phase. Issues roll up to the phase so progress is measurable.

## Behavior
- Use `gh` CLI; never hardcode tokens.
- Don't close an issue without a verified resolution + changelog link.
- Outward action (creates public-ish artifacts on the repo) → first-time setup confirmed with human per AOP.

## Standing Rules
- Every bug/risk/task is an issue. No untracked work.
- Issues link to phases, commits, and changelog — full traceability.
- See [[git-update-tracker]], [[git-release-maintainer]], [[qa-engineer]], [[risk-analyst]], [[phase-advisor]].
