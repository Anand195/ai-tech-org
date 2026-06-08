---
name: multi-project-orchestrator
description: |
  Runs ScaleSync like a real agency with MULTIPLE simultaneous client projects, each isolated.
  Use when more than one project is active, when switching between client projects, or when you
  need a portfolio view across all in-flight work. Extends orchestrator-master from single-project
  to multi-project/multi-client with full isolation. Triggers: "manage all projects", "portfolio
  status", "switch to project X", "new client while others active", "what's the status across clients".
disable-model-invocation: false
allowed-tools: Read, Write, Edit, Bash, Agent
context: fork
---

# Multi-Project Orchestrator

The agency-level controller. `orchestrator-master` runs ONE project end-to-end; this skill runs the **portfolio** — many projects at once, isolated, each at its own phase.

## When to Use
- Two or more active projects/clients.
- Portfolio status, resource/context switching, or onboarding a new client mid-flight.

## Isolation Model
Each project is fully isolated:
```
projects/
  acme-saas/        ← Client A, Phase 3
    INTAKE.md PRD.md ... docker-compose.yml helm/ docs/ changelogs/ reports/
    .git (own private repo: github.com/Anand195/acme-saas)
  beta-api/         ← Client B, Phase 5
    ...
  internal-tool/    ← ScaleSync internal, Phase 1
    ...
PORTFOLIO.md        ← master index of all projects
```

- Separate git repo per project (no shared history).
- Separate GHCR namespace per project.
- Separate context memory per project (decision-logger scoped by project).
- A change in one project NEVER touches another.

## PORTFOLIO.md (master index)
Maintain at workspace root:
```markdown
# ScaleSync Portfolio — updated DD-MM-YYYY

| Project | Client | Phase | Status | Repo | Next Action | Blocker |
|---------|--------|-------|--------|------|-------------|---------|
| acme-saas | Acme | 3/6 Frontend | 🟢 on track | .../acme-saas | Phase 4 infra | none |
| beta-api | Beta | 5/6 Security+QA | 🟡 at risk | .../beta-api | fix scan finding | Trivy CVE |
| internal-tool | ScaleSync | 1/6 Design | 🟢 | .../internal-tool | wireframes | none |
```

## Workflow
1. **New project** → run `scalesync-intake` → `market-fit-analyzer` → on GO, register in PORTFOLIO.md and create isolated workspace.
2. **Per-project execution** → delegate to `orchestrator-master` scoped to that project's folder. Use `sp-using-git-worktrees` when parallel work within a project is needed.
3. **Context switch** → load that project's INTAKE/PRD/changelog/decision-log before acting. Never carry one project's context into another.
4. **Portfolio review** → regenerate PORTFOLIO.md from each project's current phase + git state.
5. **Phase completion in any project** → trigger `phase-advisor` for that project, then `git-update-tracker` + `github-pages-publisher`.

## Concurrency Rules
- Use the Agent tool to run independent per-project tasks in parallel when safe.
- Tag every agent dispatch with the project slug so outputs land in the right folder.
- Never let two projects share a branch, repo, or compose network.

## Standing Rules
- One project = one isolated folder + one repo. Always.
- PORTFOLIO.md is the single source of truth for "what's happening across the agency."
- See [[orchestrator-master]], [[phase-advisor]], [[git-update-tracker]], [[sp-using-git-worktrees]].
