/// Chat domain layer with entities, value objects, and repository interfaces
/// following Domain-Driven Design (DDD) principles.
///
/// This package contains the core business logic for chat functionality,
/// including chat conversations, messages, and their associated business rules.
library;

// Entities
export 'src/entities/chat.dart';
export 'src/entities/message.dart';

// Value Objects
export 'src/value_objects/chat_id.dart';
export 'src/value_objects/message_id.dart';
export 'src/value_objects/message_role.dart';
export 'src/value_objects/message_status.dart';

// Repository Interfaces
export 'src/repositories/chat_repository.dart';

// Domain Events
export 'src/events/chat_events.dart';
export 'src/events/message_events.dart';
