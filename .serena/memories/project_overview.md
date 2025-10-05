# Tina AI Assistant - Project Overview

## Project Purpose
Tina is a privacy-first AI assistant that provides users with complete control over their data and AI interactions. The app allows users to bring their own API keys, ensuring cost transparency and preventing vendor lock-in. It features local-first storage, optional cloud sync, and supports multiple AI providers through a unified interface.

## Tech Stack
- **Framework**: Flutter with Dart SDK ^3.9.0
- **State Management**: BLoC pattern with flutter_bloc
- **Architecture**: Clean Architecture with layered approach
- **Package Management**: Melos for monorepo management
- **Code Generation**: build_runner for JSON serialization and other generated code
- **UI Components**: Custom tina_ui package with atomic design
- **Navigation**: go_router for declarative routing
- **Networking**: dio for HTTP client, http for basic requests
- **Local Storage**: shared_preferences (current), adding Drift for database
- **Serialization**: json_annotation with json_serializable

## Project Structure
```
tina_workspace/
├── apps/
│   └── tina_app/           # Main Flutter application
├── packages/
│   └── tina_ui/           # Shared UI components
├── widgetbook/            # Storybook for UI components
├── docs/                  # Documentation
└── prompts/              # Agent prompts
```

## Key Features
- Multi-provider AI integration (OpenAI, Claude, etc.)
- Local-first conversation storage with optional cloud sync
- Tool and workflow extensibility
- Cross-platform support (mobile, desktop, web)
- Real-time streaming responses
- Encrypted credential management

## Development Commands
- `melos bootstrap` - Install dependencies and link packages
- `melos run analyze` - Static analysis
- `melos run format` - Code formatting
- `melos run test` - Run all tests with coverage
- `melos run validate` - Full CI validation pipeline
- `melos run validate:quick` - Quick development validation
- `melos run generate` - Code generation
- `cd apps/tina_app && flutter run` - Run main app

## Quality Standards
- Very Good Analysis linting rules
- 80%+ test coverage requirement
- Clean Architecture principles
- Privacy-first design
- Accessibility by design
- Cross-platform consistency