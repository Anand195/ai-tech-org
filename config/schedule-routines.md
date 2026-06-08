# ScaleSync Scheduled Routines

Recurring operational agents (managed by `scheduled-ops` skill via the host `/schedule` system). All routines are read-only analysis + issue creation — never auto-deploy or auto-delete.

| Routine | Cadence | Skill | Output path | Notify when |
|---------|---------|-------|-------------|-------------|
| Cost review | Weekly, Mon 09:00 | cost-optimizer | reports/[proj]/cost-YYYY-WW.md | savings > 15% or spend spike |
| Dependency audit | Weekly, Wed 09:00 | dependency-auditor | reports/[proj]/deps-YYYY-WW.md | any HIGH/CRITICAL CVE |
| Threat hunt | Daily, 02:00 | threat-detection | reports/[proj]/threat-YYYY-MM-DD.md | any anomaly |
| Portfolio health | Daily, 08:00 | multi-project-orchestrator | PORTFOLIO.md | any project at-risk/blocked |
| Tech-debt sweep | Bi-weekly | tech-debt-tracker | reports/[proj]/debt.md | debt score rising |

## To activate a routine
The `scheduled-ops` skill hands the exact `/schedule` invocation to the human for confirmation. Example:

```
/schedule weekly "Run cost-optimizer for all projects in PORTFOLIO.md.
Write cost report per project, open issues for >15% savings opportunities
via git-issue-maintainer. Follow AOP. No destructive actions."
```

Scheduling is an outward, recurring commitment — human confirms before creation.
