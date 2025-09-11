# Chat Domain

Chat domain layer with entities, value objects, and repository interfaces following Domain-Driven Design (DDD) principles.

This package contains the core business logic for chat functionality in the Tina AI Assistant, including chat conversations, messages, and their associated business rules.

## Features

- **Pure Dart Domain Logic**: No Flutter dependencies, ensuring clean separation of concerns
- **DDD Principles**: Entities, value objects, aggregates, and repository interfaces
- **Type-Safe Identifiers**: Strongly-typed IDs for chats and messages
- **Rich Domain Events**: Events for chat and message lifecycle tracking
- **Comprehensive Business Rules**: Message validation, chat state management
- **Immutable Entities**: All domain objects are immutable for thread safety

## Architecture

This package follows the Domain-Driven Design (DDD) approach with:

### Entities
- **Chat**: Aggregate root representing a conversation
- **Message**: Entity representing individual messages within a chat

### Value Objects
- **ChatId**: Unique identifier for chats
- **MessageId**: Unique identifier for messages  
- **MessageRole**: Enum for message sender roles (user, assistant, system, tool)
- **MessageStatus**: Enum for message states (pending, sent, streaming, failed, cancelled)

### Repository Interfaces
- **ChatRepository**: Contract for chat persistence operations

### Domain Events
- **Chat Events**: ChatCreated, ChatUpdated, ChatDeleted, ChatTitleUpdated
- **Message Events**: MessageSent, MessageUpdated, MessageDeleted, MessageStreamingStarted, etc.

## Usage

### Creating a Chat

```dart
import 'package:chat_domain/chat_domain.dart';

// Create a new chat
final chat = Chat.create(title: 'My AI Conversation');

// Create with custom ID and workflow
final customChat = Chat.create(
  title: 'Custom Chat',
  id: ChatId.fromString('custom-id'),
  workflowId: 'workflow-123',
);
```

### Working with Messages

```dart
// Create a user message
final userMessage = Message.createUser(
  chatId: chat.id,
  content: 'Hello, AI assistant!',
);

// Create an assistant message
final assistantMessage = Message.createAssistant(
  chatId: chat.id,
  content: 'Hello! How can I help you today?',
  backendId: 'openai-gpt4',
  backendType: 'llm',
);

// Create a system message
final systemMessage = Message.createSystem(
  chatId: chat.id,
  content: 'You are a helpful AI assistant.',
);

// Add messages to chat
final updatedChat = chat
    .addMessage(userMessage)
    .addMessage(assistantMessage);
```

### Message State Management

```dart
// Update message content (for streaming)
final updatedMessage = message.updateContent('Updated content...');

// Update message status
final sentMessage = message.updateStatus(MessageStatus.sent);

// Convenience methods
final completedMessage = message.markAsCompleted();
final failedMessage = message.markAsFailed();
final cancelledMessage = message.markAsCancelled();
```

### Chat Management

```dart
// Update chat title
final renamedChat = chat.updateTitle('New Chat Title');

// Associate with workflow
final workflowChat = chat.associateWorkflow('workflow-456');

// Query chat state
print('Message count: ${chat.messageCount}');
print('Has messages: ${chat.hasMessages}');
print('Last message: ${chat.lastMessage?.content}');
print('Preview: ${chat.preview}');

// Filter messages
final userMessages = chat.userMessages;
final assistantMessages = chat.assistantMessages;
final streamingMessages = chat.streamingMessages;
```

### Domain Events

```dart
// Create domain events
final chatCreated = ChatCreated(
  chat: chat,
  timestamp: DateTime.now(),
);

final messageSent = MessageSent(
  message: userMessage,
  timestamp: DateTime.now(),
);

// Events can be published to an event bus for cross-cutting concerns
```

### Repository Usage

```dart
// Define repository implementation (in infrastructure layer)
class MyChatRepository implements ChatRepository {
  @override
  Future<Result<Chat>> getChat(ChatId id) async {
    // Implementation details...
  }
  
  @override
  Future<Result<List<Chat>>> getAllChats({bool includeMessages = false}) async {
    // Implementation details...
  }
  
  // ... other methods
}
```

## Dependencies

- **tina_core**: Core utilities and base types
- **equatable**: Value equality for domain objects

## Testing

The package includes comprehensive tests covering:

- Value object validation and equality
- Entity business rules and state transitions
- Domain event creation and properties
- Integration scenarios

Run tests with:

```bash
dart test
```

## Architecture Compliance

This package strictly follows the domain layer principles:

- ✅ No external dependencies (except core utilities)
- ✅ No Flutter dependencies
- ✅ Pure business logic only
- ✅ Immutable domain objects
- ✅ Rich domain model with behavior
- ✅ Clear aggregate boundaries
- ✅ Repository interfaces (not implementations)

## Contributing

This package is part of the Tina AI Assistant monorepo. See the main project documentation for contribution guidelines.
