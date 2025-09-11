# Tina Flutter Monorepo - Agent Guidelines

## Project Overview
Flutter monorepo for Tina AI Assistant using Melos for package management.
Main app: `apps/tina_shell/` | Packages: `packages/*/`

## Essential Commands

### Melos Commands
```bash
melos bootstrap              # Install dependencies & link packages
melos clean                  # Clean all packages
melos list                   # List all packages
melos exec -- <command>     # Run command in all packages
```

### Dependency Management
**IMPORTANT**: Always use these commands instead of manually editing pubspec.yaml files.

```bash
# Add runtime dependencies
flutter pub add package_name

# Add development dependencies  
flutter pub add dev:package_name

# Add dependencies with version constraints
flutter pub add package_name:^1.0.0

# Examples:
flutter pub add flutter_bloc dio flutter_markdown equatable
flutter pub add dev:build_runner dev:json_serializable
```

### Quality & Testing
```bash
melos run analyze            # Analyze code quality
melos run format             # Check code formatting
melos run test               # Run all tests
melos run validate:quick     # Quick development check
melos run validate           # Full CI validation
```

### Development
```bash
cd apps/tina_shell && flutter run    # Run main app
flutter test path/to/test.dart       # Run specific test
```

## Agent Protocol

### Before Implementation
```bash
melos bootstrap              # Ensure dependencies
melos run analyze           # Check current state
```

### During Implementation
```bash
# Add dependencies using flutter pub add (not manual editing)
cd apps/tina_app && flutter pub add package_name

# Test specific package changes
melos exec --scope="package_name" -- flutter test

# Verify no regressions
melos run validate:quick
```

### After Implementation
```bash
melos run validate          # Must pass completely
cd apps/tina_shell && flutter run    # Manual verification
```

## Package Architecture
```
packages/
├── core/                   # Core business logic
├── domain/                 # Domain models  
├── application/            # Application services
├── infrastructure/         # External adapters
├── features/               # Feature implementations
└── ui/                     # UI components
```

### Dependency Rules
- Core packages: No external dependencies
- Domain: Pure Dart, no Flutter
- Infrastructure: Implements domain interfaces
- Features: Can depend on all layers
- No circular dependencies

## Testing Requirements
- Minimum 80% coverage for new code
- All tests must pass before merge
- Use `const` constructors where possible
- Follow BLoC pattern for state management

## Design System
Reference `design-system.json` for:
- Colors: Use design tokens, not hardcoded values
- Typography: Inter font family with defined scales
- Spacing: Use scale multipliers (xs: 0.25rem to 3xl: 4rem)
- Borders: Use radius tokens (sm: 0.125rem to xl: 1rem)

## Common Issues
- Import errors: `melos bootstrap`
- Generated files outdated: `melos run generate`
- Build failures: `melos clean && melos bootstrap`
- Test failures: Check mock setups

## Quality Gates
All must pass:
- ✅ `melos run validate` passes
- ✅ Tests have >80% coverage
- ✅ Design system compliance
- ✅ No analyzer warnings
- ✅ App builds and runs

For detailed architecture and patterns, see `docs/monorepo-architecture-guide.md`.
