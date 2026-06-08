---
description: Validate an idea — real market research + product-market-fit verdict (GO/NO-GO)
argument-hint: [project-slug]
allowed-tools: Read, Write, Edit, WebSearch, WebFetch, Bash, Agent, Skill
---

# /scalesync:validate

Run market-fit validation for a project before any build spend.

Project: **$ARGUMENTS**

Steps:
1. Read `projects/$ARGUMENTS/INTAKE.md`.
2. Invoke skill `market-fit-analyzer`.
3. It delegates to: market-researcher, competitive-intel, competitive-teardown, product-discovery, product-strategist, tech-stack-evaluator, financial-analyst, risk-analyst.
4. Produce Market-Fit Report (MD + PDF) with PMF scorecard + verdict (STRONG GO / CONDITIONAL / PIVOT / NO-GO).
5. Every claim cited (AOP Phase 3, min 2–3 sources).
6. Present verdict; await human green signal before `/scalesync:build`.
