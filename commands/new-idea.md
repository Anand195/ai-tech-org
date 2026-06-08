---
description: Start a new ScaleSync idea — runs structured intake (step 0 of the pipeline)
argument-hint: [idea one-liner]
allowed-tools: Read, Write, Edit, AskUserQuestion, Skill
---

# /scalesync:new-idea

Front door for any new idea. Invoke the `scalesync-intake` skill to capture the idea into a structured `INTAKE.md` and scaffold the project workspace.

Idea (if provided): **$ARGUMENTS**

Steps:
1. Invoke skill `scalesync-intake`.
2. Ask all intake questions at once (AOP Phase 0).
3. Write `projects/[slug]/INTAKE.md` + workspace skeleton.
4. Recommend `/scalesync:validate` as the next step.

Do NOT begin research or build here — intake only.
