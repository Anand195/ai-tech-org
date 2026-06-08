---
name: scheduled-ops
description: |
  Configures recurring/scheduled operational agents for ScaleSync projects — cost reviews, dependency
  audits, threat hunts, and portfolio health checks that run on a cron schedule via the /schedule
  routine system. Use to set up "run every week/day" automation. Triggers: "schedule a recurring",
  "weekly cost review", "daily dependency audit", "automate ongoing ops", "cron job for X".
disable-model-invocation: false
allowed-tools: Read, Write, Edit, Bash, Skill
context: fork
---

# Scheduled Ops

Turns the recurring operational skills into actual scheduled routines so ongoing ops (Layer 9) run automatically, not just when someone remembers.

## When to Use
- After a project is live and needs ongoing monitoring.
- To set up agency-wide recurring health checks.

## Recommended Routines
| Routine | Cadence | Skill it runs | Output |
|---------|---------|---------------|--------|
| Cost review | Weekly (Mon 9am) | `cost-optimizer` | Cost report per project + portfolio rollup |
| Dependency audit | Weekly | `dependency-auditor` | CVE/outdated-dep report; opens issues via git-issue-maintainer |
| Threat hunt | Daily | `threat-detection` | Anomaly report on deployed infra |
| Portfolio health | Daily (8am) | `multi-project-orchestrator` | Refreshed PORTFOLIO.md + at-risk flags |
| Tech-debt sweep | Bi-weekly | `tech-debt-tracker` | Debt register update |

## Setup
Routines are created via the host `/schedule` system (cron-based remote agents). This skill:
1. Defines the routine prompt (which skill + project scope + output path).
2. Recommends cadence per the table.
3. Documents each routine in `config/schedule-routines.md`.
4. Hands the exact `/schedule` invocation to the human to confirm (scheduling is an outward, recurring commitment → human approves).

## Routine prompt template
```
Run [skill] for [project/portfolio]. Read current state, produce [report] at
[path]. Open issues for any P0/P1 findings via git-issue-maintainer.
Notify on at-risk items only. Follow AOP — cite sources, no destructive actions.
```

## Rules
- Recurring agents do read-only analysis + issue creation. **Never** auto-deploy or auto-delete.
- Every routine reports to a file + opens issues; humans act on findings.
- See [[cost-optimizer]], [[dependency-auditor]], [[threat-detection]], [[multi-project-orchestrator]], [[git-issue-maintainer]].
