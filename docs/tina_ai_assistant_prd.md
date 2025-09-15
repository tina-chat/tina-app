# Tina AI Assistant - Product Requirements Document

## Overview

Tina is a Flutter-based AI assistant application designed to provide an intuitive, conversation-driven interface for users to interact with large language models. The application emphasizes simplicity, flexibility, and extensibility while maintaining a polished user experience across multiple platforms.

## Product Vision

Create a seamless AI conversation platform that allows users to:
- Engage in natural, context-aware conversations with AI
- Switch between different AI providers and models
- Maintain persistent conversation history
- Access their AI assistant across mobile and desktop platforms

## Core Features

### 1. Chat Interface
**User Stories:**
- As a user, I want to have natural conversations with an AI assistant
- As a user, I want to see conversation history in an intuitive chat format
- As a user, I want to easily distinguish between my messages and AI responses

**Acceptance Criteria:**
- Clean, modern chat UI with message bubbles
- Support for text-based conversations
- Real-time message display during AI response generation
- Proper handling of long messages and code blocks
- Message timestamps and status indicators

### 2. Multi-Chat Management
**User Stories:**
- As a user, I want to organize conversations into separate chats
- As a user, I want to easily switch between different conversation topics
- As a user, I want to create new chats for different purposes

**Acceptance Criteria:**
- List view of all conversations with titles and previews
- Ability to create, rename, and delete chats
- Automatic chat titling based on conversation content
- Search functionality across all chats

### 3. Service Provider Configuration
**User Stories:**
- As a user, I want to choose from different service provider types (LLM, Orchestrator, MCP)
- As a user, I want to configure API keys and settings for each service provider
- As a user, I want to switch between different models and workflows

**Acceptance Criteria:**
- Service provider configuration screen with secure credential vault
- Model selection for LLM service providers (OpenAI, Anthropic, etc.)
- Orchestrator setup for n8n/Flowise/Sim Studio
- MCP server discovery and registration
- Connection testing with visual feedback

### 4. Streaming Responses
**User Stories:**
- As a user, I want to see AI responses appear in real-time
- As a user, I want visual feedback that the AI is processing my request

**Acceptance Criteria:**
- Real-time token streaming from AI providers
- Loading indicators and typing animations
- Graceful handling of interrupted streams
- Stop generation functionality

### 5. Persistent Storage
**User Stories:**
- As a user, I want my conversations to be saved locally
- As a user, I want to access my chat history across app sessions
- As a user, I want my provider settings to be remembered

**Acceptance Criteria:**
- Local SQLite database for chat storage
- Secure storage for API keys and sensitive data
- Data export/import functionality
- Automatic backups and data recovery

## Technical Architecture

### Enhanced Architecture: Service Providers, Tools & Workflows

**Important Note**: This is a client-only Flutter application that connects to external services. No traditional backend server needs to be built. All "service providers" refer to external AI services and platforms that the app connects to via their APIs.

#### Taxonomy & Concepts
**Service Provider Types** (external services where inference runs):
- **LLM Service Provider**: OpenAI, OpenRouter, Anthropic, Gemini APIs
- **Orchestrator Service**: n8n, Flowise, Sim Studio platforms (chain tools/agents with SSE/JSONL)
- **MCP Server**: Remote tool servers via HTTP/SSE with JSON-RPC 2.0

**Core Concepts**:
- **Tool**: Invocable capability (memory, search, web) from host/orchestrator/MCP
- **Workflow**: Reusable Service Provider + Tools + Policies + Credentials
- **Policy**: Permission levels (Allow once, session, chat, workflow, or Deny)
- **Session**: UI lifecycle scope (cleared on app close/reset)

#### Package Dependencies

**Core Package Stack**:
```yaml
dependencies:
  # Streaming & protocols
  flutter_client_sse: ^2.0.0        # Single SSE client abstraction
  json_rpc_2: ^3.0.2                # MCP JSON-RPC 2.0
  json_schema: ^5.1.0               # Tool schema validation
  
  # Database with FTS5
  drift: ^2.14.1                    # Type-safe SQLite layer
  sqlite3_flutter_libs: ^0.5.15    # Native SQLite with FTS5
  
  # Security
  flutter_secure_storage: ^9.0.0   # Credential vault
  
  # HTTP & state
  dio: ^5.3.3                       # HTTP with interceptors
  flutter_riverpod: ^2.4.9          # State management
  
  # Testing
  integration_test:                 # Modern integration testing
  patrol: ^2.6.0                    # Enhanced test runner
```

