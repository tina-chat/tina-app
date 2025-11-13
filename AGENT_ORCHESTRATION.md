# AuraVibes Agent Orchestration System

## Overview

This document describes the comprehensive agentic orchestration system implemented for the AuraVibes AI Assistant Flutter monorepo. The system consists of 12 specialized agents working in harmony to deliver high-quality development outcomes.

## Agent Architecture

### Primary Agent (1)
- **🎯 Orchestrator**: Master coordinator that manages the entire development lifecycle

### Research Agents (3)
- **🌐 Online Researcher**: Researches external documentation, APIs, and best practices
- **📚 Documentation Researcher**: Analyzes project documentation in docs/ folder
- **🔍 Code Researcher**: Researches existing code patterns and implementations

### Solution Thinking Agents (2)
- **💡 Solution Brainstormer**: Generates 6 creative solution approaches for any problem
- **🧠 Solution Decision Maker**: Spawns brainstormers 6 times and selects optimal solution

### Builder Agents (4)
- **📦 Package Builder**: Specialized for Melos package management and dependencies
- **📱 AuraVibes App Builder**: Specialized for apps/auravibes_app Flutter development
- **🎨 Widget Builder**: Specialized for general Flutter widget development
- **🎭 AuraVibes UI Builder**: Specialized for packages/auravibes_ui design system components

### Quality Agents (2)
- **👀 Reviewer**: Reviews code for best practices and potential issues
- **🧪 Tester**: Implements comprehensive testing strategies

## Workflow Process

### 1. Problem Analysis Phase
The Orchestrator analyzes the problem and determines what information is needed.

### 2. Research Phase
Research agents work in parallel to gather information:
- Online Researcher: External knowledge and best practices
- Documentation Researcher: Project context and requirements
- Code Researcher: Existing patterns and implementations

### 3. Solution Thinking Phase
For complex problems:
- Solution Decision Maker spawns Solution Brainstormer 6 times
- Each brainstormer generates 6 different approaches (36 total)
- Decision Maker analyzes and selects the optimal solution

### 4. Planning Phase
Based on research and selected solution, the Orchestrator creates an implementation plan.

### 5. Build Phase
Specialized builders implement the solution:
- Package Builder: For package-related work
- AuraVibes App Builder: For app-specific features
- Widget Builder: For general Flutter widgets
- AuraVibes UI Builder: For design system components

### 6. Quality Phase
Quality agents ensure excellence:
- Reviewer: Code review and best practices
- Tester: Comprehensive testing implementation

### 7. Integration Phase
Final validation and integration testing.

## Agent Characteristics

### Zero Business Knowledge
All agents (except the Orchestrator) have zero prior knowledge of the AuraVibes project. They learn from:
- Research agents gather context from documentation and code
- Builders follow established patterns they discover
- Quality agents enforce general best practices

### Research-Driven Approach
Agents always research before acting:
- Documentation Researcher reads docs/ to understand requirements
- Code Researcher analyzes existing implementations
- Online Researcher brings external best practices

### Specialized Expertise
Each agent has deep expertise in their domain:
- Package Builder: Melos and monorepo management
- AuraVibes App Builder: Flutter application development
- Widget Builder: Reusable widget creation
- AuraVibes UI Builder: Design system and atomic design

### Proper Tool Permissions
Each agent has only the tools they need:
- Research agents: Read-only access
- Builders: Full development tools
- Quality agents: Review and testing tools
- Solution thinkers: Minimal tools for pure thinking

## Usage Examples

### Complex Feature Implementation
```
User: "Implement real-time collaboration features"

Orchestrator: 
→ @documentation-researcher "Analyze docs for collaboration requirements"
→ @code-researcher "Find existing real-time patterns"
→ @online-researcher "Research real-time collaboration best practices"
→ @solution-decision-maker "Analyze approaches for real-time collaboration"
→ @package-builder "Create real-time package"
→ @auravibes-app-builder "Implement collaboration UI"
→ @reviewer "Review implementation"
→ @tester "Add comprehensive tests"
```

### Simple Widget Creation
```
User: "Create a reusable chart widget"

Orchestrator:
→ @code-researcher "Find existing chart patterns"
→ @widget-builder "Create reusable chart widget"
→ @reviewer "Review widget implementation"
→ @tester "Add widget tests"
```

### Package Management
```
User: "Add a new authentication package"

Orchestrator:
→ @package-builder "Create auth package structure"
→ @documentation-researcher "Understand auth requirements"
→ @reviewer "Review package design"
→ @tester "Add package tests"
```

## Configuration

The system is configured in `opencode.json` with:
- Environment variable support for models
- Individual prompt files in `prompts/` directory
- Appropriate tool permissions for each agent
- Temperature settings optimized for each agent's purpose

## Benefits

### 1. Comprehensive Coverage
All aspects of development are covered by specialized agents.

### 2. Quality Assurance
Multiple quality checks ensure robust implementations.

### 3. Scalability
The system can handle projects of any complexity.

### 4. Adaptability
Agents learn the project context rather than having hardcoded knowledge.

### 5. Efficiency
Parallel research and specialized execution speed up development.

## File Structure

```
prompts/
├── orchestrator.txt              # Master coordination
├── online-researcher.txt         # External research
├── documentation-researcher.txt  # Docs analysis
├── code-researcher.txt          # Code pattern analysis
├── solution-brainstormer.txt    # Creative idea generation
├── solution-decision-maker.txt  # Solution analysis and selection
├── package-builder.txt          # Melos/package management
├── auravibes-app-builder.txt         # App development
├── widget-builder.txt           # General widgets
├── auravibes-ui-builder.txt          # Design system
├── reviewer.txt                 # Code review
└── tester.txt                   # Testing implementation
```

## Getting Started

1. **Primary Agent**: Start with the Orchestrator for any development task
2. **Direct Invocation**: Use `@agent-name` to invoke specific agents
3. **Research First**: Let research agents gather context before building
4. **Quality Always**: Always include review and testing phases

The Orchestrator will automatically coordinate the appropriate agents based on your needs, ensuring comprehensive and high-quality development outcomes.