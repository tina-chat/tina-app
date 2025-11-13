import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/domain/entities/chat_models_entities.dart';
import 'package:tina_app/services/chatbot_service/chatbot_service.dart';

part 'chatbot_service_provider.g.dart';

/// Provider that creates a ChatbotService without tools (for title generation, etc.)
@riverpod
ChatbotService chatbotService(
  Ref ref,
  ChatModelWithProviderEntity modelProvider,
) {
  return ChatbotService(modelProvider);
}