### Enhanced Data Model

**Core Tables**:
- `service_providers`: id, type ∈ {llm, orchestrator, mcp}, name, base_url, credential_id, created_at
- `tools`: id, name, source ∈ {builtin, orchestrator, mcp}, service_provider_id, schema_json, redact_on_export
- `workflows`: id, name, service_provider_id, created_at, updated_at
- `sessions`: id, created_at, ended_at
- `chats`: id, title, workflow_id, created_at
- `messages`: id, chat_id, role, content TEXT (FTS5), tool_trace_json, service_provider_id, service_provider_type, service_provider_params_json, created_at

**Relation Tables** (with constraints):
- `workflow_tools`: workflow_id, tool_id, enabled, policy_override_json (UNIQUE composite)
- `workflow_credentials`: workflow_id, credential_id, scope
- `tool_permissions`: scope_type, scope_id, tool_id, decision, expires_at, created_at (PRIMARY KEY: scope_type, scope_id, tool_id)

**Service Provider Configuration**:
- `llm_options`: service_provider_id, provider, model, params_json
- `orchestrators`: service_provider_id, platform, stream_format ∈ {sse, jsonl}
- `mcp_servers`: service_provider_id, url, headers_json

**Security & Storage**:
- `credentials`: id, name, type, encrypted_secret, allowed_service_providers_json
- `attachments`: id, message_id, kind, path, metadata_json

**Indices**:
- `messages(chat_id, created_at DESC)`
- `tool_permissions(tool_id, scope_type, scope_id)`
- `workflows(name)` - unique optional
- FTS5 virtual table on `messages(content)` with sync triggers

### Current Implementation Status

#### ✅ Implemented Components:
- **Models**: Data models with JSON serialization (to be extended)
- **State Management**: Riverpod providers for reactive state
- **Services**: N8nService (to evolve into OrchestratorClient)
- **UI Screens**: Chat interface with provider management
- **Widgets**: Message display and input components

### Recommended Architecture Implementation

#### 1. Service Provider Architecture (LLM, Orchestrator, MCP)
**External Service Abstraction Layer**
- Unified interface for LLM, Orchestrator, and MCP service providers
- SSE/JSONL streaming support across all service provider types
- JSON-RPC 2.0 for MCP communication
- Dynamic service provider switching with hot-reload capabilities

**Integration Points**:
- **OpenRouter**: Drop-in OpenAI replacement with SSE streaming
- **n8n/Flowise**: Orchestrators with tool chaining and SSE/JSONL
- **MCP Servers**: HTTP/SSE transport for mobile (no stdio)
- **Native LLMs**: Direct API integration (OpenAI, Anthropic, Gemini)

#### 2. Tool & Workflow Management
**Tool Registry**
- Builtin tools (host capabilities)
- Orchestrator tools (from n8n/Flowise workflows)
- MCP tools (discovered via JSON-RPC)
- JSON-Schema validation for all tool inputs

**Workflow System**
- Reusable combinations of Service Provider + Tools + Policies
- Credential bindings per workflow
- Policy inheritance and overrides
- Session-scoped tool permissions

#### 3. Permission & Security Model
**Permission Precedence** (highest to lowest):
1. Deny (blocks with logged reason)
2. Allow once (single invocation)
3. Allow for session (expires on app close/reset)
4. Allow for chat (persistent per conversation)
5. Allow for workflow (global for workflow)

**Permission Expiry**:
- Session permissions cleared on app close or manual reset
- Once permissions consumed immediately
- Chat/workflow permissions persist until revoked
- All decisions logged in tool_trace_json

**Credential Vault**:
- Encrypted storage with flutter_secure_storage
- Exports exclude secrets (only references)
- Test connection per service provider/tool
- Clear data boundaries per service provider

