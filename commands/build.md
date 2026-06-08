---
description: Build a validated project end-to-end, phase by phase (Docker-first, TDD, sub-agent driven)
argument-hint: [project-slug]
allowed-tools: Read, Write, Edit, Bash, Agent, Skill
---

# /scalesync:build

Run the full build pipeline for a validated project. Requires a STRONG/CONDITIONAL GO market-fit verdict + human green signal.

Project: **$ARGUMENTS**

Steps:
1. Confirm green signal exists (Market-Fit Report verdict). If not → stop, route to `/scalesync:validate`.
2. Invoke skill `orchestrator-master` (single project) or `multi-project-orchestrator` (if others active).
3. Enforce `aop-enforcer` + `scalesync-tdd-sdd` on every phase.
4. Phases: Spec → Design → Backend → Frontend → AI/ML → Infra → Sec/QA → Delivery.
5. Every phase ends with `phase-advisor`; then `git-issue-maintainer` + `github-pages-publisher` + `git-update-tracker`.
6. Docker-first mandatory; `helm-scaffolder` only if k8s required.
7. Stop at each phase gate for human go/no-go (AOP).
