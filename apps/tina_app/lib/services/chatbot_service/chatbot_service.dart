import 'dart:convert';

import 'package:collection/collection.dart';
import 'package:langchain/langchain.dart';
import 'package:langchain_anthropic/langchain_anthropic.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:tina_app/domain/entities/chat_models_entities.dart';
import 'package:tina_app/domain/enums/chat_models_type.dart';
import 'package:tina_app/services/chatbot_service/models/chat_message_models.dart';

List<AIChatMessageToolCall>? safeDecode(String? metadata) {
  if (metadata == null) return null;
  final jsonMap = jsonDecode(metadata);

  if (jsonMap is! Map<String, dynamic>) {
    return null;
  }
  if (jsonMap.containsKey('tool_responses') &&
      jsonMap['tool_responses'] is List<Map<String, dynamic>>) {
    return (jsonMap['tool_responses'] as List<Map<String, dynamic>>)
        .map(AIChatMessageToolCall.fromMap)
        .toList();
  }
  return null;
}

class ChatbotService {
  ChatModelWithProviderEntity chatProvider;
  List<ToolSpec>? tools;

  ChatbotService(this.chatProvider, {this.tools});

  Stream<ChatResult> sendMessage(
    List<ChatbotMessage> messages, {
    List<ToolSpec>? tools,
  }) {
    final chatMessages = messages.map((message) {
      return switch (message) {
        ChatbotMessageHumanText(:final message) => [
          ChatMessage.humanText(message),
        ],
        ChatbotMessageAI(:final message, :final toolCalls) => [
          ChatMessage.ai(
            message,
            toolCalls: toolCalls.map((tool) => tool.toAIChat()).toList(),
          ),
          for (var response in toolCalls.where(
            (element) => element.responseRaw != null,
          ))
            ChatMessage.tool(
              toolCallId: response.id,
              content: response.responseRaw!,
            ),
        ],
      };
    }).flattenedToList;

    final chatModel = _getChatModel(tools: this.tools ?? tools);

    return chatModel.stream(
      PromptValue.chat(chatMessages),
      options: _getModelOptions(),
    );
  }

  Future<String> generateTitle(String firstMessage) async {
    final chatModel = _getChatModel();

    final prompt = PromptValue.chat([
      ChatMessage.humanText(
        'Generate a short, concise title (max 5 words) for a conversation that starts with this message: "$firstMessage". '
        'The title should capture the main topic or theme. Respond with only the title, no quotes or extra text.',
      ),
    ]);

    try {
      final result = await chatModel.invoke(
        prompt,
        options: _getModelOptions(),
      );
      String title = result.outputAsString.trim();

      // Clean up the title
      if (title.startsWith('"') && title.endsWith('"')) {
        title = title.substring(1, title.length - 1);
      }
      if (title.startsWith("'") && title.endsWith("'")) {
        title = title.substring(1, title.length - 1);
      }
      if (title.startsWith('Title:')) {
        title = title.substring(6).trim();
      }
      if (title.startsWith('Conversation:')) {
        title = title.substring(13).trim();
      }

      // Ensure title is not empty and not too long
      if (title.isEmpty) {
        title = _generateFallbackTitle(firstMessage);
      } else if (title.length > 50) {
        title = '${title.substring(0, 47)}...';
      }

      return title;
    } catch (e) {
      return _generateFallbackTitle(firstMessage);
    }
  }

  String _generateFallbackTitle(String message) {
    final words = message
        .split(' ')
        .where((word) => word.isNotEmpty)
        .take(4)
        .join(' ');
    return words.length > 30 ? '${words.substring(0, 27)}...' : words;
  }

  ChatModelOptions _getModelOptions() {
    return switch (chatProvider.modelProvider.type) {
      ChatModelType.openai => ChatOpenAIOptions(
        model: chatProvider.chatModel.modelId,
      ),
      ChatModelType.anthropic => ChatAnthropicOptions(
        model: chatProvider.chatModel.modelId,
      ),
    };
  }

  BaseChatModel _getChatModel({List<ToolSpec>? tools}) {
    return switch (chatProvider.modelProvider.type) {
      ChatModelType.openai => ChatOpenAI(
        apiKey: chatProvider.modelProvider.key,
        baseUrl: chatProvider.modelProvider.url ?? 'https://api.openai.com/v1',
        defaultOptions: ChatOpenAIOptions(
          model: chatProvider.chatModel.modelId,
          tools: tools,
        ),
      ),
      ChatModelType.anthropic => ChatAnthropic(
        apiKey: chatProvider.modelProvider.key,
        baseUrl:
            chatProvider.modelProvider.url ?? 'https://api.anthropic.com/v1',
        defaultOptions: ChatAnthropicOptions(
          model: chatProvider.chatModel.modelId,
          tools: tools,
        ),
      ),
    };
  }
}