#### 4. Streaming & Data Architecture
**Unified Stream Event Contract**:
```json
{
  "type": "start|delta|tool_start|tool_end|error|done",
  "messageId": "...",
  "toolId": "?",
  "source": "builtin|orchestrator|mcp",
  "data": {...},
  "cursor": "...",
  "cost": {"tokensIn": 0, "tokensOut": 0, "usd": 0.0},
  "ts": 1736123456
}
```

**Streaming Resilience**:
- Idempotency tokens per message
- Resume from last chunk (SSE last-event-id)
- Exponential backoff with jitter
- "Recover stream" UI action
- Connection state indicators

**SQLite with FTS5**:
- Messages table with content TEXT for FTS5
- Message provenance (service_provider_id, type, params) frozen at send time
- Foreign key constraints with CASCADE where appropriate
- Efficient pagination (<100ms for 10k messages)
- Version migration with snapshot testing

**MCP Capability Discovery**:
- Required methods: `tools/list`, `tools/call`, `status/health`
- JSON-Schema mapping to ToolDescriptor
- Capability cache with TTL
- Graceful degradation for missing capabilities

### Architecture Highlights

#### Layered Architecture Benefits
- Clear separation of concerns
- Testable and maintainable codebase
- Platform-agnostic business logic
- Easy feature extension and modification

#### Data Flow Architecture
1. **UI Layer** → User interactions trigger state changes
2. **State Layer** → Providers coordinate business operations
3. **Repository Layer** → Data access with caching strategies
4. **Service Layer** → External service communication
5. **Data Layer** → Persistent storage and retrieval

#### Design Patterns Integration
- **Repository Pattern**: Clean data access abstraction
- **Factory Pattern**: AI provider management
- **Strategy Pattern**: Interchangeable implementations
- **Observer Pattern**: Reactive state management
- **Singleton Pattern**: Shared services and utilities

### Testing Strategy Overview
**Multi-Level Testing Approach**
- Unit tests for business logic and utilities
- Widget tests for UI component validation
- Integration tests for user workflow verification
- Golden file tests for visual regression prevention

**Mock and Stub Strategy**
- Repository mocking for isolated testing
- AI provider stubs for predictable responses
- Database in-memory instances for test isolation
- Network mocking for offline test scenarios

## User Experience Flow

### Primary User Journey
1. **App Launch** → Chat list with existing conversations
2. **New Chat** → Provider selection and chat creation
3. **Conversation** → Message input, streaming responses, persistent history
4. **Chat Management** → Switch chats, organize conversations
5. **Settings** → Configure providers, manage API keys

### Key UI/UX Principles
- **Simplicity**: Minimal, distraction-free interface
- **Responsiveness**: Real-time feedback and smooth animations
- **Accessibility**: Proper contrast, text scaling, screen reader support
- **Cross-platform**: Consistent experience across mobile and desktop

## Platform Support

### Target Platforms
- **Mobile**: iOS and Android (primary focus)
- **Desktop**: Windows, macOS, Linux (secondary)
- **Web**: Progressive web app capability

### Platform-Specific Considerations
- Mobile: Touch-optimized UI, keyboard handling, background processing
- Desktop: Keyboard shortcuts, window management, system integration
- Web: Responsive design, offline capabilities, PWA features

## Performance Requirements

### Response Time Goals
- App startup: < 2 seconds
- Chat loading: < 1 second
- Message send: < 100ms to UI feedback
- AI response streaming: < 500ms to first token

### Resource Efficiency
- Memory usage: < 100MB baseline
- Storage: Efficient chat compression and archival
- Network: Optimized API calls, proper caching
- Battery: Minimal background processing

## Security & Privacy

### Credential Vault
- Encrypted storage with flutter_secure_storage
- Credential scoping with allowed_service_providers[] validation
- Exports exclude secrets (only references)
- Test connection validation per service provider
- BYO API key philosophy

### Data Protection
- Local-first approach: All data on device
- Tool I/O redaction policy (per-tool flag + global export option)
- No telemetry without explicit consent
- Optional E2EE cloud sync (future)
- Per-chat/workflow data isolation

### Cost Controls
**Enforcement Behavior**:
- **Soft limit**: Warning + continue unless user cancels
- **Hard limit**: Block send with "raise limit once" CTA
- Per-chat usage meters (tokens & cost estimates)
- Workflow-level limits with override options
- Cost-saving mode (auto-reduce context window)

