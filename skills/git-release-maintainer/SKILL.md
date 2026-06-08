---
name: git-release-maintainer
description: |
  Manages versioned releases for each project: SemVer tags, GitHub Releases with notes, and GHCR
  image publishing. Use at phase acceptance and at production milestones. Triggers: "cut a release",
  "tag this version", "publish release notes", "push image to GHCR", "version bump", after a phase is
  accepted by the human.
disable-model-invocation: false
allowed-tools: Read, Write, Edit, Bash
context: fork
---

# Git Release Maintainer

Owns versioning and releases. Turns accepted phase work into tagged, documented, shippable releases with container images in GHCR.

## When to Use
- A phase is accepted by the human (after `phase-advisor` go).
- A production/milestone release is requested.

## Versioning (SemVer)
- `MAJOR.MINOR.PATCH`
- Phase completions → typically `MINOR` bumps (e.g., backend phase = `0.2.0`).
- Bug fixes → `PATCH`. Breaking API/contract changes → `MAJOR`.
- Pre-1.0 projects use `0.x` until first production launch (then `1.0.0`).

## Release Workflow
1. Confirm `main` is green (CI passing, `ship-gate` PASS).
2. Decide version bump from change scope (read changelog since last tag).
3. Tag: `git tag -a vX.Y.Z -m "Phase N: <summary>"` and push tag.
4. Build + push image: `ghcr.io/anand195/[project]:vX.Y.Z` and `:latest`.
   - Ensure image was scanned (Trivy) and passed before publish.
5. Generate release notes (use `changelog-generator` output) → `gh release create vX.Y.Z`.
6. If Helm in use → bump `Chart.yaml` version + `appVersion`, package chart.
7. Update `PORTFOLIO.md` and project `docs/` with the release.

## Release Notes Template
```markdown
# vX.Y.Z — [Phase N / Milestone] — DD-MM-YYYY

## Highlights
- ...

## Added / Changed / Fixed
- ...

## Container
- `ghcr.io/anand195/[project]:vX.Y.Z`
- Image digest: sha256:...
- Scan: Trivy [clean]

## Upgrade notes
- [migrations / breaking changes]

## Issues closed
- #N, #M
```

## Guardrails
- Release ONLY after human approval (AOP — outward, hard-to-reverse).
- Never publish an image that failed security scan or `ship-gate`.
- Tags are immutable — never move or delete a published tag; supersede with a new version.
- Use `gh` CLI; never hardcode tokens or registry creds.

## Standing Rules
- Every accepted phase → a tagged, documented release with a scanned GHCR image.
- SemVer always. Release notes always. Scan-before-publish always.
- See [[git-update-tracker]], [[git-issue-maintainer]], [[changelog-generator]], [[release-manager]], [[ship-gate]], [[docker-engineer]].
