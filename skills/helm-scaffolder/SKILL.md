---
name: helm-scaffolder
description: |
  Generates a complete, production-grade Helm chart from a project's docker-compose.yml + config.
  Use when a project needs Kubernetes deployment (client asks for k8s/Helm, or scale/HA requires it).
  Bridges Docker-Compose → Kubernetes without manual rewrite. Triggers: "create helm chart",
  "deploy to kubernetes", "k8s manifests", "convert compose to helm", "helmify", scale/HA requirement.
disable-model-invocation: false
allowed-tools: Read, Write, Edit, Bash, WebSearch
context: fork
---

# Helm Scaffolder

Turns a Docker-first project into a Kubernetes-ready Helm chart. Only fires when k8s is requested or required (per the plugin's deployment decision tree) — Docker Compose remains the default.

## When to Use
- Client explicitly requests Kubernetes/Helm.
- `phase-advisor` / `tech-stack-evaluator` recommends k8s (HA, > 5K req/s, > 10 services).
- Migrating an existing compose project to k8s.

## Inputs
- `docker-compose.yml` (services, ports, env, volumes, health checks)
- Project config (replicas target, resource needs, ingress host, TLS)

## Output Structure
```
helm/[project]/
  Chart.yaml
  values.yaml
  values.staging.yaml
  values.prod.yaml
  templates/
    _helpers.tpl
    deployment.yaml         # per service
    service.yaml
    ingress.yaml
    hpa.yaml                # HorizontalPodAutoscaler
    pdb.yaml                # PodDisruptionBudget
    configmap.yaml
    secret.yaml             # references External Secrets / Sealed Secrets, never plaintext
    serviceaccount.yaml
    networkpolicy.yaml
  NOTES.txt
helmfile.yaml               # multi-env orchestration
```

## Conversion Mapping (compose → k8s)
| Compose | Kubernetes |
|---------|-----------|
| service | Deployment + Service |
| ports | Service + Ingress |
| environment | ConfigMap (non-secret) + Secret (secret) |
| volumes | PVC + PersistentVolume |
| healthcheck | liveness + readiness + startup probes |
| depends_on | initContainers / readiness ordering |
| deploy.replicas | Deployment replicas + HPA min |
| restart policy | Deployment (always) |

## Mandatory chart features
- Liveness, readiness, AND startup probes on every pod
- HPA with CPU + memory targets
- PodDisruptionBudget for zero-downtime rollouts
- Resource requests + limits on every container
- NetworkPolicy default-deny + explicit allows
- Secrets via External Secrets Operator or Sealed Secrets (NEVER plaintext in values)
- Non-root securityContext, read-only root FS where possible
- Per-env values files (staging/prod) overriding base

## Workflow
1. Parse compose → enumerate services.
2. Confirm target (replicas, ingress host, TLS, cloud provider) — AOP intake.
3. Generate chart + templates.
4. Validate: `helm lint helm/[project]` and `helm template helm/[project] | kubeval` (run if available).
5. Hand to `senior-devops` / `kubernetes-operator` for cluster-specific tuning (EKS/GKE/AKS).
6. Report deployment readiness to `phase-advisor`.

## Behavior
- Verify current Helm/k8s API versions via WebSearch (APIs deprecate — e.g., autoscaling/v2, networking.k8s.io/v1) before emitting manifests.
- Never emit deprecated apiVersions.

## Standing Rules
- Helm only when needed; Docker Compose is the default deployment.
- No plaintext secrets in any values file. Ever.
- See [[docker-engineer]], [[senior-devops]], [[kubernetes-operator]], [[secrets-vault-manager]], [[cloud-architect]].