## Acceptance Criteria

### Core Functionality
- **Service provider switching**: In-chat changes freeze service_provider_params_json in message for audit trail
- **Run Steps Panel**: Tool name, source, duration, I/O (collapsible), permission decision, errors
- **Permissions**: Five scopes with precedence testing; deny blocks with one-click override
- **Search**: FTS5 returns results across all chats in <100ms on 10k messages
- **Sessions**: First-class table tracking session lifecycle for permission expiry

### Technical Requirements
- **Streaming**: Unified event contract, reconnection with resume via last-event-id
- **MCP Integration**: Capability discovery (tools/list, tools/call, status/health)
- **Data Integrity**: Foreign keys with CASCADE, composite keys, proper indices
- **Security**: Credential scoping, redaction policies, test connection validation
- **Accessibility**: Virtualization for long chats, screen reader labels

### Testing Priorities
- **Permission precedence**: Property-based tests for Deny > Once > Session > Chat > Workflow
- **Migration tests**: Snapshot DB v1→vN with sample data validation
- **Stream recovery**: Kill SSE mid-response, verify resume without duplication
- **Cost enforcement**: Soft/hard limit behavior verification

## Success Metrics

### User Engagement
- Daily active users and session duration
- Messages per conversation depth
- Service provider/tool usage distribution
- Permission grant/deny ratios

### Technical Performance
- App crash rate: < 0.1%
- Stream success rate: > 99.5%
- Search query time: < 100ms
- Tool invocation latency: < 500ms

## Development Roadmap

### Sprint A: Unify & Stream
**Deliverables**:
- ExternalServiceClient adapters (LLM/Orchestrator SSE-JSONL/MCP HTTP-SSE)
- Unified stream event contract with normalization
- Permission prompts (5 scopes) with precedence store
- Run Steps panel (collapsible I/O, errors, timings)
- Credential vault MVP with "Test connection"
- Message provenance snapshot (service_provider_params_json)

### Sprint B: Workflows & Governance
**Deliverables**:
- Relation tables with foreign keys, indices, migrations
- Sessions table wired to permission expiry
- Workflow picker with service provider override badges
- Usage meters with soft/hard limit enforcement
- Export without secrets + optional I/O redaction
- Accessibility improvements (virtualization, labels)

### Phase 1: Core MVP (Current Status)
- ✅ Basic chat interface and message handling
- ✅ Initial service provider integration (n8n)
- ✅ Local storage and persistence
- ✅ Multi-chat management

### Phase 2: Service Provider & Tool Integration
**Packages to implement:**
- `flutter_client_sse: ^2.0.0` - SSE streaming for orchestrators
- `json_rpc_2: ^3.0.2` - MCP server communication
- `json_schema: ^5.1.0` - Tool schema validation
- `flutter_markdown: ^0.6.18` - Rich message formatting

**Implementation focus:**
- Multi-service provider support (LLM, Orchestrator, MCP)
- Tool discovery and registration
- Permission prompts with scoped persistence
- Tool trace panel with step visualization

### Phase 3: Workflow & Orchestration
**Packages to implement:**
- `drift: ^2.14.1` with FTS5 - Full-text search capabilities
- `flutter_secure_storage: ^9.0.0` - Credential vault
- Integration with n8n, Flowise, Sim Studio orchestrators
- MCP server discovery and registration

**Implementation focus:**
- Workflow designer with drag-drop interface
- Credential management vault
- Policy editor with granular permissions
- Batch operations and workflow templates

### Phase 4: Advanced Platform Features
**Implementation focus:**
- Desktop/Web platform expansion
- Multi-modal support (images, documents)
- Advanced MCP capabilities (complex tools)
- E2EE sync across devices
- Plugin system for extensibility

## Implementation Guidelines & Best Practices

### Project Structure Strategy
**Clean Architecture Organization**
```
lib/
├── core/                          # Shared utilities and constants
├── data/                          # Data layer implementations
├── domain/                        # Business logic and entities
├── presentation/                  # UI components and screens  
├── services/                      # External service integrations
└── providers/                     # State management providers
```

