# AI Tech Org — Claude Code Plugin

**An AI-powered IT organization inside Claude Code.** 239 skills, 6 commands, AOP governance — one plugin to run your entire software agency from idea to revenue.

ScaleSync AI-Native Organization is a complete, self-contained AI agency operating as a Claude Code plugin: idea intake → market validation → spec → Docker-first build → k8s/Helm → security/QA → release → launch → marketing → business growth. AOP-governed (auto-fired via hooks), sub-agent driven, TDD-enforced.

---

## Quick Install

```bash
# Step 1 — Add this marketplace
/plugin marketplace add Anand195/ai-tech-org

# Step 2 — Install the plugin
/plugin install ai_tech_org_plugin

# Step 3 — Reload plugins
/reload-plugins
```

> **Requirements:** Claude Code with plugin support enabled.

---

## Commands

| Command | Description |
|---------|-------------|
| `/scalesync:new-idea [idea]` | Start a new idea — structured intake (step 0) |
| `/scalesync:validate [slug]` | Validate an idea — real market research + PMF verdict |
| `/scalesync:build [slug]` | Build a validated project end-to-end (Docker-first, TDD) |
| `/scalesync:portfolio` | Portfolio view across all active projects |
| `/scalesync:phase-done [slug]` | Close a phase — advisor report, issues, Pages walkthrough |
| `/scalesync:release [slug]` | Cut a versioned release — SemVer tag, GHCR, release notes |

---

## The Full Pipeline (Idea → Revenue)

```
0. INTAKE       → scalesync-intake → INTAKE.md + workspace
1. VALIDATION   → market-fit-analyzer → PMF Scorecard (GO / CONDITIONAL / PIVOT / NO-GO)
2. AGREEMENT    → contract-and-proposal-writer → SOW + cost model
3. SETUP        → jira-expert · confluence-expert · spec-to-repo
4. SPEC         → requirements-analyst · cto-architect · delivery-manager
5. BUILD        → 6 phases: Design → Backend → Frontend → AI/ML → Infra → Sec/QA
6. DELIVERY     → technical-writer · changelog-generator · release-manager
7. LAUNCH       → launch-strategy · content-strategy · paid-ads · seo
8. GROWTH       → customer-success · revenue-operations · saas-metrics
9. ONGOING OPS  → scrum-master · incident-commander · cost-optimizer
```

Every phase enforced with:
- **AOP Governance** — Agent Operating Protocol: Understanding Contract → approval gates → cited research → blocker protocol → changelog → reports
- **Docker-First** — every project containerized, multi-stage Dockerfiles, health checks, GHCR push
- **TDD + SDD** — tests first, tests in Docker, sub-agents with worktree isolation, 80% coverage gate
- **Git Discipline** — private repos, issues per phase, SemVer releases, GitHub Pages walkthroughs
- **Phase Advisors** — quality gates, live-researched best practices, deployment readiness, next phase plan

---

## Skill Inventory (239 skills)

| Category | Count | Role |
|----------|-------|------|
| ScaleSync Core + Custom | 33 | Orchestrator, intake, market-fit, Docker/k8s automation, git maintainers, TDD/SDD, AOP |
| C-Level Advisors | 33 | CEO, CTO, CFO, CMO, CRO, CPO, COO, CHRO, CISO, CAIO, CDO, CCO, VPE advisors |
| Engineering | 32 | Senior devops/backend/frontend, security, incident, cloud architects |
| Engineering Advanced | 40 | CI/CD, k8s, observability, ship-gate, release, RAG, MCP builder, chaos engineering |
| Marketing | 47 | SEO, AI-SEO, AEO, launch, content, paid ads, CRO, social media, email |
| Product | 13 | Discovery, strategy, teardown, spec-to-repo, roadmap |
| PM | 9 | Jira, Confluence, Scrum, delivery management |
| Finance | 3 | Financial analyst, SaaS metrics |
| Business Growth | 5 | Proposals, sales engineering, customer success, RevOps |
| RA/QM (Compliance) | 16 | SOC2, GDPR, ISO 27001/13485, EU AI Act, FDA |
| Superpowers (sp-*) | 5 | TDD, sub-agent-driven dev, worktrees, plan writing/execution |
| Security | 8 | Security engineer, pen-testing, red-team, AI security, threat detection |

