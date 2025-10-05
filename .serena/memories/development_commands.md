# Tina AI Assistant - Essential Development Commands

## Melos Commands (Workspace Management)
```bash
melos bootstrap              # Install dependencies & link packages
melos clean                  # Clean all packages
melos list                   # List all packages
melos exec -- <command>     # Run command in all packages
```

## Quality Assurance
```bash
melos run analyze            # Analyze code quality
melos run format             # Check code formatting (CI mode)
melos run format:fix         # Fix code formatting
melos run test               # Run all tests with coverage
melos run test:unit          # Run unit tests only
melos run test:widget        # Run widget tests only
melos run test:integration   # Run integration tests only
```

## Validation & CI
```bash
melos run validate:quick     # Quick development check (analyze + format)
melos run validate           # Full CI validation (analyze + format + test + build)
```

## Code Generation
```bash
melos run generate           # Run code generation for all packages
melos run generate:watch     # Run code generation in watch mode
```

## Dependency Management
```bash
# IMPORTANT: Always use these commands instead of manual editing
fvm flutter pub add package_name                    # Add runtime dependency
fvm flutter pub add dev:package_name                # Add dev dependency
fvm flutter pub add package_name:^1.0.0            # Add with version constraint
melos run pub-get           # Run pub get for all packages
melos run outdated          # Check for outdated dependencies
melos run upgrade           # Upgrade dependencies
```

## Building
```bash
melos run build             # Build debug APK for all Flutter packages
melos run build:release     # Build release APK
melos run build:web         # Build web version
```

## Development Workflow
```bash
cd apps/tina_app && flutter run    # Run main app
fvm flutter test path/to/test.dart # Run specific test
melos run reset                    # Clean, bootstrap, and regenerate
```

## Package Creation
```bash
# Pure Dart packages (domain/core layers)
fvm dart create --template=package packages/domain/chat_domain

# Flutter packages (features/presentation layers)
fvm flutter create --template=package packages/features/chat

# After creating packages:
melos bootstrap                      # Link dependencies
melos list                          # Verify package discovery
```

## Git Commands (Darwin)
```bash
git status                          # Check status
git add .                           # Stage changes
git commit -m "message"             # Commit changes
git push                            # Push to remote
git branch -b feature-name          # Create branch
git checkout branch-name            # Switch branches
git merge branch-name               # Merge branches
```

## File System (Darwin)
```bash
ls -la                              # List files with details
cd directory                        # Change directory
pwd                                 # Current directory
mkdir directory                     # Create directory
rm -rf directory                    # Remove directory
find . -name "*.dart"               # Find Dart files
grep -r "pattern" .                 # Search in files
```

## Required Commands After Task Completion
```bash
# Always run these before considering a task complete:
melos run analyze            # Must pass with no issues
melos run format             # Must pass with no changes
melos run test               # Must pass with 80%+ coverage
melos run validate:quick     # Quick validation check
```

## Troubleshooting
```bash
melos clean && melos bootstrap    # Fix dependency issues
melos run generate                 # Fix generated file issues
flutter pub cache clean           # Clear pub cache if needed
```