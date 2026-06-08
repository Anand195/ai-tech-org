---
description: Cut a versioned release — SemVer tag, GHCR image (scan-first), release notes
argument-hint: [project-slug]
allowed-tools: Read, Write, Edit, Bash, Skill
---

# /scalesync:release

Cut a release for an accepted phase/milestone.

Project: **$ARGUMENTS**

Steps:
1. Confirm `main` green + `ship-gate` PASS + Trivy scan clean. If not → stop.
2. Invoke skill `git-release-maintainer`.
3. Decide SemVer bump from change scope.
4. Tag vX.Y.Z, push image to `ghcr.io/anand195/$ARGUMENTS`, generate release notes (via changelog-generator).
5. Bump Helm Chart.yaml if k8s in use.
6. Release ONLY after human approval (AOP — outward, hard to reverse).
