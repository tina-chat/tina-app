---
description: Work on next sub task from Task Master subtask with validation
agent: flutter-ui-developer
model: anthropic/claude-sonnet-4-20250514
---

# Single Subtask Implementation Workflow

## 1. Identify Next Available Subtask
!`task-master-ai_next_task"`

## 1.1 Select Specific Subtask
Based on the task returned above, I will:
- Identify the FIRST available pending subtask (e.g., if task 1 has subtasks 1.1, 1.2, 1.3, select only 1.1 if it's pending)
- Focus ONLY on that single subtask ID (e.g., "1.1")
- Ignore all other subtasks in the same task
- If no pending subtasks exist, stop and report completion

**IMPORTANT**: I will work on exactly ONE subtask at a time. Not the entire task, not multiple subtasks - just one specific subtask.

## 2. Pre-Implementation Validation
- Confirm the selected subtask ID and its requirements
- Mark ONLY that specific subtask as in-progress: !`task-master-ai_set_task_status --id="X.Y" --status="in-progress"`
- Run status check: !`melos bootstrap && melos run analyze`

## 3. Context Loading
@docs/monorepo-architecture-guide.md
@docs/tina_ai_assistant_prd.md
@AGENTS.md
@design-system.json

## 4. Focused Implementation

### Scope Control
- Work ONLY on the selected subtask (e.g., if subtask is "1.1", don't touch 1.2, 1.3, etc.)
- Read the specific subtask requirements carefully
- Implement ONLY what that subtask requires
- Do not implement features from other subtasks

### Implementation Guidelines
- Follow Flutter/Dart best practices
- Maintain package boundaries
- Use design system tokens from design-system.json for UI work
- Keep changes minimal and focused on the subtask

### Validation
- Run package-specific tests for affected packages
- Verify no regressions: !`melos run validate:quick`
- Confirm the subtask requirements are met
- Ask user for validation if needed

## 5. Subtask Completion
- Update ONLY the completed subtask status: !`task-master-ai_set_task_status --id="X.Y" --status="done"`
- Document any important decisions made
- Stop - do not automatically continue to the next subtask

## Key Commands Reference
- Get next task: `task-master-ai_next_task`
- Set specific subtask status: `task-master-ai_set_task_status --id="X.Y" --status="in-progress|done"`
- Quick validation: `melos run validate:quick`
- Full validation: `melos run validate`

## Workflow Summary
1. Get next task → Select ONE pending subtask → Work on that subtask ONLY
2. Complete the subtask → Mark it done → Stop
3. Do NOT automatically continue to other subtasks

Ready to implement a SINGLE identified subtask with precision and focus.
