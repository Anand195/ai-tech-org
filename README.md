# AI Tech Org v3.0 — Claude Code Plugin

![Version](https://img.shields.io/badge/version-3.0.0-blue)
![License](https://img.shields.io/badge/license-MIT-green)
![Skills](https://img.shields.io/badge/skills-250-orange)
![Agents](https://img.shields.io/badge/agents-118-purple)
![Commands](https://img.shields.io/badge/commands-6-red)

**ScaleSync AI-Native Organization** — a complete AI-powered IT organization inside Claude Code. **250 skills + 118 agents** across 10 categories. AOP-governed, sub-agent driven, TDD-enforced.

One plugin, end to end: idea intake → market validation → Docker-first build → k8s/Helm → security/QA → release → launch → marketing → business growth.

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

## Agents (118)

### 🔷 Language Experts (25)

Deep expertise in specific programming languages, frameworks, and runtimes.

| Agent | Description |
|-------|-------------|
| [angular-architect](agents/language-experts/angular-architect.md) | Angular 18+ architecture, signals, SSR, hydration, NgRx |
| [clojure-developer](agents/language-experts/clojure-developer.md) | Clojure immutable data structures, macros, REPL-driven development |
| [csharp-developer](agents/language-experts/csharp-developer.md) | .NET, async/await, LINQ, Span<T>, source generators |
| [django-developer](agents/language-experts/django-developer.md) | Django models, REST framework, ORM optimization, Celery |
| [elixir-expert](agents/language-experts/elixir-expert.md) | Elixir/Erlang OTP, Phoenix LiveView, GenServers, supervision trees |
| [flutter-expert](agents/language-experts/flutter-expert.md) | Dart/Flutter cross-platform, state management, widget trees |
| [golang-developer](agents/language-experts/golang-developer.md) | Go concurrency, interfaces, profiling, standard library mastery |
| [haskell-developer](agents/language-experts/haskell-developer.md) | Haskell pure functions, monads, type-level programming |
| [java-architect](agents/language-experts/java-architect.md) | Modern Java, Spring Boot, virtual threads, records, pattern matching |
| [kotlin-specialist](agents/language-experts/kotlin-specialist.md) | Kotlin coroutines, flows, multiplatform, ktor |
| [lua-developer](agents/language-experts/lua-developer.md) | Lua embedded scripting, metatables, C API |
| [nextjs-developer](agents/language-experts/nextjs-developer.md) | Next.js App Router, server components, ISR, streaming SSR |
| [nim-developer](agents/language-experts/nim-developer.md) | Nim systems programming, metaprogramming, C interop |
| [ocaml-developer](agents/language-experts/ocaml-developer.md) | OCaml type inference, functors, GADTs, Jane Street ecosystem |
| [php-developer](agents/language-experts/php-developer.md) | PHP 8.3+, Symfony/Laravel, attributes, fibers, typed properties |
| [python-engineer](agents/language-experts/python-engineer.md) | Python async, typing, C extensions, packaging, GIL understanding |
| [rails-expert](agents/language-experts/rails-expert.md) | Rails 7/8, Hotwire, turbo streams, Active Record optimization |
| [react-specialist](agents/language-experts/react-specialist.md) | React 18/19, hooks, Suspense, RSC, concurrent rendering |
| [rust-systems](agents/language-experts/rust-systems.md) | Rust ownership, lifetimes, async runtime, FFI, unsafe patterns |
| [scala-developer](agents/language-experts/scala-developer.md) | Scala 3, ZIO/Cats Effect, type classes, Akka |
| [svelte-developer](agents/language-experts/svelte-developer.md) | Svelte 5 runes, SvelteKit, fine-grained reactivity |
| [swift-developer](agents/language-experts/swift-developer.md) | Swift concurrency, SwiftUI, Swift Testing, performance |
| [typescript-specialist](agents/language-experts/typescript-specialist.md) | TypeScript advanced types, generics, conditional, mapped, template literal |
| [vue-specialist](agents/language-experts/vue-specialist.md) | Vue 3 Composition API, Pinia, Vite, Nuxt |
| [zig-developer](agents/language-experts/zig-developer.md) | Zig comptime, allocators, cross-compilation, C ABI |

### 🔷 Core Development (12)

Architects and engineers for core software design patterns and system architecture.

| Agent | Description |
|-------|-------------|
| [api-designer](agents/core-development/api-designer.md) | API design with REST, GraphQL, OpenAPI, versioning strategies |
| [api-gateway-engineer](agents/core-development/api-gateway-engineer.md) | API gateway config (Kong, Envoy, APISIX), rate limiting, auth |
| [electron-developer](agents/core-development/electron-developer.md) | Electron desktop apps, IPC, native modules, auto-updates |
| [event-driven-architect](agents/core-development/event-driven-architect.md) | Event sourcing, CQRS, message brokers, saga patterns |
| [frontend-architect](agents/core-development/frontend-architect.md) | Frontend architecture, Micro-Frontends, Module Federation |
| [fullstack-engineer](agents/core-development/fullstack-engineer.md) | Full-stack end-to-end features, API-to-UI workflows |
| [graphql-architect](agents/core-development/graphql-architect.md) | GraphQL schemas, resolvers, DataLoader, Apollo/Federation |
| [microservices-architect](agents/core-development/microservices-architect.md) | Microservices decomposition, communication, data ownership |
| [mobile-developer](agents/core-development/mobile-developer.md) | Mobile app development (native iOS/Android, React Native) |
| [monorepo-architect](agents/core-development/monorepo-architect.md) | Monorepo management, tooling, dependency graphs, CI caching |
| [ui-designer](agents/core-development/ui-designer.md) | UI component design, design systems, Tailwind, accessibility |
| [websocket-engineer](agents/core-development/websocket-engineer.md) | WebSocket real-time communication, reconnection, scaling |

### 🔷 Infrastructure (9)

Cloud, platform, and SRE engineers for infrastructure-as-code, deployment, and operations.

| Agent | Description |
|-------|-------------|
| [database-admin](agents/infrastructure/database-admin.md) | Database admin, migration, backup, replication, tuning |
| [deployment-engineer](agents/infrastructure/deployment-engineer.md) | Deployment pipelines, zero-downtime, canary, rollback |
| [devops-engineer](agents/infrastructure/devops-engineer.md) | DevOps pipelines, automation, configuration management |
| [incident-responder](agents/infrastructure/incident-responder.md) | Incident response, runbooks, postmortems, severity triage |
| [kubernetes-specialist](agents/infrastructure/kubernetes-specialist.md) | K8s operators, CRDs, Istio service mesh, cluster management |
| [network-engineer](agents/infrastructure/network-engineer.md) | Network design, DNS, CDN, firewalls, service mesh networking |
| [platform-engineer](agents/infrastructure/platform-engineer.md) | Internal developer platforms, Golden Paths, Backstage |
| [sre-engineer](agents/infrastructure/sre-engineer.md) | SRE, SLO/SLI/SLA, error budgets, observability, toil reduction |
| [terraform-engineer](agents/infrastructure/terraform-engineer.md) | Infrastructure as Code with Terraform, multi-region, state management |

### 🔷 Quality Assurance (6)

Testing and quality engineers for comprehensive quality verification.

| Agent | Description |
|-------|-------------|
| [accessibility-specialist](agents/quality-assurance/accessibility-specialist.md) | WCAG 2.2 compliance, ARIA, screen reader testing, contrast |
| [compliance-auditor](agents/quality-assurance/compliance-auditor.md) | Compliance auditing for GDPR, SOC2, PCI-DSS, ISO 27001 |
| [error-detective](agents/quality-assurance/error-detective.md) | Root cause analysis, error pattern recognition, stack trace analysis |
| [penetration-tester](agents/quality-assurance/penetration-tester.md) | Penetration testing, vulnerability assessment, exploit validation |
| [qa-automation](agents/quality-assurance/qa-automation.md) | QA automation frameworks, Playwright, Cypress, Selenium |
| [test-architect](agents/quality-assurance/test-architect.md) | Test architecture, test pyramid, integration testing, test doubles |

### 🔷 Data & AI (12)

Data engineering, machine learning, and AI specialization agents.

| Agent | Description |
|-------|-------------|
| [ai-engineer](agents/data-ai/ai-engineer.md) | AI integration, RAG pipelines, agent architectures |
| [autoresearch-agent](agents/data-ai/autoresearch-agent.md) | Auto-research workflows, paper analysis, experiment tracking |
| [computer-vision-engineer](agents/data-ai/computer-vision-engineer.md) | Computer vision, OpenCV, YOLO, image segmentation |
| [data-visualization](agents/data-ai/data-visualization.md) | Data viz with D3, Observable, Plotly, dashboard design |
| [database-optimizer](agents/data-ai/database-optimizer.md) | Query optimization, indexing, partitioning, query plan analysis |
| [etl-specialist](agents/data-ai/etl-specialist.md) | ETL/ELT pipelines, Airflow, dbt, data warehousing |
| [feature-engineer](agents/data-ai/feature-engineer.md) | Feature engineering, encoding, selection, feature stores |
| [llm-architect](agents/data-ai/llm-architect.md) | LLM architecture, fine-tuning, prompt optimization, eval |
| [mlops-engineer](agents/data-ai/mlops-engineer.md) | MLOps, model deployment, monitoring, feature stores, experiment tracking |
| [nlp-engineer](agents/data-ai/nlp-engineer.md) | NLP pipelines, transformers, tokenization, text classification |
| [recommendation-engine](agents/data-ai/recommendation-engine.md) | Recommendation systems, collaborative filtering, ranking |
| [vector-database-engineer](agents/data-ai/vector-database-engineer.md) | Vector databases, embeddings, hybrid search, Milvus/Pinecone/Weaviate |

### 🔷 Developer Experience (15)

Developer tooling, platform, and workflow optimization agents.

| Agent | Description |
|-------|-------------|
| [api-documentation](agents/developer-experience/api-documentation.md) | API docs with OpenAPI, Swagger, Redoc, versioned docs |
| [build-engineer](agents/developer-experience/build-engineer.md) | Build systems, caching, incremental builds, Bazel/Turborepo |
| [cli-developer](agents/developer-experience/cli-developer.md) | CLI development with proper flags, help text, exit codes |
| [dependency-manager](agents/developer-experience/dependency-manager.md) | Dependency management, lock files, vulnerability scanning |
| [developer-portal](agents/developer-experience/developer-portal.md) | Dev portals, Backstage, service catalog, developer docs |
| [documentation-engineer](agents/developer-experience/documentation-engineer.md) | Technical documentation, wikis, DocGen, README best practices |
| [dx-optimizer](agents/developer-experience/dx-optimizer.md) | Developer experience optimization, feedback loops, friction removal |
| [git-workflow-manager](agents/developer-experience/git-workflow-manager.md) | Git workflows, branching strategies, merge conflict resolution |
| [legacy-modernizer](agents/developer-experience/legacy-modernizer.md) | Legacy code modernization, migration strategies, strangler fig |
| [mcp-developer](agents/developer-experience/mcp-developer.md) | MCP server development, protocol design, tool definitions |
| [monorepo-tooling](agents/developer-experience/monorepo-tooling.md) | Monorepo tooling with Nx/Turborepo, caching, dependency graphs |
| [refactoring-specialist](agents/developer-experience/refactoring-specialist.md) | Code refactoring patterns, safe refactoring, dependency injection |
| [testing-infrastructure](agents/developer-experience/testing-infrastructure.md) | Test infrastructure, CI integration, parallel test execution |
| [tooling-engineer](agents/developer-experience/tooling-engineer.md) | Developer tooling, code generators, scaffolds, linting |
| [vscode-extension](agents/developer-experience/vscode-extension.md) | VS Code extension development, LSP, debugging extension API |

### 🔷 Specialized Domains (15)

Domain-specific engineering agents for specialized industry verticals.

| Agent | Description |
|-------|-------------|
| [blockchain-developer](agents/specialized-domains/blockchain-developer.md) | Blockchain, smart contracts, Solidity, Ethereum, Web3 |
| [e-commerce-engineer](agents/specialized-domains/e-commerce-engineer.md) | E-commerce systems, cart, checkout, inventory, payment orchestration |
| [education-tech](agents/specialized-domains/education-tech.md) | EdTech platforms, LMS, SCORM, adaptive learning |
| [embedded-systems](agents/specialized-domains/embedded-systems.md) | Embedded systems, firmware, RTOS, cross-compilation |
| [fintech-engineer](agents/specialized-domains/fintech-engineer.md) | Fintech systems, payment rails, KYC/AML, ledger systems |
| [game-developer](agents/specialized-domains/game-developer.md) | Game development, Unity/Unreal, game loops, ECS architecture |
| [geospatial-engineer](agents/specialized-domains/geospatial-engineer.md) | Geospatial systems, GIS, map services, spatial indexing |
| [healthcare-engineer](agents/specialized-domains/healthcare-engineer.md) | Healthcare systems, HL7/FHIR, HIPAA compliance, medical devices |
| [iot-engineer](agents/specialized-domains/iot-engineer.md) | IoT systems, MQTT, edge computing, device management |
| [media-streaming](agents/specialized-domains/media-streaming.md) | Media streaming, HLS/DASH, transcoding, DRM, CDN |
| [payment-integration](agents/specialized-domains/payment-integration.md) | Payment integration, Stripe, PayPal, webhooks, reconciliation |
| [real-estate-tech](agents/specialized-domains/real-estate-tech.md) | Real estate tech, MLS, property management, proptech |
| [robotics-engineer](agents/specialized-domains/robotics-engineer.md) | Robotics, ROS 2, sensor fusion, motion planning, SLAM |
| [seo-specialist](agents/specialized-domains/seo-specialist.md) | SEO, technical SEO, structured data, Core Web Vitals |
| [voice-assistant](agents/specialized-domains/voice-assistant.md) | Voice assistants, ASR/TTS, wake word, dialog management |

### 🔷 Business & Product (6)

Business operations, product management, and growth agents.

| Agent | Description |
|-------|-------------|
| [business-analyst](agents/business-product/business-analyst.md) | Business analysis, requirements gathering, process modeling |
| [content-strategist](agents/business-product/content-strategist.md) | Content strategy, editorial calendars, brand voice, distribution |
| [growth-engineer](agents/business-product/growth-engineer.md) | Growth engineering, A/B testing, activation loops, viral hooks |
| [legal-advisor](agents/business-product/legal-advisor.md) | Legal guidance, contract review, IP strategy, compliance |
| [marketing-analyst](agents/business-product/marketing-analyst.md) | Marketing analysis, campaign ROI, attribution, funnel metrics |
| [project-manager](agents/business-product/project-manager.md) | Project management, sprint planning, stakeholder communication |

### 🔷 Orchestration (8)

Coordination and workflow management agents.

| Agent | Description |
|-------|-------------|
| [agent-installer](agents/orchestration/agent-installer.md) | Agent installation, setup, configuration, verification |
| [context-manager](agents/orchestration/context-manager.md) | Context window management, token optimization, session state |
| [error-coordinator](agents/orchestration/error-coordinator.md) | Error coordination, triage routing, escalations, resolution tracking |
| [knowledge-synthesizer](agents/orchestration/knowledge-synthesizer.md) | Knowledge synthesis across multiple sources, insight generation |
| [multi-agent-coordinator](agents/orchestration/multi-agent-coordinator.md) | Multi-agent coordination, parallel execution, dependency DAG |
| [performance-monitor](agents/orchestration/performance-monitor.md) | Performance monitoring, bottleneck detection, optimization |
| [task-coordinator](agents/orchestration/task-coordinator.md) | Task coordination, prioritization, assignment, tracking |
| [workflow-director](agents/orchestration/workflow-director.md) | Workflow orchestration, stage gating, approval flows |

### 🔷 Research & Analysis (10)

Research, competitive intelligence, and analysis agents.

| Agent | Description |
|-------|-------------|
| [academic-researcher](agents/research-analysis/academic-researcher.md) | Academic research, literature review, citation tracking |
| [benchmarking-specialist](agents/research-analysis/benchmarking-specialist.md) | Benchmarking, performance baselines, comparative analysis |
| [competitive-analyst](agents/research-analysis/competitive-analyst.md) | Competitive analysis, market positioning, war gaming |
| [data-researcher](agents/research-analysis/data-researcher.md) | Data research, source verification, statistical analysis |
| [patent-analyst](agents/research-analysis/patent-analyst.md) | Patent analysis, prior art search, patent landscape |
| [research-analyst](agents/research-analysis/research-analyst.md) | Research synthesis, report writing, methodology design |
| [search-specialist](agents/research-analysis/search-specialist.md) | Advanced search, query crafting, Boolean operators, source evaluation |
| [security-researcher](agents/research-analysis/security-researcher.md) | Security research, vulnerability discovery, exploit analysis |
| [technology-scout](agents/research-analysis/technology-scout.md) | Technology scouting, emerging tech evaluation, landscape analysis |
| [trend-analyst](agents/research-analysis/trend-analyst.md) | Trend analysis, pattern identification, forecasting, impact assessment |

---

## Skills (250)

The plugin ships with **250 skills** covering the full SDLC, marketing, compliance, business growth, and now — a complete UI/UX design system. Skills are deep — each with SKILL.md, scripts, references, templates, and evals.

| Category | Count | Examples |
|----------|-------|----------|
| ScaleSync Orchestrators | 7 | scalesync-intake, market-fit-analyzer, orchestrator-master, multi-project-orchestrator, phase-advisor, scalesync-tdd-sdd, aop-enforcer |
| Engineering | 32 | senior-backend, senior-frontend, senior-fullstack, senior-architect, senior-devops, api-developer, database-designer, node-developer, docker-engineer |
| Engineering Advanced | 40 | kubernetes-operator, helm-scaffolder, ci-cd-pipeline-builder, observability-designer, chaos-engineering, slo-architect, mcp-server-builder |
| Security | 8 | security-engineer, security-pen-testing, ai-security, cloud-security, red-team, threat-detection, senior-secops, senior-security |
| C-Level Advisors | 33 | ceo-advisor, cto-advisor, cfo-advisor, cto-architect, vpe-advisor, ciso-advisor, cmo-advisor, cro-advisor, coo-advisor, chro-advisor |
| Marketing | 47 | content-strategy, content-creator, paid-ads, seo-audit, ai-seo, aeo, social-media-manager, email-sequence, launch-strategy |
| Product | 13 | product-discovery, product-strategist, product-manager-toolkit, product-analytics, tech-stack-evaluator |
| QA & Testing | 8 | qa-engineer, senior-qa, code-reviewer, test-architect, api-test-suite-builder, adversarial-reviewer, skill-tester |
| DevOps & Infra | 15 | helm-scaffolder, ci-cd-pipeline-builder, cloud-architect, aws-architect, gcp-architect, site-architecture, deployment-engineer |
| Data & AI | 14 | ai-ml-engineer, rag-architect, prompt-engineer-toolkit, senior-data-engineer, senior-data-scientist, senior-ml-engineer |
| Compliance & Quality | 16 | soc2-compliance, gdpr-dsgvo-expert, iso42001-specialist, eu-ai-act-specialist, isms-audit-expert, qms-audit-expert, capa-officer |
| Finance & Business | 8 | financial-analyst, revenue-operations, pricing-strategy, saas-metrics-coach, cost-optimizer, tc-tracker |
| Superpowers (sp-*) | 5 | sp-executing-plans, sp-subagent-driven-development, sp-test-driven-development, sp-using-git-worktrees, sp-writing-plans |
| Git & Release | 8 | git-issue-maintainer, git-release-maintainer, git-update-tracker, git-worktree-manager, github-pages-publisher, release-manager, changelog-generator, ship-gate |
| Growth & Marketing | 20+ | social-content, cro-advisor, form-cro, page-cro, signup-flow-cro, paywall-cro, popup-cro, onboarding-cro, free-tool-strategy, referral-program, webinar-marketing |
| Research | 8 | market-researcher, competitive-intel, competitive-teardown, competitor-alternatives, risk-analyst, requirements-analyst, tech-stack-evaluator |
| **UI/UX Design System (V3)** | **11** | **impeccable (23 design commands + 7 refs), design-taste-frontend, minimalist-ui, industrial-brutalist-ui, high-end-visual-design, image-to-code, redesign-existing-projects, gpt-taste, full-output-enforcement, stitch-design-taste, design-taste-frontend-v1** |

---

## Plugin Structure

```
ai-tech-org/
├── .claude-plugin/
│   ├── plugin.json              # Plugin manifest
│   └── marketplace.json         # Marketplace registration
├── agents/                      # 118 agents (10 categories) — V2
│   ├── language-experts/        #   25 agents
│   ├── core-development/        #   12 agents
│   ├── infrastructure/          #    9 agents
│   ├── quality-assurance/       #    6 agents
│   ├── data-ai/                 #   12 agents
│   ├── developer-experience/    #   15 agents
│   ├── specialized-domains/     #   15 agents
│   ├── business-product/        #    6 agents
│   ├── orchestration/           #    8 agents
│   └── research-analysis/       #   10 agents
├── CLAUDE.md                    # Core orchestration instructions
├── ROUTING.md                   # Skill routing map
├── commands/                    # 6 slash commands
├── hooks/                       # AOP governance auto-fire hooks
├── config/                      # Permissions + schedule
├── assets/                      # Branded GitHub Pages theme
├── skills/                      # 239 skill directories
├── README.md
├── LICENSE
└── .gitignore
```

---

## The Full Pipeline (Idea → Revenue)

```
0.  INTAKE       → scalesync-intake → INTAKE.md + workspace
1.  VALIDATION   → market-fit-analyzer → PMF Scorecard
2.  AGREEMENT    → contract-and-proposal-writer → SOW + cost model
3.  SETUP        → jira-expert + confluence-expert + spec-to-repo
4.  SPEC         → requirements-analyst + cto-architect + delivery-manager
5.  BUILD        → 6 phases: Design → Backend → Frontend → AI/ML → Infra → Sec/QA
6.  DELIVERY     → technical-writer + changelog-generator + release-manager
7.  LAUNCH       → launch-strategy + content-strategy + paid-ads + seo
8.  GROWTH       → customer-success + revenue-operations + saas-metrics
9.  ONGOING OPS  → scrum-master + incident-commander + cost-optimizer
```

Every phase enforced with AOP Governance (Understanding Contract → approval gates → cited research → blocker protocol → changelog → reports), Docker-First (multi-stage Dockerfiles, health checks, GHCR push), TDD + SDD (tests first in Docker, sub-agents with worktree isolation, 80% coverage gate), and Git Discipline (private repos, issues per phase, SemVer releases, GitHub Pages walkthroughs).

---

## Using Agents

All 118 agents in the `agents/` directory are auto-discovered by Claude Code. To invoke an agent:

- **Directly**: "Act as a rust-systems engineer and review this code"
- **Via pipeline**: `/scalesync:build [slug]` automatically invokes orchestrator agents
- **For review**: "Have the security-researcher and penetration-tester review this"

Agents come with YAML frontmatter specifying their required tools and recommended model:

```yaml
---
name: rust-systems
description: Rust ownership, lifetimes, async runtime, FFI, unsafe patterns
tools: ["Read", "Write", "Edit", "Bash", "Glob", "Grep"]
model: opus
---
```

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

## V3 UI/UX Design System (New)

V3 adds a complete UI/UX design system with 11 new skills:

| Skill | Source | Purpose |
|-------|--------|---------|
| [impeccable](skills/impeccable/) | pbakaus/impeccable | 23 design commands + 27 reference files (typography, color, motion, spatial, interaction, responsive, UX writing, craft, critique, audit, polish, etc.) + anti-pattern detection scripts |
| [design-taste-frontend](skills/design-taste-frontend/) | Leonxlnx/taste-skill | Anti-slop frontend skill with 3 adjustable dials (variance, motion, density) |
| [design-taste-frontend-v1](skills/design-taste-frontend-v1/) | Leonxlnx/taste-skill | Original v1 of taste-skill (preserved for compatibility) |
| [gpt-taste](skills/gpt-taste/) | Leonxlnx/taste-skill | Stricter GPT/Codex variant with higher layout variance |
| [image-to-code](skills/image-to-code/) | Leonxlnx/taste-skill | Image-first pipeline: generate references → analyze → implement |
| [redesign-existing-projects](skills/redesign-existing-projects/) | Leonxlnx/taste-skill | Audit existing UI then fix layout, spacing, hierarchy |
| [high-end-visual-design](skills/high-end-visual-design/) | Leonxlnx/taste-skill | Polished, calm, premium UI with softer contrast and whitespace |
| [full-output-enforcement](skills/full-output-enforcement/) | Leonxlnx/taste-skill | Forces complete code output — no placeholder comments |
| [minimalist-ui](skills/minimalist-ui/) | Leonxlnx/taste-skill | Editorial product UI (Notion/Linear vibes) |
| [industrial-brutalist-ui](skills/industrial-brutalist-ui/) | Leonxlnx/taste-skill | Swiss type, sharp contrast, experimental layout |
| [stitch-design-taste](skills/stitch-design-taste/) | Leonxlnx/taste-skill | Google Stitch-compatible rules with DESIGN.md export |

Additionally, **Emil Kowalski's design engineering philosophy** (animation decision framework, interaction design rules, review format) has been merged into the existing [ui-ux-designer](skills/ui-ux-designer/) skill.

---

## V2 Migration Notes

If upgrading from v1:

- **New**: `agents/` directory with 118 agents across 10 categories
- **New**: All 239 original skills preserved with no changes
- **Updated**: CLAUDE.md now references agents directory
- **Updated**: Enhanced descriptions and keywords in plugin manifest
- **Updated**: README with full agent catalog in clean table format

---

## Development

```bash
git clone https://github.com/Anand195/ai-tech-org.git
cd ai-tech-org
# Add new skills in skills/ or new agents in agents/
# Test with /reload-plugins then /scalesync:new-idea test
```

---

## License

MIT — free to use, modify, and distribute.

---

## Related

- [Claude Code Plugins Documentation](https://docs.anthropic.com/en/docs/claude-code/plugins)
- [Social Media Studio](https://github.com/Anand195/social-media-studio) — multi-platform social content plugin
- [awesome-claude-code-toolkit](https://github.com/rohitg00/awesome-claude-code-toolkit) — comprehensive Claude Code toolkit (agent source)
- [Superpowers](https://github.com/obra/superpowers) — development methodology for coding agents
