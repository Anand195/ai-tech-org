# ScaleSync AI-Native Organization Plugin — `ai_tech_org_plugin` (v2.0.0)

## What This Is
A **single self-contained plugin** that is a complete AI agency: idea → market-fit → spec → Docker-first build → k8s/Helm → security/QA → release → launch → marketing → business growth. **239 skills** in one bundle. AOP-governed (auto-fired via hooks), sub-agent driven, TDD-enforced. One plugin, used everywhere, for every task.

## V2 Additions (hardening)
- **`commands/`** — first-class slash entry points: `/scalesync:new-idea`, `:validate`, `:build`, `:portfolio`, `:phase-done`, `:release`
- **`hooks/`** — `aop-gate.sh` auto-fires AOP on SessionStart + UserPromptSubmit (enforcement, not advisory)
- **`ROUTING.md`** — resolves the 239-skill overlaps (which skill when; one owner per deliverable)
- **`config/permissions.json`** — recommended allowlist to cut permission prompts
- **`config/schedule-routines.md`** — recurring ops (cost/deps/threat/portfolio) via `/schedule`
- **3 new skills** — `client-portal-generator`, `scheduled-ops`, `secrets-binding`
- **`assets/pages-theme/`** — branded GitHub Pages theme (ScaleSync colors)
- **Self-test** — all 16 custom skills validated (frontmatter + structure)

**End-to-end mandate:** ScaleSync provides solution, service, and growth — from idea till deployment, launch, and revenue.

---

## Skill Inventory (236 total)
| Source | Count | Role |
|--------|-------|------|
| ScaleSync core (original) | 20 | The SDLC agency bench (orchestrator, devs, infra, QA, docs) + AOP |
| ScaleSync custom (new) | 13 | Intake, market-fit, multi-project, advisor, Docker/k8s automation, git maintainers, TDD/SDD wrapper |
| superpowers (sp-*) | 5 | TDD, sub-agent-driven dev, worktrees, plan writing/execution |
| business-growth-skills | 5 | Proposals, sales-eng, customer success, RevOps |
| c-level-skills | 33 | Strategy, org memory, decision logging, advisors |
| engineering-advanced-skills | 40 | CI/CD, k8s, observability, ship-gate, release, RAG, MCP builder |
| engineering-skills | 32 | senior-devops/backend/frontend, security, incident, cloud architects |
| finance-skills | 3 | Financial analyst, SaaS metrics |
| marketing-skills | 47 | SEO, launch, content, paid, CRO, social, email |
| pm-skills | 9 | Jira, Confluence, Scrum, PM |
| product-skills | 13 | Discovery, strategy, teardown, spec-to-repo |
| ra-qm-skills | 16 | SOC2, GDPR, ISO, EU AI Act compliance |

---

## Non-Negotiable Defaults (Every Project)

### 1. Docker-First
Every project containerized by default. Multi-stage Dockerfile per service, `docker-compose.yml` with health checks, `.env.example`, `run.sh` (numbered commands), GHCR push on release. Reviewed by `docker-best-practices-advisor` before every build.

### 2. Kubernetes + Helm (on demand)
When scope/scale/client requires it → `helm-scaffolder` generates the chart from compose; `senior-devops` + `kubernetes-operator` tune for the cluster. Probes, HPA, PDB, NetworkPolicy, secrets via External/Sealed Secrets mandatory.

### 3. TDD + SDD (always)
`scalesync-tdd-sdd` enforces: tests first, tests run INSIDE Docker, independent tasks dispatched to sub-agents (Agent tool) with worktree isolation. Coverage gate (default 80%) blocks `ship-gate`.

### 4. AOP Governance (always)
`aop-enforcer` wraps every task in the 8-phase Agent Operating Protocol — Understanding Contract before work, approval gates before execution, citations on research, blocker protocol, changelog + final report.

### 5. Phase Advisor (every phase)
`phase-advisor` closes every phase with: what was built, quality gates, risks, best next step, current best practice (live-researched), deployment readiness, trend alert, next phase plan.

### 6. Git Discipline (every project)
Private repo per project at `github.com/Anand195/[project]`. `git-update-tracker` (commits/PRs/changelog), `git-issue-maintainer` (bugs/tasks/risks as issues), `git-release-maintainer` (SemVer tags + GHCR + release notes), `github-pages-publisher` (phase walkthroughs).

---

## Orchestration Entry Points
| Entry skill | Use when |
|-------------|----------|
| `scalesync-intake` | ANY new idea — step 0 |
| `market-fit-analyzer` | Validate idea before build |
| `orchestrator-master` | Run ONE project end-to-end |
| `multi-project-orchestrator` | Run MANY client projects simultaneously |
| `aop-enforcer` | Start of every task (governance) |
| `phase-advisor` | End of every phase |

---

## The Full ScaleSync Pipeline (Idea → Revenue)

