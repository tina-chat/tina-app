import 'package:chat_domain/chat_domain.dart';

void main() {
  // Example usage of the chat domain package
  print('=== Chat Domain Example ===');

  // Create a new chat
  final chat = Chat.create(title: 'Example Chat');
  print('Created chat: ${chat.title} (ID: ${chat.id})');

  // Create a user message
  final userMessage = Message.createUser(
    chatId: chat.id,
    content: 'Hello, AI assistant!',
  );
  print('User message: ${userMessage.content}');

  // Create an assistant message
  final assistantMessage = Message.createAssistant(
    chatId: chat.id,
    content: 'Hello! How can I help you today?',
    backendId: 'example-backend',
    backendType: 'llm',
  );
  print('Assistant message: ${assistantMessage.content}');

  // Add messages to chat
  final chatWithMessages = chat
      .addMessage(userMessage)
      .addMessage(assistantMessage);

  print('Chat has ${chatWithMessages.messageCount} messages');
  print('Last message: ${chatWithMessages.lastMessage?.content}');
  print('Preview: ${chatWithMessages.preview}');

  // Demonstrate message status updates
  final completedMessage = assistantMessage.markAsCompleted();
  print('Message status: ${completedMessage.status}');

  // Demonstrate domain events
  final chatCreated = ChatCreated(
    chat: chat,
    timestamp: DateTime.now(),
  );
  print('Domain event: ${chatCreated.toString()}');

  print('=== Example completed successfully! ===');
}