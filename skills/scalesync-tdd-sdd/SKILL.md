---
name: scalesync-tdd-sdd
description: |
  ScaleSync's thin wrapper enforcing Test-Driven Development (TDD) and Sub-Agent-Driven Development
  (SDD) conventions on top of the superpowers skills. Use during every development phase to ensure
  tests are written first, run INSIDE Docker, and that independent tasks are dispatched to sub-agents.
  Triggers: start of any coding phase, "write the feature", "implement", "build the API/UI",
  "run in parallel", before any production code is written.
disable-model-invocation: false
allowed-tools: Read, Write, Edit, Bash, Agent
context: fork
---

# ScaleSync TDD + SDD Wrapper

Binds ScaleSync's Docker-first, multi-agent conventions to the underlying superpowers discipline skills. This is the "how we build" enforcement layer.

## Depends on (delegate to these)
- `sp-test-driven-development` — the RED→GREEN→REFACTOR discipline
- `sp-subagent-driven-development` — dispatch independent tasks to sub-agents
- `sp-writing-plans` / `sp-executing-plans` — plan then execute
- `sp-using-git-worktrees` — isolate parallel work

## TDD Convention (ScaleSync-specific)
1. **Tests first, always.** No production code before a failing test (RED).
2. **Tests run INSIDE Docker**, not on host:
   ```bash
   ./run.sh test          # runs pytest/jest inside the app container
   docker compose run --rm backend pytest
   ```
   Rationale: parity with deployed environment; "works on my machine" is banned.
3. **GREEN** — minimal code to pass.
4. **REFACTOR** — clean up, tests stay green.
5. **Coverage gate** — phase cannot pass `ship-gate` below the project's coverage threshold (default 80%).
6. **CI runs the same Docker test target** — local and CI are identical.

## SDD Convention (ScaleSync-specific)
1. Decompose the phase plan (from `delivery-manager` / `sp-writing-plans`) into independent tasks.
2. Dispatch independent tasks to sub-agents via the Agent tool — tag each with the project slug so outputs land in the right project folder (see `multi-project-orchestrator`).
3. Each sub-agent follows TDD within its task.
4. Use `sp-using-git-worktrees` so parallel sub-agents don't collide on the same working tree.
5. Re-integrate: collect sub-agent results, run full Docker test suite, then `code-reviewer` + `adversarial-reviewer`.

## Phase build loop (applies in Phases 2–4)
```
plan (sp-writing-plans)
  → decompose into independent tasks
    → for each task, dispatch sub-agent (sp-subagent-driven-development):
        RED (failing test in Docker)
        GREEN (minimal code)
        REFACTOR
    → integrate
  → full suite in Docker (./run.sh test)
  → code-reviewer + adversarial-reviewer
  → ship-gate
  → phase-advisor
```

## Standing Rules
- No production code without a failing test first. No exceptions.
- Tests execute in containers, never bare host.
- Independent work goes to sub-agents; the main thread orchestrates and integrates.
- See [[sp-test-driven-development]], [[sp-subagent-driven-development]], [[sp-using-git-worktrees]], [[ship-gate]], [[code-reviewer]], [[adversarial-reviewer]].
