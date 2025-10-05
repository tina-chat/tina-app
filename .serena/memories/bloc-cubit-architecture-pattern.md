# BLoC/Cubit Architecture Pattern for Tina App

## Core Principle
Every feature in the Tina app will use BLoC/Cubit for state management, not general state management solutions.

## Scope
- **Feature-specific**: Each screen/feature gets its own dedicated BLoC/Cubit
- **Not general**: Avoid global or general-purpose state management
- **Screen-level granularity**: Each major screen or feature module should have its own state management

## Implementation Guidelines
1. **One BLoC/Cubit per feature**: Each distinct feature (chat, agents, settings, etc.) gets its own BLoC/Cubit
2. **Feature isolation**: State is contained within the feature scope
3. **Screen-specific state**: State management is tied to specific screens or user flows
4. **No shared global state**: Avoid creating general-purpose BLoCs that manage multiple unrelated features

## Examples
- ChatScreen → ChatBloc/Cubit
- AgentsScreen → AgentsBloc/Cubit  
- SettingsScreen → SettingsBloc/Cubit
- BackendManagementScreen → BackendManagementBloc/Cubit

## Benefits
- Clear separation of concerns
- Easier testing and debugging
- Better state isolation
- More maintainable codebase
- Follows Flutter best practices

## Rationale
This pattern ensures that state management is predictable, testable, and follows the single responsibility principle. Each feature's state is self-contained and doesn't interfere with other parts of the application.