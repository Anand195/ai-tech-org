---
name: secrets-binding
description: |
  Concrete, live secrets-management bindings for Docker and Kubernetes projects — wires apps to a real
  secrets backend (HashiCorp Vault, AWS SSM Parameter Store / Secrets Manager, or Sealed Secrets) so no
  plaintext secret ever lands in a repo, image, or values file. Use during infra phase whenever secrets
  exist. Triggers: "manage secrets", "vault integration", "where do secrets go", "secret injection",
  "no plaintext secrets", k8s secret handling.
disable-model-invocation: false
allowed-tools: Read, Write, Edit, Bash, WebSearch
context: fork
---

# Secrets Binding

Moves secrets from "documented pattern" to "actually wired." Every ScaleSync project gets a concrete backend; `.env` is for local dev only and never committed.

## When to Use
- Phase 5 (Infrastructure), any time the project has credentials/keys.
- Before any deploy that needs production secrets.

## Backend Selection
| Context | Backend | Why |
|---------|---------|-----|
| Docker Compose (VPS/MVP) | `.env` (gitignored) + Docker secrets | Simple, no extra infra |
| AWS deployment | AWS SSM Parameter Store / Secrets Manager | Native IAM, rotation, audit |
| GCP deployment | Secret Manager | Native IAM |
| Azure deployment | Key Vault | Native RBAC |
| Kubernetes (any) | External Secrets Operator (ESO) → cloud backend, OR Sealed Secrets | No plaintext in git; GitOps-safe |
| Multi-cloud / self-host | HashiCorp Vault | Dynamic secrets, leasing |

## Concrete Wiring

### Docker Compose
- `.env` gitignored; `.env.example` documents every key (no values).
- Inject via `env_file:` or `secrets:` (Docker secrets) — never inline in compose.
- CI pulls from the repo/CI secret store, writes `.env` at deploy time.

### Kubernetes (External Secrets Operator)
- Install ESO; define `SecretStore` (points at SSM/Secret Manager/Vault).
- `ExternalSecret` resources map backend keys → k8s Secrets at runtime.
- Helm `values.yaml` references secret NAMES only, never values.

### Kubernetes (Sealed Secrets, GitOps)
- `kubeseal` encrypts secrets → `SealedSecret` CRDs safe to commit.
- Controller decrypts in-cluster only.

## Workflow
1. Detect secrets in the project (scan for keys, tokens, DB URLs).
2. Pick backend per the table (confirm with human).
3. Generate `.env.example`, gitignore rules, and backend config (ESO/SealedSecret/SSM IaC).
4. Verify NO plaintext secret in repo: `git grep -nE '(api[_-]?key|secret|password|token)\s*=' ` review + secret scanner.
5. Document rotation policy.
6. Report to `phase-advisor` (deployment readiness: secrets ✅).

## Behavior
- Verify current operator/API versions via WebSearch (ESO, Sealed Secrets release fast).
- Pairs with `secrets-vault-manager` (patterns) and `helm-scaffolder` (chart references).

## Standing Rules
- **No plaintext secret in any repo, image, or values file. Ever.**
- `.env` is local-dev only and always gitignored.
- See [[helm-scaffolder]], [[secrets-vault-manager]], [[env-secrets-manager]], [[cloud-security]], [[docker-best-practices-advisor]].
