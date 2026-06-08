# ScaleSync Skill Routing Map

236 skills overlap by design (depth + breadth). This map resolves "which skill when" so the orchestrator never picks ambiguously. **Rule: ScaleSync custom skills are the entry points; they delegate to depth skills.**

## Priority Order (when multiple could fire)
1. **Governance** — `aop-enforcer` → `aop` (always first)
2. **Process** — `scalesync-tdd-sdd`, `sp-*`, `phase-advisor` (how work runs)
3. **ScaleSync orchestrators** — `scalesync-intake`, `market-fit-analyzer`, `orchestrator-master`, `multi-project-orchestrator`
4. **Role executors** — the specialist that owns the deliverable
5. **Depth specialists** — `senior-*` skills invoked BY the role executor for hard problems

## Overlap Resolution Table
| Need | Primary (use this) | Delegate to (depth) | Never |
|------|--------------------|--------------------|-------|
| New idea | `scalesync-intake` | — | jumping to build |
| Validate idea | `market-fit-analyzer` | market-researcher, competitive-intel, competitive-teardown, product-discovery | starting build pre-verdict |
| Run one project | `orchestrator-master` | all role executors | — |
| Run many projects | `multi-project-orchestrator` | orchestrator-master per project | sharing context across projects |
| System architecture | `cto-architect` | `senior-architect` for deep system design / ADR review | — |
| Backend code | `backend-developer` | `senior-backend` for 12-factor/perf-critical paths | — |
| Frontend code | `frontend-developer` | `senior-frontend` for advanced React/perf | — |
| Full-stack feature | `backend-developer` + `frontend-developer` | `senior-fullstack` for end-to-end slice | — |
| QA / testing | `qa-engineer` | `senior-qa` for advanced strategy; `sp-test-driven-development` for discipline | host-only tests |
| Security audit | `security-engineer` | `cloud-security` (k8s/cloud), `senior-security`/`senior-secops` (deep), `ai-security` (LLM) | — |
| Incident (prod) | `incident-commander` | `incident-response` (forensics), `threat-detection` (hunt) | — |
| Docker build | `docker-engineer` | `docker-best-practices-advisor` (review/harden) | shipping unscanned image |
| k8s / Helm | `helm-scaffolder` | `senior-devops`, `kubernetes-operator` | k8s when Compose suffices |
| Secrets | `secrets-binding` | `secrets-vault-manager`, `env-secrets-manager` | plaintext secrets |
| Cloud infra | `cloud-architect` | `aws/azure/gcp-cloud-architect` per provider | — |
| Code review | `code-reviewer` | `adversarial-reviewer` (hostile pass), `pr-review-expert` (PR-level) | merging unreviewed |
| Changelog | `git-update-tracker` | `changelog-generator` (auto-draft) | — |
| Release | `git-release-maintainer` | `release-manager` (coordination) | publishing failed-scan image |
| Issues/tracking | `git-issue-maintainer` | `jira-expert` (mirror to Jira) | untracked work |
| Phase close | `phase-advisor` | ship-gate, dependency-auditor | silent phase transition |
| Market research | `market-researcher` | `competitive-intel` (strategy), `competitive-teardown` (product) | uncited claims |
| Spec → repo | `spec-to-repo` | `delivery-manager` (stories) | code before spec |
| ML feature | `ai-ml-engineer` | `senior-ml-engineer`, `rag-architect`, `senior-prompt-engineer` | — |
| Compliance | `risk-analyst` routes → | `soc2-compliance`/`gdpr-dsgvo-expert`/`iso42001-specialist`/`eu-ai-act-specialist` | bolting on late |
| Launch | `launch-strategy` | landing-page-generator, pricing-strategy, paid-ads | — |
| Growth | `revenue-operations` | customer-success-manager, saas-metrics-coach, churn-prevention | — |
| Cost review | `cost-optimizer` | financial-analyst (business model) | trading away SLO/security |
| Client dashboard | `client-portal-generator` | github-pages-publisher | — |
| Recurring ops | `scheduled-ops` | cost-optimizer, dependency-auditor, threat-detection | — |

## Tie-breaker rules
- **Ours over external** when names overlap and the task is ScaleSync-process (e.g., `git-release-maintainer` over bare `release-manager`).
- **External depth over ours** when the task is a hard specialist problem (e.g., `senior-devops` over `cloud-architect` for real k8s tuning).
- **One owner per deliverable.** The primary owns it; delegates advise. Never two skills writing the same artifact.
