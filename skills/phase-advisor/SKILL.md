---
name: phase-advisor
description: |
  Produces the mandatory Best-Next-Step Advisor Report at the end of EVERY development phase.
  Use at every phase boundary to tell the human exactly what was built, what passed, what the
  risks are, the single best next step (with reason), the current best practice, deployment
  readiness, and any newer/better approach (trend alert). Triggers: "phase complete", "what's next",
  "phase advisor", end of any phase in orchestrator-master / multi-project-orchestrator.
disable-model-invocation: false
allowed-tools: Read, Write, Edit, WebSearch, Bash, Agent
context: fork
---

# Phase Advisor

Closes every phase with a decision-grade report. This is the "senior advisor in the room" that says what's done, what's next, and what the industry currently considers best practice.

## When to Use
- End of EVERY phase (0 through 6) in any project.
- Invoked by `orchestrator-master` and `multi-project-orchestrator` automatically.

## Inputs it gathers
- Phase deliverables (from the phase's executor skills)
- Quality gate results — pulls from `ship-gate`, `qa-engineer`, `cloud-security`, `dependency-auditor`
- Deployment readiness — Docker ✅/❌, Helm ✅/❌, k8s ✅/❌, Cloud ✅/❌
- Current best practice — verified via WebSearch at report time (don't rely on stale memory)

## The Advisor Report (mandatory format)

```
═══════════════════════════════════════════════
PHASE [N] COMPLETE — ADVISOR REPORT
Project: [slug] | Date: DD-MM-YYYY
═══════════════════════════════════════════════

✅ WHAT WAS BUILT
  - [deliverable 1]
  - [deliverable 2]

📊 QUALITY GATES
  - Tests: [pass/fail + coverage]
  - Security scan: [Trivy result]
  - Code review: [adversarial-reviewer verdict]
  - ship-gate: [PASS/FAIL]

⚠️  RISKS / GAPS
  - [risk + severity]

🚀 RECOMMENDED NEXT STEP
  [the single best next action + clear reason]

🔧 BEST PRACTICE NOTE
  [current industry standard for what was just built — cited]

📦 DEPLOYMENT READINESS
  Docker [✅/❌] | Helm [✅/❌] | k8s [✅/❌] | Cloud [✅/❌] | CI/CD [✅/❌]

🌍 TREND ALERT
  [if a newer/better approach exists for what was just built — cited;
   else "No significant newer approach; current stack is best-in-class."]

➡️  NEXT PHASE PLAN
  Phase [N+1]: [what happens, which skills fire]
═══════════════════════════════════════════════
```

## Best-practice & trend sourcing
- Verify "best practice" and "trend alert" with live WebSearch (min 2 sources), cited per AOP Phase 3.
- Map recommendation to project type using the deployment decision tree in the plugin CLAUDE.md.
- Never assert a trend without a source and a date.

## After the report
1. Append report to `reports/[project]/phase-[N]-advisor.md`.
2. Trigger `github-pages-publisher` to publish the phase walkthrough.
3. Trigger `git-update-tracker` to commit + update tracking.
4. Wait for human go/no-go before starting the next phase (AOP approval gate).

## Standing Rules
- Every phase ends with this report. No silent phase transitions.
- "Best practice" and "trend alert" must be freshly researched and cited, not recalled.
- See [[orchestrator-master]], [[github-pages-publisher]], [[git-update-tracker]], [[ship-gate]].
