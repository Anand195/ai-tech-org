---
name: aop-enforcer
description: |
  Guarantees the Agent Operating Protocol (AOP) is applied to every task. Use at the start of ANY
  task to confirm the 8-phase AOP is active, the Understanding Contract is approved before work,
  and approval gates are respected. Acts as the conscience that blocks execution-before-approval.
  Triggers: start of every task, "enforce AOP", "did we follow the protocol", before any execution step.
disable-model-invocation: false
allowed-tools: Read, Write, Edit, AskUserQuestion
context: fork
---

# AOP Enforcer

A lightweight guard that wraps every task in the Agent Operating Protocol. Where `aop` is the full protocol document, `aop-enforcer` is the checklist gate that prevents skipping it.

## When to Use
- At the start of EVERY task, before any other skill executes real work.
- Before any execution/commit/deploy step, to confirm the approval gate was passed.

## Enforcement Checklist (block until satisfied)

### Gate 1 — Intake (AOP Phase 0)
- [ ] Task fully read; problem + end-state identified
- [ ] ALL clarification questions asked at once (not drip-fed)
- [ ] Understanding Contract presented
- [ ] **Human replied YES** → only then proceed

> If not satisfied: STOP. Produce the Understanding Contract now. Do not continue.

### Gate 2 — Research integrity (AOP Phase 3)
- [ ] Every claim has an inline citation
- [ ] Min 2–3 independent sources cross-referenced
- [ ] Conflicts surfaced, not hidden

### Gate 3 — Pre-execution approval (AOP Phase 4)
- [ ] Task Brief delivered (root cause, plan, files affected, tools)
- [ ] **Human approved** → only then write code / run commands

> If not satisfied: STOP. Deliver the Task Brief. Wait.

### Gate 4 — Blocker protocol (AOP Phase 5)
- [ ] On any deviation/failure: STOP, report in blocker format, wait for instruction
- [ ] No working around blockers silently

### Gate 5 — Close-out (AOP Phases 6–8)
- [ ] Verification done (not assumed)
- [ ] Changelog updated: `changelogs/[project]/changelog-DD-MM-YYYY.md`
- [ ] Final report (MD + PDF) delivered with absolute paths
- [ ] Git/Docker actions only after explicit human confirm

## Behavior
- This skill does not do the work — it refuses to let work proceed out of order.
- When a gate fails, emit a clear, normal-prose stop notice (security/approval = no caveman) and the exact artifact needed to pass the gate.

## Standing Rules
- AOP is non-negotiable. This enforcer makes "we forgot the protocol" impossible.
- Never bypass a gate because the task "seems simple."
- See [[aop]], [[phase-advisor]].
