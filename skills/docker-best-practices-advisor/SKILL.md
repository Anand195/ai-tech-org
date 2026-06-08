---
name: docker-best-practices-advisor
description: |
  Audits any Dockerfile, docker-compose.yml, or container setup against current best practices and
  flags anti-patterns. Use whenever Docker artifacts are written or changed, before any image build
  or GHCR push. Complements docker-engineer (which builds) by reviewing and hardening. Triggers:
  "review my Dockerfile", "is this compose file good", "docker best practices", "harden container",
  "why is my image so big", after docker-engineer produces artifacts.
disable-model-invocation: false
allowed-tools: Read, Write, Edit, Bash, WebSearch
context: fork
---

# Docker Best-Practices Advisor

Reviews and hardens container artifacts. Every ScaleSync project is Docker-first, so this runs on every Dockerfile/compose before build.

## When to Use
- After `docker-engineer` writes Dockerfiles / compose.
- Before any `docker build` or GHCR push.
- During `phase-advisor` deployment-readiness checks.

## Audit Checklist

### Dockerfile
- [ ] **Multi-stage build** — build deps not shipped in final image
- [ ] **Pinned base image** by digest or specific tag (no `:latest`)
- [ ] **Non-root USER** — never run as root
- [ ] **Minimal base** — distroless / alpine / slim where viable
- [ ] **Layer order** — deps copied/installed before app code (cache efficiency)
- [ ] **.dockerignore** present and lean
- [ ] **No secrets** baked into layers (check ARG/ENV/COPY)
- [ ] **HEALTHCHECK** defined
- [ ] **Explicit EXPOSE** + documented ports
- [ ] **Single concern per image** (no app+db in one image)
- [ ] **COPY not ADD** (unless extracting archives)
- [ ] **Clean package caches** in same RUN layer

### docker-compose.yml
- [ ] Health checks on every service with `depends_on: condition: service_healthy`
- [ ] Named volumes (not anonymous) for persistence
- [ ] Named networks, no host networking unless required
- [ ] Resource limits (`deploy.resources.limits`) set
- [ ] Env via `.env` + `.env.example` documented; no inline secrets
- [ ] Restart policy set (`unless-stopped`)
- [ ] No published ports that should be internal-only

### Security
- [ ] Trivy/Grype scan clean (run if available): `trivy image <img>`
- [ ] Read-only root filesystem where possible (`read_only: true`)
- [ ] `cap_drop: [ALL]` + add back only what's needed
- [ ] No privileged mode unless justified and documented

## Output — Advisor Report
```markdown
# Docker Audit — [project] — DD-MM-YYYY
## Verdict: PASS / PASS-WITH-FIXES / FAIL

## Findings
| Severity | File:Line | Anti-pattern | Fix |
|----------|-----------|--------------|-----|
| HIGH | Dockerfile:1 | uses node:latest | pin to node:20.11-slim |

## Image size analysis
- Current: X MB → After fixes: ~Y MB

## Applied / Suggested fixes
[diffs or recommendations]

## Best-practice sources
[cited, verified live]
```

## Behavior
- Verify "current best practice" via WebSearch when the stack/base image has known recent changes — don't rely on stale memory (e.g., base image EOL, new BuildKit features).
- Offer to apply fixes (AOP approval gate before editing).

## Standing Rules
- Docker-first means Docker-correct. No project ships a flagged HIGH finding.
- See [[docker-engineer]], [[helm-scaffolder]], [[phase-advisor]], [[cloud-security]].
