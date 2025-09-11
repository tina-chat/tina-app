# Tina Core

Core utilities, constants, and base classes for the Tina AI Assistant.

## Overview

This package provides the foundational elements used throughout the Tina AI Assistant application. It follows the Clean Architecture principles and contains no external dependencies, making it a pure Dart package.

## Features

### Result Type
A functional approach to error handling that avoids throwing exceptions:

```dart
import 'package:tina_core/tina_core.dart';

Result<String> processData(String input) {
  if (input.isEmpty) {
    return const Failure(ValidationFailure('Input cannot be empty'));
  }
  return Success(input.toUpperCase());
}

// Usage
final result = processData('hello');
result.fold(
  (failure) => print('Error: ${failure.message}'),
  (value) => print('Success: $value'),
);
```

### Use Case Base Classes
Standard interfaces for implementing business logic:

```dart
class GetUserUseCase implements UseCase<User, String> {
  @override
  Future<Result<User>> execute(String userId) async {
    // Implementation
  }
}
```

### Extensions
Useful extensions for common operations:

```dart
// String extensions
'hello world'.capitalize; // 'Hello world'
'hello_world'.toCamelCase; // 'helloWorld'
''.isNullOrEmpty; // true

// DateTime extensions
DateTime.now().isToday; // true
DateTime.now().timeAgo; // 'Just now'
DateTime.now().friendlyFormat; // 'Today'
```

### Constants
Application-wide constants and error codes:

```dart
AppConstants.appName; // 'Tina AI Assistant'
AppConstants.defaultTimeout; // Duration(seconds: 30)
ErrorCodes.networkTimeout; // 'NETWORK_TIMEOUT'
```

### Utilities
Helper classes for common tasks:

```dart
// UUID generation
UuidGenerator.generate(); // 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'
UuidGenerator.generateShort(); // 'xxxxxxxx'
```

## Architecture

This package follows Clean Architecture principles:

- **No external dependencies**: Pure Dart package
- **Domain-centric**: Focuses on business concepts
- **Framework-independent**: Can be used in any Dart project
- **Testable**: All components are easily testable

## Dependencies

This package has no external dependencies to maintain its role as a core foundation package.

## Usage

Add this package to your `pubspec.yaml`:

```yaml
dependencies:
  tina_core:
    path: ../core/tina_core
```

Then import and use:

```dart
import 'package:tina_core/tina_core.dart';
```

## Testing

Run tests with:

```bash
dart test
```

## Contributing

This package should remain dependency-free and focused on core utilities that are used across the entire application.
