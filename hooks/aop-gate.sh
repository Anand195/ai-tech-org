#!/usr/bin/env bash
# ScaleSync AOP auto-fire hook.
# Injects the Agent Operating Protocol gate reminder so AOP enforcement is automatic,
# not dependent on the model remembering to invoke aop-enforcer.
# Mode: "session" (SessionStart) | "prompt" (UserPromptSubmit).
set -euo pipefail
MODE="${1:-prompt}"

if [ "$MODE" = "session" ]; then
  cat <<'EOF'
SCALESYNC AOP ACTIVE — Agent Operating Protocol governs every task this session.
Before any execution: (0) Understanding Contract approved, (3) research cited 2-3 sources,
(4) Task Brief approved, (5) stop+report on any blocker, (7) changelog, (8) MD+PDF report.
Docker-first by default. TDD: tests-first-in-Docker. SDD: dispatch independent tasks to sub-agents.
Invoke skill `aop-enforcer` to gate the task and `phase-advisor` to close each phase.
EOF
else
  echo "AOP gate: confirm Understanding Contract + approval gate before any execution/commit/deploy. Cite sources. Tests-first-in-Docker."
fi
exit 0
