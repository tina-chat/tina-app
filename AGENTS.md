# Tina Flutter Monorepo - Agent Guidelines

## Project Overview
Flutter monorepo for Tina AI Assistant using Dart workspaces and Melos for package management.
Main app: `apps/tina_app/` | Packages: `packages/*/` | Tools: Flutter 3.9+, Melos 7.1+

## Quick Commands (from root unless specified)

### Melos Monorepo Commands
```bash
melos bootstrap              # Install deps & link packages
melos clean                  # Clean all packages
melos exec -- <command>      # Run command in all packages
melos run generate           # Run build_runner for code generation
melos list                   # List all packages
melos exec -c 1 -- flutter test  # Run tests concurrently
```

### Development Commands
```bash
# Run app (from apps/tina_app/)
flutter run

# Testing
melos run test                   # All package tests
flutter test test/specific_test.dart          # Single test file
flutter test --name "test description"        # Test by name pattern
melos exec --scope="*core*" -- flutter test   # Test specific packages

# Code Quality
melos run analyze                 # Analyze all packages
melos exec -- dart format . --set-exit-if-changed  # Check formatting
dart fix --apply                              # Apply automatic fixes
```

## Package Architecture
```
packages/
├── tina_core/           # Core business logic & entities
├── tina_providers/      # State management providers
├── tina_ui_core/        # Reusable UI components
├── tina_design_system/  # Design tokens & theming
├── infrastructure/      # External service integrations
├── features/            # Feature modules
└── shared/              # Shared utilities
```

### Package Dependencies Rules
- Core packages: No external dependencies, pure Dart
- UI packages: Can depend on Flutter & core packages
- Feature packages: Can depend on core, UI, providers
- Infrastructure: Implements core interfaces
- Never: Circular dependencies between packages

## Code Style & Conventions

### Imports Organization
```dart
// 1. Dart SDK imports
import 'dart:async';

// 2. Flutter imports
import 'package:flutter/material.dart';

// 3. External packages
import 'package:provider/provider.dart';

// 4. Internal packages (monorepo)
import 'package:tina_core/tina_core.dart';

// 5. Relative imports
import '../widgets/chat_bubble.dart';
```

### Flutter Best Practices
- Use `const` constructors: `const MyWidget()`
- Prefer composition: Extract widgets over inheritance
- State management: Provider pattern (already configured)
- Keys: Use `super.key` in constructors
- Dispose: Always dispose controllers, streams, animations

### Error Handling Pattern
```dart
try {
  final result = await operation();
  return Success(result);
} on NetworkException catch (e, stack) {
  logger.e('Network error', error: e, stackTrace: stack);
  return Failure(NetworkError(e.message));
} catch (e, stack) {
  logger.e('Unexpected error', error: e, stackTrace: stack);
  return Failure(UnexpectedError());
}
```

## Testing Guidelines
- Write tests before implementation (TDD preferred)
- Test file naming: `<name>_test.dart`
- Use `flutter_test` package assertions
- Mock dependencies with `tina_mocks` package
- Golden tests for UI: `flutter test --update-goldens`

## Workflow Patterns

### Adding New Feature
1. Create feature package: `packages/features/new_feature/`
2. Define interfaces in `tina_core`
3. Implement UI in feature package
4. Add to main app dependencies
5. Run `melos bootstrap`
6. Generate code: `melos run generate`

### Modifying Existing Package
1. Make changes in package
2. Run `melos bootstrap` if deps changed
3. Test: `melos exec --scope="package_name" -- flutter test`
4. Verify app: `cd apps/tina_app && flutter run`

## Common Issues & Solutions
- **Import not found**: Run `melos bootstrap`
- **Generated files outdated**: Run `melos run generate`
- **Version conflicts**: Check workspace resolution in pubspec.yaml
- **Clean rebuild**: `melos clean && melos bootstrap`

## AI Agent Specific Notes
- Always run `melos bootstrap` after dependency changes
- Use `melos exec` for package-wide operations
- Check existing packages before creating new ones
- Follow package dependency rules strictly
- Run tests after changes to verify integrity