---
description: Work on next sub task from Task Master subtask with validation
agent: flutter-ui-developer
model: anthropic/claude-sonnet-4-20250514
---

# Subtask Implementation Workflow

## 1. Get Next Subtask
!`task-master-ai_next_task"`

## 2. Current Status Check
!`melos bootstrap`
!`melos run analyze`

## 3. Context Loading
@docs/monorepo-architecture-guide.md
@docs/tina_ai_assistant_prd.md
@AGENTS.md

## Implementation Focus

I will implement the identified subtask following these steps:

### Pre-Implementation
- Mark subtask as in-progress in Task Master
- Verify current build status
- Check package dependencies
- Check existing code for related functionality

### Implementation
- Focus only on the specific subtask requirements
- Follow Flutter/Dart best practices
- Maintain package boundaries
- When Working with widgets design, Use design system from design-system.json

### Validation
- Run package-specific tests
- Verify no regressions: `melos run validate:quick`
- Test app functionality manually, ask user for validation

### Completion
- Update Task Master status to "done"
- Document any architectural decisions
- Prepare for next subtask

## Key Commands
- Next task: `task-master-ai_next_task`
- Set status: `task-master-ai_set_task_status --id="X.Y" --status="in-progress"`
- Quick validation: `melos run validate:quick`
- Full validation: `melos run validate`

Ready to implement the identified subtask with focus and quality.
