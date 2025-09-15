# Tina AI Assistant - Mobile App Screen Navigation

## Overview

This document defines the complete mobile screen hierarchy, navigation patterns, and atomic design mappings for Tina AI Assistant. The app follows a conversation-first approach with service provider flexibility and comprehensive tool management capabilities.

## Table of Contents

1. [Primary Navigation Structure](#primary-navigation-structure)
2. [Complete Screen Hierarchy](#complete-screen-hierarchy)
3. [Navigation Patterns](#navigation-patterns)
4. [Atomic Design Mapping](#atomic-design-mapping)
5. [Modal & Sub-screen Specifications](#modal--sub-screen-specifications)
6. [Feature-to-Screen Mapping](#feature-to-screen-mapping)
7. [User Journey Flows](#user-journey-flows)
8. [Implementation Notes](#implementation-notes)

---

## Primary Navigation Structure

### Bottom Navigation (Primary)
```
┌─────────────────────────────────────────────────┐
│ [💬 Chats] [🔧 Tools] [⚙️ Settings] [👤 Profile] │
└─────────────────────────────────────────────────┘
```

**Tab Structure:**
- **Chats** (Default): Chat list → Active chat → Conversation
- **Tools**: Service providers → Tool management → Permissions
- **Settings**: App configuration → Provider settings → Advanced
- **Profile**: User preferences → Data management → Export/Import

### Top App Bar (Contextual)
- **Dynamic title** based on current screen
- **Action buttons** context-specific (search, add, more)
- **Back navigation** for sub-screens
- **Connection status indicator** for active providers

---

## Complete Screen Hierarchy

### 1. Chat Flow (Primary)

#### 1.1 Chat List Screen
**Route:** `/` (Root)
```
Chat List Screen
├── Empty State (First Launch)
├── Chat Items List
│   ├── Chat Preview
│   ├── Last Message
│   └── Timestamp
├── Search Bar (Global FTS5)
├── Floating Action Button (New Chat)
└── App Bar Actions
    ├── Search Toggle
    ├── Selection Mode
    └── Overflow Menu
```

#### 1.2 Active Chat Screen
**Route:** `/chat/{chatId}`
```
Chat Screen
├── Chat Header
│   ├── Title (Editable)
│   ├── Service Provider Badge
│   └── Actions (Share, Export, Delete)
├── Message List
│   ├── Message Bubbles (User/AI)
│   ├── Tool Execution Steps
│   ├── Typing Indicator
│   └── Stream Status
├── Input Area
│   ├── Text Input Field
│   ├── Attachment Button
│   ├── Send Button
│   └── Voice Input (Future)
└── Contextual Overlays
    ├── Provider Switcher
    ├── Tool Permissions Panel
    └── Run Steps Drawer
```

#### 1.3 New Chat Creation
**Route:** `/chat/new`
```
New Chat Creation
├── Service Provider Selection
│   ├── LLM Providers
│   ├── Orchestrators
│   └── MCP Servers
├── Workflow Selection (Optional)
├── Initial Message Input
└── Quick Start Templates
```

### 2. Service Provider & Tools Flow

#### 2.1 Service Providers Screen
**Route:** `/providers`
```
Service Providers Screen
├── Provider Categories
│   ├── LLM Services (OpenAI, Anthropic, etc.)
│   ├── Orchestrators (n8n, Flowise)
│   └── MCP Servers
├── Provider Cards
│   ├── Connection Status
│   ├── Model/Version Info
│   └── Quick Actions
└── Floating Action Button (Add Provider)
```

#### 2.2 Provider Configuration
**Route:** `/providers/{providerId}/config`
```
Provider Configuration
├── Basic Settings
│   ├── Name & Description
│   ├── Base URL/Endpoint
│   └── Connection Test
├── Authentication
│   ├── API Key Input
│   ├── Credential Vault Link
│   └── Security Settings
├── Advanced Options
│   ├── Model Selection (LLM)
│   ├── Stream Format (Orchestrator)
│   └── Headers/Params
└── Tool Configuration
    ├── Available Tools List
    ├── Permission Defaults
    └── Policy Overrides
```

#### 2.3 Tool Management Screen
**Route:** `/tools`
```
Tool Management Screen
├── Tool Categories
│   ├── Built-in Tools
│   ├── Orchestrator Tools
│   └── MCP Tools
├── Tool Cards
│   ├── Tool Name & Source
│   ├── Permission Status
│   ├── Usage Statistics
│   └── Configuration Access
└── Global Tool Settings
    ├── Default Permissions
    ├── Session Management
    └── Privacy Controls
```

#### 2.4 Tool Permissions Panel
**Route:** `/tools/{toolId}/permissions`
```
Tool Permissions Panel
├── Permission Scopes
│   ├── Deny (Block always)
│   ├── Allow Once (Single use)
│   ├── Allow for Session
│   ├── Allow for Chat
│   └── Allow for Workflow
├── Active Permissions List
├── Permission History
└── Bulk Actions
    ├── Revoke All
    ├── Reset Defaults
    └── Export Permissions
```

### 3. Workflow Management Flow

#### 3.1 Workflows Screen
**Route:** `/workflows`
```
Workflows Screen
├── Workflow Cards
│   ├── Name & Description
│   ├── Service Provider
│   ├── Tool Count
│   └── Usage Stats
├── Quick Actions
│   ├── Duplicate Workflow
│   ├── Share/Export
│   └── Delete
└── Floating Action Button (New Workflow)
```

#### 3.2 Workflow Editor
**Route:** `/workflows/{workflowId}/edit`
```
Workflow Editor
├── Basic Info
│   ├── Name & Description
│   ├── Tags
│   └── Icon Selection
├── Service Provider Binding
├── Tool Selection & Configuration
│   ├── Available Tools Grid
│   ├── Tool-specific Settings
│   └── Permission Policies
├── Credential Bindings
├── Usage Limits & Policies
└── Testing & Validation
    ├── Test Connection
    ├── Dry Run
    └── Save/Deploy
```

### 4. Settings & Configuration Flow

#### 4.1 Settings Main Screen
**Route:** `/settings`
```
Settings Screen
├── User Preferences
│   ├── Theme & Appearance
│   ├── Language & Region
│   └── Accessibility
├── App Configuration
│   ├── Default Providers
│   ├── Chat Behavior
│   └── Notification Settings
├── Data & Privacy
│   ├── Storage Management
│   ├── Export/Import
│   └── Privacy Controls
├── Advanced Settings
│   ├── Debug Options
│   ├── Performance Tuning
│   └── Developer Mode
└── Help & Support
    ├── Documentation
    ├── Feedback
    └── About
```

#### 4.2 Credential Vault
**Route:** `/settings/credentials`
```
Credential Vault Screen
├── Stored Credentials List
│   ├── Credential Name
│   ├── Type (API Key, Token, etc.)
│   ├── Associated Providers
│   └── Last Used
├── Security Status
│   ├── Encryption Status
│   ├── Auto-lock Settings
│   └── Backup Status
└── Credential Management
    ├── Add New Credential
    ├── Test Connection
    ├── Bulk Operations
    └── Security Audit
```

#### 4.3 Data Export/Import
**Route:** `/settings/data`
```
Data Management Screen
├── Export Options
│   ├── Chat History
│   ├── Workflows & Configurations
│   ├── Tool Permissions
│   └── Privacy Settings
├── Import Options
│   ├── File Upload
│   ├── Cloud Sync (Future)
│   └── Migration Tools
├── Storage Analytics
│   ├── Usage Statistics
│   ├── Storage Breakdown
│   └── Cleanup Tools
└── Privacy Controls
    ├── Data Redaction
    ├── Selective Export
    └── Secure Delete
```

### 5. Search & Discovery Flow

#### 5.1 Global Search Screen
**Route:** `/search`
```
Global Search Screen
├── Search Input
│   ├── Query Input Field
│   ├── Filter Options
│   └── Search History
├── Search Results
│   ├── Message Results
│   ├── Chat Results
│   ├── Tool Results
│   └── Workflow Results
├── Filters & Sorting
│   ├── Date Range
│   ├── Service Provider
│   ├── Content Type
│   └── Relevance/Time
└── Search Analytics
    ├── Result Count
    ├── Search Time
    └── Suggested Queries
```

---

## Navigation Patterns

### 1. Primary Navigation
- **Bottom Tabs**: Main sections (Chats, Tools, Settings, Profile)
- **Persistent**: Always visible except in full-screen modes
- **Badge Indicators**: Unread counts, connection status, alerts

### 2. Hierarchical Navigation
- **Push Navigation**: Forward drill-down (Chat List → Chat → Tool Panel)
- **Modal Navigation**: Settings, configurations, forms
- **Sheet Navigation**: Quick actions, context menus

### 3. Cross-cutting Navigation
- **Global Search**: Accessible from any screen via app bar
- **Quick Actions**: FAB, app bar actions, gesture shortcuts
- **Deep Linking**: Direct access to chats, tools, settings

### 4. Context-Aware Navigation
- **Provider Context**: Navigation adapts based on active provider
- **Permission Context**: Restricted areas based on tool permissions
- **State Context**: Different flows for empty vs. populated states

---

## Atomic Design Mapping

### Atoms (20 Available Components)

#### Text & Input Components
- **TinaText**: Message content, labels, descriptions
- **TinaInput**: Chat input, search fields, configuration forms
- **TinaButton**: Send, action buttons, CTAs
- **TinaIcon**: Navigation icons, status indicators, tool icons

#### Visual Elements
- **TinaAvatar**: User avatars, provider logos, bot representations
- **TinaBadge**: Status indicators, unread counts, provider badges
- **TinaCard**: Chat cards, provider cards, tool cards
- **TinaContainer**: Layout containers, section wrappers

#### Interactive Elements
- **TinaFloatingActionButton**: New chat, add provider, quick actions
- **TinaNavigationItem**: Bottom tab items, drawer navigation
- **TinaTabItem**: Settings tabs, provider category tabs
- **TinaAppBarAction**: Search, more options, context actions

#### Status & Feedback
- **TinaSpinner**: Loading states, processing indicators
- **TinaTypingIndicator**: AI response generation feedback
- **TinaMessageStatus**: Message delivery, read status
- **TinaConnectionStatus**: Provider connection health

#### Content Display
- **TinaMessageBubble**: Chat messages, system notifications
- **TinaAttachmentPreview**: File attachments, media previews
- **TinaDivider**: Section separators, content organization

### Molecules (Component Groups)

#### Chat Components
- **MessageGroup**: Multiple message bubbles with metadata
- **ChatHeader**: Title, provider badge, actions
- **InputArea**: Text input + attachment + send button
- **ToolExecutionPanel**: Tool name + status + collapsible I/O

#### Navigation Components
- **TabBar**: Bottom navigation with badges
- **AppBarWithSearch**: Title + search toggle + actions
- **NavigationDrawer**: Alternative navigation for large screens

#### Provider Components
- **ProviderCard**: Status + info + actions
- **ProviderSelector**: Grid/list of available providers
- **CredentialForm**: API key + validation + test connection

#### Tool Components
- **ToolCard**: Tool info + permission status + actions
- **PermissionMatrix**: 5-level permission grid
- **ToolUsageStats**: Usage metrics and analytics

### Organisms (Complex Sections)

#### Screen Headers
- **ChatScreenHeader**: Title editing + provider switching + actions
- **ProviderConfigHeader**: Connection status + test + save
- **WorkflowEditorHeader**: Name + validation status + actions

#### Content Areas
- **MessageList**: Virtualized message bubbles + tool panels
- **ProviderGrid**: Provider cards + filtering + search
- **WorkflowCanvas**: Drag-drop workflow builder
- **PermissionCenter**: Tool grid + permission controls

#### Status Panels
- **RunStepsDrawer**: Collapsible tool execution timeline
- **ConnectionStatusBar**: Real-time provider health
- **UsageDashboard**: Cost tracking + limits + analytics

### Templates (Page Layouts)

#### Primary Templates
- **ChatTemplate**: App bar + message list + input area
- **ListTemplate**: App bar + search + list + FAB
- **ConfigTemplate**: App bar + form sections + actions
- **DashboardTemplate**: App bar + grid/cards + filters

#### Modal Templates
- **SheetTemplate**: Bottom sheet with drag handle + content
- **DialogTemplate**: Centered modal with title + content + actions
- **FullscreenTemplate**: Full takeover for complex flows

---

## Modal & Sub-screen Specifications

### 1. Bottom Sheets

#### Provider Switcher Sheet
```
Provider Switcher
├── Current Provider (Highlighted)
├── Available Providers List
├── Add New Provider CTA
└── Sheet Actions (Drag handle, Close)
```

#### Tool Permissions Sheet
```
Tool Permissions
├── Tool Info Header
├── Permission Scope Selector
├── Grant/Deny Actions
├── Advanced Options Toggle
└── Apply/Cancel Actions
```

#### Run Steps Drawer
```
Run Steps Drawer
├── Execution Timeline
├── Step Details (Collapsible)
│   ├── Input/Output Data
│   ├── Duration & Status
│   └── Error Messages
├── Performance Metrics
└── Export/Share Options
```

### 2. Dialog Modals

#### Chat Delete Confirmation
```
Delete Chat Dialog
├── Warning Icon
├── Confirmation Message
├── Chat Preview
├── Data Impact Notice
└── Cancel/Delete Actions
```

#### Provider Connection Test
```
Connection Test Dialog
├── Loading Spinner
├── Test Progress Steps
├── Success/Error Results
├── Connection Details
└── Retry/Close Actions
```

#### Permission Grant Dialog
```
Permission Grant Dialog
├── Tool Icon & Name
├── Permission Request Details
├── Scope Selection (5 levels)
├── Security Notice
└── Grant/Deny Actions
```

### 3. Full-screen Modals

#### Search Interface
```
Search Fullscreen
├── Search Input (Auto-focus)
├── Recent Searches
├── Filter Chips
├── Results List
├── Quick Actions
└── Cancel Navigation
```

#### Workflow Builder
```
Workflow Builder
├── Canvas Area
├── Tool Palette (Sidebar)
├── Properties Panel
├── Connection Lines
├── Validation Status
└── Save/Preview Actions
```

---

## Feature-to-Screen Mapping

### Chat Interface Features
| Feature | Primary Screen | Secondary Screens | Modals |
|---------|---------------|-------------------|---------|
| **Streaming Responses** | Chat Screen | - | Run Steps Drawer |
| **Message History** | Chat Screen | Global Search | - |
| **Multi-format Support** | Chat Screen | Attachment Preview | - |
| **Real-time Feedback** | Chat Screen | - | Connection Status |

### Multi-Chat Management
| Feature | Primary Screen | Secondary Screens | Modals |
|---------|---------------|-------------------|---------|
| **Chat List** | Chat List Screen | - | - |
| **Create/Rename/Delete** | Chat List Screen | New Chat Creation | Delete Confirmation |
| **Search Across Chats** | Global Search | - | Search Filters |
| **Auto-titling** | Chat Screen | - | - |

### Service Provider Configuration
| Feature | Primary Screen | Secondary Screens | Modals |
|---------|---------------|-------------------|---------|
| **Provider Management** | Providers Screen | Provider Config | Connection Test |
| **Credential Vault** | Credential Vault | - | Add Credential |
| **Model Selection** | Provider Config | - | Model Picker |
| **Connection Testing** | Provider Config | - | Test Results |

### Tool & Permission Management
| Feature | Primary Screen | Secondary Screens | Modals |
|---------|---------------|-------------------|---------|
| **Tool Discovery** | Tools Screen | Tool Config | Tool Details |
| **5-Level Permissions** | Permission Panel | - | Permission Grant |
| **Usage Tracking** | Tools Screen | Usage Analytics | - |
| **Session Management** | Tools Screen | Settings Screen | Session Reset |

### Workflow Management
| Feature | Primary Screen | Secondary Screens | Modals |
|---------|---------------|-------------------|---------|
| **Workflow Designer** | Workflow Editor | - | Workflow Builder |
| **Provider + Tool Binding** | Workflow Editor | - | Component Picker |
| **Policy Configuration** | Workflow Editor | Permission Panel | Policy Editor |
| **Template System** | Workflows Screen | - | Template Gallery |

### Data Export/Import
| Feature | Primary Screen | Secondary Screens | Modals |
|---------|---------------|-------------------|---------|
| **Export Options** | Data Management | - | Export Options |
| **Import Processing** | Data Management | - | Import Progress |
| **Privacy Controls** | Data Management | Settings Screen | Redaction Options |
| **Migration Tools** | Data Management | - | Migration Wizard |

### Search with FTS5
| Feature | Primary Screen | Secondary Screens | Modals |
|---------|---------------|-------------------|---------|
| **Global Search** | Global Search | - | Search Fullscreen |
| **Filter & Sort** | Global Search | - | Filter Sheet |
| **Search History** | Global Search | - | - |
| **Result Navigation** | Global Search | Target Screens | - |

---

## User Journey Flows

### 1. First-Time User Onboarding

```
App Launch (Empty State)
    ↓
Welcome Screen
    ↓
Provider Setup Wizard
    ├── Choose Provider Type
    ├── Add Credentials
    ├── Test Connection
    └── Configure Defaults
    ↓
Create First Chat
    ├── Select Workflow (Optional)
    ├── Choose Initial Message
    └── Start Conversation
    ↓
Chat Interface
    └── Guided Tutorial Overlays
```

### 2. Daily Chat Usage

```
App Launch
    ↓
Chat List Screen
    ├── Continue Recent Chat
    │   └── Chat Screen
    └── Start New Chat
        ├── Provider Selection
        ├── Initial Message
        └── Chat Screen
            ├── Message Exchange
            ├── Tool Execution
            ├── Provider Switching
            └── Export/Share
```

### 3. Service Provider Management

```
Settings/Providers Tab
    ↓
Provider List
    ├── Add New Provider
    │   ├── Provider Type Selection
    │   ├── Configuration Form
    │   ├── Credential Setup
    │   ├── Connection Test
    │   └── Save & Activate
    └── Configure Existing
        ├── Update Settings
        ├── Manage Tools
        ├── Test Connection
        └── Update Permissions
```

### 4. Tool Permission Management

```
Tools Tab
    ↓
Tool List
    ├── Individual Tool Config
    │   ├── Permission Settings
    │   ├── Usage Analytics
    │   └── Policy Overrides
    └── Bulk Permission Management
        ├── Session Reset
        ├── Global Defaults
        └── Security Audit
```

### 5. Workflow Creation & Usage

```
Workflows Tab
    ↓
Workflow List
    ├── Create New Workflow
    │   ├── Provider Selection
    │   ├── Tool Configuration
    │   ├── Permission Policies
    │   ├── Testing & Validation
    │   └── Save & Deploy
    └── Use Existing Workflow
        ├── Select from New Chat
        ├── Apply to Existing Chat
        └── Modify & Customize
```

### 6. Data Management & Export

```
Settings → Data Management
    ↓
Data Dashboard
    ├── Export Data
    │   ├── Select Data Types
    │   ├── Choose Privacy Level
    │   ├── Generate Export
    │   └── Share/Save File
    └── Import Data
        ├── File Selection
        ├── Data Validation
        ├── Conflict Resolution
        └── Import Completion
```

### 7. Search & Discovery

```
Global Search (Any Screen)
    ↓
Search Interface
    ├── Query Input
    ├── Filter Selection
    ├── Real-time Results
    ├── Result Navigation
    └── Search History
```

---

## Implementation Notes

### 1. Navigation Architecture

#### Route Structure
```dart
// App Router Configuration
class AppRouter {
  static const String home = '/';
  static const String chat = '/chat/:chatId';
  static const String newChat = '/chat/new';
  static const String providers = '/providers';
  static const String providerConfig = '/providers/:providerId/config';
  static const String tools = '/tools';
  static const String toolPermissions = '/tools/:toolId/permissions';
  static const String workflows = '/workflows';
  static const String workflowEditor = '/workflows/:workflowId/edit';
  static const String settings = '/settings';
  static const String credentials = '/settings/credentials';
  static const String dataManagement = '/settings/data';
  static const String search = '/search';
}
```

#### Navigation State Management
```dart
// Using Riverpod for navigation state
final navigationStateProvider = StateNotifierProvider<NavigationState, NavigationData>();
final currentTabProvider = StateProvider<TabIndex>();
final modalStackProvider = StateProvider<List<ModalRoute>>();
```

### 2. Responsive Design Considerations

#### Breakpoints
- **Mobile Portrait**: < 600px (Primary design target)
- **Mobile Landscape**: 600px - 960px (Optimized layouts)
- **Tablet**: 960px - 1280px (Split view options)
- **Desktop**: > 1280px (Multi-panel layouts)

#### Adaptive Navigation
- **Mobile**: Bottom tabs + modal navigation
- **Tablet**: Side navigation drawer + bottom tabs
- **Desktop**: Permanent side navigation + top tabs

### 3. Accessibility Implementation

#### Screen Reader Support
- Semantic labels for all interactive elements
- Proper heading hierarchy
- Focus management for modals and navigation
- Context announcements for dynamic content

#### Keyboard Navigation
- Tab order optimization
- Keyboard shortcuts for power users
- Focus visible indicators
- Escape key handling for modals

#### Visual Accessibility
- High contrast mode support
- Text scaling compliance
- Color-blind friendly indicators
- Reduced motion options

### 4. Performance Optimizations

#### Virtual Scrolling
- Message lists with large histories
- Provider and tool grids
- Search results pagination
- Workflow canvas optimization

#### State Management
- Selective re-rendering with Riverpod
- Memoization for expensive computations
- Background processing for data operations
- Smart caching strategies

#### Memory Management
- Image caching and compression
- Message content pagination
- Provider connection pooling
- Tool execution cleanup

### 5. Development Workflow

#### Component Development
1. Create atomic components in `packages/ui/lib/src/atoms/`
2. Build molecules in `packages/ui/lib/src/molecules/`
3. Compose organisms in `packages/ui/lib/src/organisms/`
4. Design templates in `packages/ui/lib/src/templates/`

#### Screen Implementation
1. Define route in router configuration
2. Create screen widget using templates
3. Implement business logic with Riverpod providers
4. Add navigation helpers and deep linking
5. Implement responsive layouts and accessibility

#### Testing Strategy
- Unit tests for navigation logic
- Widget tests for screen compositions
- Integration tests for user journeys
- Golden tests for visual consistency
- Accessibility tests for compliance

### 6. Platform-Specific Adaptations

#### iOS Specific
- Native navigation patterns (UINavigationController style)
- iOS-style modals and sheets
- Platform-appropriate animations
- Safe area handling

#### Android Specific
- Material Design 3 navigation patterns
- Android-style dialogs and snackbars
- Hardware back button handling
- Platform-appropriate transitions

---

## Conclusion

This comprehensive navigation document provides a complete blueprint for implementing Tina AI Assistant's mobile interface. The atomic design structure ensures consistency and reusability, while the detailed user journey flows guarantee a smooth and intuitive user experience.

The navigation patterns are designed to accommodate the app's complex feature set while maintaining simplicity and accessibility. The implementation notes provide clear guidance for the development team to build a robust, performant, and user-friendly mobile application.

Key success factors:
- **Consistency**: Unified design system across all screens
- **Discoverability**: Clear navigation paths and search capabilities
- **Flexibility**: Adaptable layouts for different screen sizes and orientations
- **Accessibility**: Inclusive design for all users
- **Performance**: Optimized for smooth interactions and fast loading times

This document should be updated as features evolve and user feedback is incorporated into the design process.