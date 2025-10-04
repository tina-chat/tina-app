# Tina Flutter Monorepo - Agent Guidelines

## Project Overview
Flutter monorepo for Tina AI Assistant using Melos for package management.
Main app: `apps/tina_shell/` | Legacy app: `apps/tina_app/` | Packages: `packages/*/`

**Note**: `apps/tina_shell/` is the main application following the architecture guide.

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
fvm flutter pub add package_name

# Add development dependencies  
fvm flutter pub add dev:package_name

# Add dependencies with version constraints
fvm flutter pub add package_name:^1.0.0

# Examples:
fvm flutter pub add flutter_bloc dio flutter_markdown equatable
fvm flutter pub add dev:build_runner dev:json_serializable
```

### Quality & Testing
```bash
melos run analyze            # Analyze code quality
melos run format             # Check code formatting
melos run test               # Run all tests
melos run validate:quick     # Quick development check
melos run validate           # Full CI validation
```

### Package Creation
**CRITICAL**: New packages are automatically discovered but must be created in the correct location.

```bash
# Create pure Dart packages (domain/core layers - no Flutter dependencies)
fvm dart create --template=package packages/domain/chat_domain
fvm dart create --template=package packages/core/tina_contracts

# Create Flutter packages (features/presentation - with Flutter dependencies)
fvm flutter create --template=package packages/features/chat
fvm flutter create --template=package packages/presentation/design_system

# After creating any package, ALWAYS run bootstrap
melos bootstrap                      # Links all packages and installs dependencies
melos list                          # Verify new package is discovered
```

**Package Creation Workflow:**
1. **Create Package**: Use appropriate template (`dart create` vs `flutter create`)
2. **Add Workspace Resolution**: Add `resolution: workspace` to package's pubspec.yaml
3. **Update Root Workspace**: Add package path to root pubspec.yaml workspace list
4. **Bootstrap**: Run `melos bootstrap` to link dependencies across workspace
5. **Validate**: Use `melos list` and `melos run analyze` to verify setup

**Important Notes:**
- All workspace packages must include `resolution: workspace` in their pubspec.yaml
- SDK constraint should be `^3.9.0` or higher for workspace support
- Watch for dependency conflicts between packages - use compatible versions
- Test dependencies in isolated packages may conflict with app dependencies

### Development
```bash
cd apps/tina_shell && flutter run    # Run main app
fvm flutter test path/to/test.dart       # Run specific test
```

## Workspace Management

### Package Discovery
Melos automatically discovers packages listed in the root `pubspec.yaml` workspace configuration:

```yaml
# Root pubspec.yaml
workspace:
  packages:
    - apps/*
    - packages/core/*
    - packages/domain/*
    - packages/application/*
    - packages/infrastructure/**/*
    - packages/presentation/*
    - packages/features/*
```

### Package Registration Process
1. **Create Package**: Use `dart create --template=package` for pure Dart packages
2. **Workspace Auto-Discovery**: New packages are automatically discovered by existing workspace patterns
3. **Bootstrap**: Run `melos bootstrap` to install dependencies and link packages
4. **Verify**: Use `melos list` to confirm package is discovered and linked

**Note**: The workspace patterns in `pubspec.yaml` cover all standard package locations:
- `apps/tina_shell` - Main application shell (follows architecture guide)
- `apps/tina_app` - Legacy application (being migrated)
- `packages/core/*` - Core utilities (tina_core, tina_contracts, etc.)
- `packages/domain/*` - Domain logic (pure Dart, no Flutter)
- `packages/application/*` - Use cases and application services
- `packages/infrastructure/**/*` - External integrations (supports nested structure)
- `packages/presentation/*` - Shared UI components and design system
- `packages/features/*` - Feature modules (chat, backend_management, etc.)

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

## Current Workspace Status

### ✅ **Configured Packages:**
- `tina_app` - Legacy Flutter application (being migrated)
- `tina_core` - Core utilities package (COMPLETED)

### 📋 **Package Creation Example:**
```bash
# Create new domain package
fvm dart create --template=package packages/domain/chat_domain
cd packages/domain/chat_domain

# Add workspace resolution to pubspec.yaml
echo "resolution: workspace" >> pubspec.yaml

# Update SDK constraint for workspace support  
sed -i 's/sdk: .*/sdk: "^3.9.0"/' pubspec.yaml

# Add to root workspace (already configured with patterns)
# Root pubspec.yaml workspace already includes: packages/domain/*

# Bootstrap workspace
cd ../../.. && melos bootstrap

# Verify package is discovered
melos list
```

### 🔧 **Workspace Verification Commands:**
```bash
melos list                    # Show all discovered packages
melos bootstrap               # Install dependencies & link packages  
melos run validate:quick      # Quick analysis and formatting check
melos run analyze             # Full static analysis
```

For detailed architecture and patterns, see `docs/monorepo-architecture-guide.md`.