---

## Plugin Structure

```
ai-tech-org/
├── .claude-plugin/
│   ├── plugin.json          # Plugin manifest
│   └── marketplace.json     # Marketplace registration
├── CLAUDE.md                # Core orchestration instructions
├── ROUTING.md               # Skill routing map (which skill when)
├── commands/                # 6 slash commands
│   ├── new-idea.md
│   ├── validate.md
│   ├── build.md
│   ├── portfolio.md
│   ├── phase-done.md
│   └── release.md
├── hooks/
│   ├── hooks.json           # SessionStart + UserPromptSubmit hooks
│   └── aop-gate.sh          # AOP governance auto-fire script
├── config/
│   ├── permissions.json     # Recommended permission allowlist
│   └── schedule-routines.md # Recurring ops schedule
├── assets/
│   └── pages-theme/         # Branded GitHub Pages theme
├── skills/                  # 239 skill directories
│   ├── scalesync-intake/
│   ├── market-fit-analyzer/
│   ├── orchestrator-master/
│   ├── aop-enforcer/
│   ├── phase-advisor/
│   ├── docker-engineer/
│   ├── security-engineer/
│   ├── (235 more...)
├── README.md
├── LICENSE
└── .gitignore
```

---

## Architecture

### AOP Governance (always active)

The Agent Operating Protocol fires automatically on every session start and every user prompt via `hooks/aop-gate.sh`:

1. **Understanding Contract** — confirm the task before execution
2. **Task Brief** — approved before work begins
3. **Research Cited** — every claim backed by 2-3 sources
4. **Blocker Protocol** — stop + report on any blocker
5. **Changelog** — record every change
6. **Final Report** — MD + PDF per phase

### Sub-Agent Driven Development

The orchestrators decompose phases into independent tasks. Each task is dispatched to a sub-agent via the **Agent tool** with worktree isolation. Sub-agents follow TDD (RED → GREEN → REFACTOR) in Docker. The main thread integrates, runs the full Docker test suite, code review + adversarial review, ship-gate, and phase-advisor.

### Skill Routing

`ROUTING.md` resolves the 239-skill overlap map — which skill to use when, who to delegate to, and what to never do. Priority: Governance → Process → Orchestrators → Role Executors → Depth Specialists. One owner per deliverable.

---

## Configuration

### Permissions

Copy `config/permissions.json` into your Claude Code settings to reduce permission prompts for routine operations:

```bash
cp config/permissions.json ~/.claude/settings.json
```

Review before adding write/deploy entries.

### Branding

Edit `assets/pages-theme/style.scss` to customize the GitHub Pages theme colors for client walkthroughs.

---

## Development

To contribute or fork:

```bash
git clone https://github.com/Anand195/ai-tech-org.git
cd ai-tech-org
# Edit skills, commands, CLAUDE.md, or add new skills
```

### Testing locally

1. Clone the repo
2. Add the local path as a plugin source in Claude Code
3. Run `/reload-plugins`
4. Test with `/scalesync:new-idea test idea`

---

## License

MIT — free to use, modify, and distribute.

---

## Related

- [Claude Code Plugins Documentation](https://docs.anthropic.com/en/docs/claude-code/plugins)
- [Social Media Studio](https://github.com/Anand195/social-media-studio) — multi-platform social content plugin
- [Caveman](https://github.com/juliusbrussee/caveman) — ultra-compressed communication mode
- [Superpowers](https://github.com/obra/superpowers) — development methodology for coding agents
