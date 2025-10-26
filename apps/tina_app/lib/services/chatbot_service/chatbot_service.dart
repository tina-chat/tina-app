import 'package:langchain/langchain.dart';
import 'package:langchain_anthropic/langchain_anthropic.dart';
import 'package:langchain_openai/langchain_openai.dart';
import 'package:tina_app/domain/entities/chat_models_entities.dart';
import 'package:tina_app/domain/enums/chat_models_type.dart';

class ChatbotService {
  ChatModelWithProviderEntity chatProvider;

  ChatbotService(this.chatProvider);

  Stream<ChatResult> sendMessage(String text) {
    final messages = [ChatMessage.humanText(text)];

    final chatModel = getChatModel();

    return chatModel.stream(
      PromptValue.chat(messages),
      options: _getModelOptions(),
    );
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

  BaseChatModel getChatModel() {
    return switch (chatProvider.modelProvider.type) {
      ChatModelType.openai => ChatOpenAI(
        apiKey: chatProvider.modelProvider.key,
        baseUrl: chatProvider.modelProvider.url ?? 'https://api.openai.com/v1',
      ),
      ChatModelType.anthropic => ChatAnthropic(
        apiKey: chatProvider.modelProvider.key,
        baseUrl:
            chatProvider.modelProvider.url ?? 'https://api.anthropic.com/v1',
      ),
    };
  }
}
