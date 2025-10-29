import 'package:freezed_annotation/freezed_annotation.dart';

import '../enums/message_types.dart';

part 'conversation.freezed.dart';

/// Entity representing a conversation in the Tina application.
///
/// A conversation is a container for organizing and managing
/// chat messages within a specific workspace.
///
@freezed
abstract class ConversationEntity with _$ConversationEntity {
  const ConversationEntity._();
  const factory ConversationEntity({
    /// Unique identifier for the conversation
    required String id,

    /// Human-readable title of the conversation
    required String title,

    /// ID of the workspace this conversation belongs to
    required String workspaceId,

    /// ID of the AI model used for this conversation
    final String? modelId,

    /// Whether this conversation is pinned
    required bool isPinned,

    /// Timestamp when the conversation was created
    required DateTime createdAt,

    /// Timestamp when the conversation was last updated
    required DateTime updatedAt,
  }) = _ConversationEntity;

  /// Returns true if the conversation has a valid title
  bool get hasValidTitle => title.isNotEmpty;

  /// Returns true if the conversation is in a valid state
  bool get isValid {
    return hasValidTitle && workspaceId.isNotEmpty;
  }
}

@freezed
abstract class ConversationToCreate with _$ConversationToCreate {
  const ConversationToCreate._();
  const factory ConversationToCreate({
    /// Human-readable title of the conversation
    required String title,

    /// ID of the workspace this conversation belongs to
    required String workspaceId,

    /// ID of the AI model used for this conversation
    final String? modelId,

    /// Whether this conversation is pinned
    final bool? isPinned,
  }) = _ConversationToCreate;

  /// Returns true if the conversation has a valid title
  bool get hasValidTitle => title.isNotEmpty;

  /// Returns true if the conversation is in a valid state
  bool get isValid {
    return hasValidTitle && workspaceId.isNotEmpty;
  }
}

@freezed
abstract class ConversationToUpdate with _$ConversationToUpdate {
  const ConversationToUpdate._();
  const factory ConversationToUpdate({
    /// Human-readable title of the conversation
    final String? title,

    /// ID of the AI model used for this conversation
    final String? modelId,

    /// Whether this conversation is pinned
    final bool? isPinned,
  }) = _ConversationToUpdate;

  bool get isValid {
    if (title != null && title!.isEmpty) return false;
    if (modelId != null && modelId!.isEmpty) return false;
    return title != null || modelId != null || isPinned != null;
  }
}

/// Entity representing a message in a conversation.
///
/// A message contains the actual content and metadata
/// for communication within a conversation.
@freezed
abstract class MessageEntity with _$MessageEntity {
  const MessageEntity._();
  const factory MessageEntity({
    /// Unique identifier for the message
    required String id,

    /// ID of the conversation this message belongs to
    required String conversationId,

    /// Content of the message (JSON structure based on message type)
    required String content,

    /// Type of the message
    required MessageType messageType,

    /// Whether this message was sent by the user
    required bool isUser,

    /// Status of the message
    required MessageStatus status,

    /// Additional metadata for the message (JSON)
    final String? metadata,

    /// Timestamp when the message was created
    required DateTime createdAt,

    /// Timestamp when the message was last updated
    required DateTime updatedAt,
  }) = _MessageEntity;

  /// Returns true if the message has valid content
  bool get hasValidContent => content.isNotEmpty;

  /// Returns true if the message is in a valid state
  bool get isValid {
    return hasValidContent && conversationId.isNotEmpty;
  }
}

/// Entity for creating a new message
@freezed
abstract class MessageToCreate with _$MessageToCreate {
  const MessageToCreate._();

  /// Creates a new MessageToCreate instance
  const factory MessageToCreate({
    /// ID of the conversation this message belongs to
    required String conversationId,

    /// Content of the message (JSON structure based on message type)
    required String content,

    /// Type of the message
    required MessageType messageType,

    /// Whether this message was sent by the user
    required bool isUser,

    /// Additional metadata for the message (JSON)
    final String? metadata,

    required MessageStatus status,
  }) = _MessageToCreate;

  /// Returns true if the message has valid content
  bool get hasValidContent {
    return !(status == MessageStatus.sent && content.isNotEmpty);
  }

  /// Returns true if the message is in a valid state
  bool get isValid {
    return hasValidContent && conversationId.isNotEmpty;
  }
}

/// Entity for creating a new message
@freezed
abstract class MessageToUpdate with _$MessageToUpdate {
  const MessageToUpdate._();

  /// Creates a new MessageToUpdate instance
  const factory MessageToUpdate({
    /// Content of the message (JSON structure based on message type)
    final String? content,

    /// Additional metadata for the message (JSON)
    final String? metadata,

    final MessageStatus? status,
  }) = _MessageToUpdate;

  /// Returns true if the message is in a valid state
  bool get isValid {
    return content != null || metadata != null || status != null;
  }
}
