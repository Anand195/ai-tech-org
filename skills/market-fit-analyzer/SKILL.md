---
name: market-fit-analyzer
description: |
  Real market research + product-market-fit (PMF) check + go/no-go report for any new idea.
  Use AFTER scalesync-intake and BEFORE any build. Conducts genuine market research using web
  search and Docker MCP research tools, runs a structured PMF scorecard, and produces a
  decision-grade report. Triggers: "is there a market for this", "market fit", "validate idea",
  "market research", "should we build this", "TAM SAM SOM", "competitive landscape".
disable-model-invocation: false
allowed-tools: Read, Write, Edit, WebSearch, WebFetch, Bash, Agent
context: fork
---

# Market-Fit Analyzer

End-to-end idea validation: real market research, competitive landscape, and a product-market-fit verdict that gates whether ScaleSync invests build effort.

## When to Use
- After `scalesync-intake` produces `INTAKE.md`.
- Before `requirements-analyst` / `orchestrator-master`.

## Orchestration — this skill delegates
Market-fit-analyzer is a composite. It invokes (as sub-agents or in sequence):
1. `market-researcher` — market size, trends, technology landscape
2. `competitive-intel` (c-level) — deep competitor strategy intelligence
3. `competitive-teardown` (product) — feature/UX teardown of top 3–5 competitors
4. `product-discovery` (product) — problem/solution validation
5. `product-strategist` (product) — positioning + differentiation
6. `tech-stack-evaluator` (engineering) — feasibility + build-cost signal
7. `financial-analyst` (finance) — rough TAM→revenue model + build cost
8. `risk-analyst` (ours) — market/regulatory/timing risk

Run research with REAL sources. Every claim cited inline per AOP Phase 3 (min 2–3 independent sources).

## PMF Scorecard (score each 1–5, weight applied)

| Dimension | Weight | What to assess |
|-----------|--------|----------------|
| Problem severity | 20% | Is the pain real, frequent, expensive? |
| Market size (TAM/SAM/SOM) | 15% | Big enough to matter? Growing? |
| Competitive whitespace | 15% | Is there room? Differentiation defensible? |
| Willingness to pay | 15% | Evidence buyers pay for this? |
| Timing ("why now") | 10% | Tailwind or headwind? |
| Build feasibility | 10% | Can ScaleSync build it well? |
| Distribution/GTM | 10% | Can we reach buyers affordably? |
| Regulatory/risk | 5% | Compliance blockers? |

**Verdict bands** (weighted total /5):
- ≥ 4.0 → **STRONG GO** — proceed to full build
- 3.0–3.9 → **CONDITIONAL GO** — proceed after addressing named gaps
- 2.0–2.9 → **PIVOT** — reshape idea, re-run analyzer
- < 2.0 → **NO-GO** — park or reject

## Deliverable — Market-Fit Report
Write `reports/[project]/[DD-MM-YYYY]_market-fit.md` (and PDF per AOP Phase 8):

```markdown
# Market-Fit Report — [Project]
**Date:** ... | **Verdict:** STRONG GO / CONDITIONAL GO / PIVOT / NO-GO | **Score:** X.X/5

## Executive Summary
[3 sentences: opportunity, fit, recommendation]

## Market Research
- TAM / SAM / SOM (with sources)
- Trends & "why now" (cited)
- Technology landscape

## Competitive Landscape
| Competitor | Positioning | Strength | Weakness | Our edge |
|-----------|-------------|----------|----------|----------|

## PMF Scorecard
[table with scores + weighted total]

## Differentiation & Positioning
[how ScaleSync's build wins]

## Financial Signal
- Rough TAM→revenue model
- Est. build cost (Docker-first) + hosting cost
- Payback signal

## Risks
[from risk-analyst — market, regulatory, timing]

## Recommendation
[verdict + named conditions if conditional + next step]

## References
| # | Type | Title | URL | Date |
```

## Hand off
- STRONG/CONDITIONAL GO → present to human for green signal → `orchestrator-master`
- PIVOT → re-run `scalesync-intake` with reshaped idea
- NO-GO → document and park

## Standing Rules
- Real research only. No fabricated market numbers. Cite everything (AOP Phase 3).
- The verdict is a recommendation; the human gives the final green signal.
- See [[scalesync-intake]], [[orchestrator-master]], [[phase-advisor]].
