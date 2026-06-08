---
name: scalesync-intake
description: |
  ScaleSync structured idea intake. The single front door for every new idea/project.
  Use FIRST whenever a new idea, client request, or project concept arrives — before any
  research, validation, or build. Captures the idea into a structured brief that feeds
  market-fit-analyzer next. Triggers: "I have an idea", "new project", "new client",
  "evaluate this concept", "should we build X".
disable-model-invocation: false
allowed-tools: Read, Write, Edit, AskUserQuestion
context: fork
---

# ScaleSync Intake

The standardized entry point for every idea entering ScaleSync. Converts a raw idea into a structured intake brief so the rest of the pipeline (validation → build → launch) runs on clean inputs.

## When to Use
- ANY new idea, concept, or client request — this is step 0.
- Before `market-fit-analyzer`, `market-researcher`, or `orchestrator-master`.

## Workflow

### 1. Capture (ask all questions at once — AOP Phase 0)
Collect:
- **Idea one-liner** — what is it, in one sentence
- **Problem** — what pain does it solve
- **Target user** — who has this pain
- **Why now** — what changed / why this is timely
- **Business model** — how it makes money (SaaS, service, marketplace, internal tool)
- **Client / owner** — internal ScaleSync or external client (+ name)
- **Constraints** — budget, deadline, tech, compliance, region
- **Success metric** — what "winning" looks like in 6–12 months
- **Competitors known** — any the requester already knows of
- **Deployment preference** — cloud (AWS/GCP/Azure), on-prem, undecided

### 2. Produce the Intake Brief
Write `[project-root]/INTAKE.md`:

```markdown
# Intake Brief — [Project Name]
**Date:** DD-MM-YYYY
**Owner:** [internal / client name]
**Status:** INTAKE → awaiting market-fit validation

## Idea
[one-liner]

## Problem & User
- Problem: ...
- Target user: ...
- Why now: ...

## Business Model
[model + rough monetization]

## Constraints
| Type | Detail |
|------|--------|
| Budget | ... |
| Deadline | ... |
| Tech | ... |
| Compliance | ... |
| Region | ... |

## Success Metric
[measurable 6–12 month target]

## Known Competitors
- ...

## Deployment Preference
[cloud / on-prem / undecided]

## Routing Decision
- [ ] Proceed to market-fit-analyzer
- [ ] Park (reason)
- [ ] Reject (reason)
```

### 3. Set up the project workspace
Create the standard ScaleSync project folder skeleton:
```
projects/[project-slug]/
  INTAKE.md
  changelogs/[project-slug]/
  reports/[project-slug]/
  docs/
```

### 4. Hand off
Recommend next skill explicitly:
> Intake complete. Next: `market-fit-analyzer` to validate before any build spend.

## Standing Rules
- Never skip intake. No idea proceeds without an INTAKE.md.
- One project = one folder under `projects/`.
- Always link the next step. See [[market-fit-analyzer]], [[orchestrator-master]].