**Layer Responsibilities**
- **Core**: Cross-cutting concerns, utilities, constants
- **Data**: Repository implementations, database, network
- **Domain**: Business entities, use cases, repository contracts
- **Presentation**: Widgets, screens, themes, platform UI
- **Services**: AI providers, storage, external integrations
- **Providers**: Riverpod state management coordination

### Development Workflow Strategy
**Code Generation Approach**
- Automated code generation for models and providers
- Build runner integration for development workflow
- Version control exclusion of generated files
- CI/CD pipeline integration for consistent builds

**Quality Assurance Process**
- Automated linting and code analysis
- Unit test coverage requirements
- Integration test validation
- Performance benchmarking and monitoring

## Technical Debt and Improvements

### Current Areas for Enhancement
**Error handling robustness:**
- Implement `dio_exception_handler` for network error management
- Add `flutter_error_boundary` for graceful error recovery
- Use `logging: ^1.2.0` for structured error reporting

**UI polish and animations:**
- Integrate `animations: ^2.0.8` for Material motion
- Add `lottie: ^2.7.0` for loading animations
- Implement `shimmer: ^3.0.0` for skeleton loading states

**Testing coverage expansion:**
- Set up `mocktail: ^1.0.1` for comprehensive mocking
- Use `golden_toolkit: ^0.15.0` for visual regression testing
- Implement `patrol: ^2.6.0` for integration testing

**Performance optimization:**
- Add `flutter_performance_monitor` for runtime metrics
- Implement lazy loading with `infinite_scroll_pagination`
- Use `cached_network_image` for efficient image handling

**Accessibility improvements:**
- Implement semantic labels and screen reader support
- Add high contrast theme support
- Ensure keyboard navigation compatibility

### Code Quality Goals
**Comprehensive testing strategy:**
- Unit tests for all business logic and utilities
- Widget tests for UI component validation
- Integration tests for complete user workflows
- Golden file tests for visual regression detection
- Mock-based testing for external dependencies

**Consistent code formatting:**
- Flutter linting rules enforcement
- Automated code analysis with metrics
- Pre-commit hooks for code quality
- Generated code exclusion from analysis
- Consistent import organization and structure

**Documentation improvements:**
- Generate API documentation with `dartdoc`
- Maintain architecture decision records (ADRs)
- Create developer onboarding guides with code examples
- Document AI provider integration patterns

**Architecture pattern refinement:**
- Implement Clean Architecture layers consistently
- Use dependency injection throughout the application
- Apply SOLID principles in service design
- Establish clear separation of concerns between layers

## Risk Assessment

### Technical Risks
- **AI Provider Dependencies**: Mitigated by multi-provider support
- **Platform Fragmentation**: Addressed by Flutter's cross-platform capabilities
- **Data Migration**: Handled by versioned storage schemas
- **Performance Scaling**: Managed through efficient data structures and caching

### Business Risks
- **AI Provider Costs**: User-managed API keys transfer cost responsibility
- **Competition**: Focus on unique UX and flexibility
- **Privacy Regulations**: Local-first approach reduces compliance complexity

## Open Source & Licensing

### License
This project is licensed under the **MIT License** - a permissive open-source license that allows:
- Commercial use
- Modification and distribution
- Private use
- Liability limitation

### Open Source Philosophy
- **BYO API Keys**: Users maintain control of their AI service costs
- **Self-hostable services**: Support for local/private orchestrators
- **Extensible architecture**: Plugin points for community contributions
- **Privacy-first**: No vendor lock-in or data collection

### Community & Contributions
- Public repository with clear contribution guidelines
- Modular design for third-party service provider integrations
- Extension points for custom tools and workflows
- Documentation for self-hosted deployments

## Conclusion

Tina represents a well-architected, user-focused AI assistant application with a solid foundation for growth and enhancement. The current implementation demonstrates thoughtful technical decisions, clean code organization, and a clear path forward for feature development.

The combination of Flutter's cross-platform capabilities, Riverpod's reactive state management, and a flexible external service system (LLM/Orchestrator/MCP) positions Tina as a competitive and extensible solution in the AI assistant space.

The MIT license ensures the project remains open and accessible, fostering community contributions while enabling commercial use cases. Future development should focus on UI/UX polish, performance optimization, and strategic feature additions that enhance the core conversation experience while maintaining the application's simplicity, privacy, and reliability principles.