import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:langchain/langchain.dart';

part 'chat_message_models.freezed.dart';

@freezed
abstract class ChatbotToolCall with _$ChatbotToolCall {
  const ChatbotToolCall._();

  const factory ChatbotToolCall({
    required String id,
    required String name,
    required Map<String, dynamic> arguments,
    required String argumentsRaw,
    String? responseRaw,
  }) = _ChatbotToolCall;

  AIChatMessageToolCall toAIChat() {
    return AIChatMessageToolCall(
      arguments: arguments,
      argumentsRaw: argumentsRaw,
      id: id,
      name: name,
    );
  }
}

@freezed
sealed class ChatbotMessage with _$ChatbotMessage {
  const factory ChatbotMessage.humanText(String message) =
      ChatbotMessageHumanText;
  const factory ChatbotMessage.ai({
    required String message,
    required List<ChatbotToolCall> toolCalls,
  }) = ChatbotMessageAI;
}