```
0. INTAKE
   scalesync-intake → INTAKE.md + project workspace

1. VALIDATION (gate: human green signal)
   market-fit-analyzer ⟶ delegates:
     market-researcher · competitive-intel · competitive-teardown
     product-discovery · product-strategist · tech-stack-evaluator
     financial-analyst · risk-analyst
   → Market-Fit Report (GO / CONDITIONAL / PIVOT / NO-GO)

2. BUSINESS AGREEMENT (external projects)
   contract-and-proposal-writer · financial-analyst → SOW + cost model
   (gate: client sign-off)

3. PROJECT SETUP
   jira-expert · confluence-expert · spec-to-repo · context-engine
   git-update-tracker (repo init, private, Pages on)

4. SPECIFICATION (gate: human PRD/BRD/SRS/ADR approval)
   requirements-analyst · cto-architect · senior-architect
   spec-driven-workflow · database-schema-designer · env-secrets-manager
   delivery-manager (PLAN.md/TASK.md) · risk-analyst
   ra-qm-skills (if compliance) → constraints baked into ADR
   ── phase-advisor (Phase 0) ──

5. BUILD — phase by phase, each under scalesync-tdd-sdd + git discipline
   P1 Design:    ux-researcher-designer · ui-ux-designer · ui-design-system
   P2 Backend:   backend-developer · senior-backend · api-developer
                 + docker-engineer (Dockerfile) + docker-best-practices-advisor
   P3 Frontend:  frontend-developer · senior-frontend + docker-engineer
   P4 AI/ML:     ai-ml-engineer · rag-architect · senior-ml-engineer
   P5 Infra:     docker-engineer (compose, run.sh) · ci-cd-pipeline-builder
                 cloud-architect · [helm-scaffolder · senior-devops · kubernetes-operator if k8s]
                 observability-designer · slo-architect · secrets-vault-manager
                 cost-optimizer · financial-analyst
   P6 Sec/QA:    security-engineer · cloud-security · dependency-auditor
                 adversarial-reviewer · qa-engineer · senior-qa
                 chaos-engineering · performance-engineer · ship-gate
   ── phase-advisor + git-issue-maintainer + github-pages-publisher after EACH phase ──

6. DELIVERY
   technical-writer · runbook-generator · changelog-generator
   release-manager · git-release-maintainer → vX.Y.Z + GHCR + GitHub Pages

7. LAUNCH & MARKETING
   launch-strategy · content-strategy · landing-page-generator
   pricing-strategy · paid-ads · seo-audit · ai-seo · aeo
   social-media-manager · email-sequence · analytics-tracking

8. BUSINESS GROWTH
   customer-success-manager · revenue-operations · saas-metrics-coach
   churn-prevention · referral-program · sales-engineer
   ceo-advisor · cro-advisor · cmo-advisor (strategic steering)

9. ONGOING OPS
   scrum-master · incident-commander · incident-response · threat-detection
   tech-debt-tracker · dependency-auditor · cost-optimizer (recurring)
```

---

## Sub-Agent Driven Development (how work actually runs)
- `orchestrator-master` / `multi-project-orchestrator` decompose phases into independent tasks.
- Each task dispatched to a sub-agent via the **Agent tool**, tagged with the project slug.
- Sub-agents follow `scalesync-tdd-sdd` (RED→GREEN→REFACTOR in Docker).
- `sp-using-git-worktrees` isolates parallel sub-agents.
- Main thread integrates → full Docker test suite → `code-reviewer` + `adversarial-reviewer` → `ship-gate` → `phase-advisor`.

---

## Project Folder Structure
```
projects/[slug]/
  INTAKE.md  PRD.md  BRD.md  SRS.md  ADR.md  ROADMAP.md  PLAN.md  TASK.md
  docker-compose.yml  docker-compose.override.yml  .env.example  run.sh
  helm/[slug]/Chart.yaml values.yaml templates/        # if k8s
  .github/workflows/build-test-push.yml deploy.yml
  src/ tests/
  changelogs/[slug]/changelog-DD-MM-YYYY.md
  reports/[slug]/[date]_[slug].md (+ .pdf)
  docs/ (GitHub Pages: index.md, phases/phase-N.md, architecture.md, deployment-guide.md)
  .git → github.com/Anand195/[slug] (private)
PORTFOLIO.md   # master index across all projects
```

---

## Deployment Decision Tree (cto-architect + tech-stack-evaluator)
| Project type | Default | Upgrade trigger |
|--------------|---------|-----------------|
| Static/marketing | Docker(nginx) + Cloudflare | edge functions for <50ms |
| SaaS MVP (<500 rps) | Compose + VPS (Hetzner/DO) + managed DB | >500 rps or team>3 |
| SaaS growth (500–5K rps) | Compose or k3s + managed DB/Redis | multi-region/HA |
| Enterprise (>5K rps / HA) | k8s + Helm (EKS/GKE/AKS) + mesh if >10 svc | — |
| AI/ML service | Docker + GPU (RunPod/CoreWeave) + vLLM/BentoML | scale → Ray Serve |
| Data pipeline | Compose + Prefect/Dagster | >1TB/day → Spark/Flink |

---

## GitHub
- Org: `https://github.com/Anand195` · images: `ghcr.io/anand195/[project]`
- All projects: private repos, GitHub Pages on, issues + milestones per phase, SemVer releases.

---

## Invocation
```
/ai_tech_org_plugin:scalesync-intake            # new idea
/ai_tech_org_plugin:market-fit-analyzer         # validate
/ai_tech_org_plugin:orchestrator-master         # build one project
/ai_tech_org_plugin:multi-project-orchestrator  # run the whole portfolio
/ai_tech_org_plugin:phase-advisor               # close a phase
```
