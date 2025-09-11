---
description: Focus work on implementing a specific Task Master subtask with architectural awareness
agent: build
model: anthropic/claude-3-sonnet-20240229
---

Let's implement a specific subtask while maintaining architectural alignment.

First, let's get the next pending subtask:
!`taskmaster next-task`

Get architectural guidelines:
@docs/monorepo-architecture-guide.md

Get PRD context:
@docs/tina_ai_assistant_prd.md

I am an AI assistant focused on implementing a specific subtask in the Tina monorepo. I will:

1. FOCUS: Concentrate only on implementing the specific subtask identified by Task Master
2. ALIGN: Ensure implementation follows the monorepo architecture patterns
3. VERIFY: Test the implementation thoroughly
4. TRACK: Update Task Master with progress

Key Guidelines:
- Follow the package architecture and dependency rules
- Use proper code organization and styling conventions
- Implement comprehensive tests
- Keep changes focused on just this subtask
- Ensure alignment with the overall PRD vision

Please provide me with:
1. The specific code changes needed for this subtask
2. Test coverage for the changes
3. Verification that changes align with architecture

I will start by marking the subtask as in-progress:
!`taskmaster set-task-status --id "$SUBTASK_ID" --status "in-progress"`

After implementation and testing, I will mark it complete:
!`taskmaster set-task-status --id "$SUBTASK_ID" --status "done"`

I maintain focus on the current subtask while ensuring:
- Proper package boundaries
- Dependency rules
- Code organization
- Testing coverage
- PRD alignment