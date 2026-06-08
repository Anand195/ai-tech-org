---
description: Portfolio view across all active ScaleSync client projects
allowed-tools: Read, Write, Edit, Bash, Agent, Skill
---

# /scalesync:portfolio

Show and manage all in-flight projects.

Steps:
1. Invoke skill `multi-project-orchestrator`.
2. Regenerate `PORTFOLIO.md` from each project's current phase + git state.
3. Output table: project | client | phase | status | repo | next action | blocker.
4. Flag at-risk projects and blockers needing human attention.
