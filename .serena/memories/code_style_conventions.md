# Tina AI Assistant - Code Style & Conventions

## Naming Conventions
- **Files**: snake_case (e.g., `chat_screen.dart`, `workspace_repository.dart`)
- **Classes**: PascalCase (e.g., `ChatScreen`, `WorkspaceRepository`)
- **Variables/Methods**: camelCase (e.g., `userName`, `fetchWorkspaces()`)
- **Constants**: UPPER_SNAKE_CASE (e.g., `API_BASE_URL`, `DEFAULT_TIMEOUT`)
- **Private members**: prefix with underscore (e.g., `_privateMethod`, `_internalState`)

## Code Organization
- **Layered Architecture**: Clear separation between presentation, application, domain, and infrastructure layers
- **Feature-based structure**: Group related functionality together
- **Barrel exports**: Use `export` statements to simplify imports
- **Constants**: Centralize in dedicated files or classes

## Dart/Flutter Specific
- **Use `const` constructors**: Prefer const for performance
- **Prefer final over var**: Immutable where possible
- **Type annotations**: Always specify return types and parameter types
- **Documentation**: Use dartdoc comments (`///`) for public APIs
- **Null safety**: Leverage null safety features appropriately

## BLoC Pattern
- **Events**: Suffix with `Event` (e.g., `WorkspaceLoadedEvent`)
- **States**: Suffix with `State` (e.g., `WorkspaceLoadedState`)
- **BLoCs**: Suffix with `Bloc` (e.g., `WorkspaceBloc`)
- **Repositories**: Suffix with `Repository` (e.g., `WorkspaceRepository`)

## Import Organization
- **Package imports first**: `import 'package:...'`
- **Relative imports next**: `import '../...'`
- **External imports last**: `import 'dart:...'`
- **Use barrel exports**: Reduce import complexity

## Error Handling
- **Custom exceptions**: Create specific exception types
- **Result types**: Use Result<T, Error> pattern where appropriate
- **Graceful degradation**: Handle errors gracefully in UI
- **Logging**: Include context in error messages

## Testing
- **Test files**: `*_test.dart` suffix
- **Test structure**: Arrange-Act-Assert pattern
- **Mock dependencies**: Use mockito or similar
- **Descriptive names**: Test should read like documentation

## File Structure Patterns
```
feature/
├── data/
│   ├── models/
│   ├── repositories/
│   └── datasources/
├── domain/
│   ├── entities/
│   ├── repositories/
│   └── usecases/
├── presentation/
│   ├── bloc/
│   ├── screens/
│   └── widgets/
└── tests/
    ├── unit/
    ├── widget/
    └── integration/
```

## Documentation
- **Public APIs**: Always document with dartdoc
- **Complex logic**: Explain non-obvious implementations
- **Architecture decisions**: Document in relevant files
- **README files**: For packages and major components