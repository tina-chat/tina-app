import 'package:auravibes_app/domain/entities/chat_models_entities.dart';
import 'package:auravibes_app/services/chatbot_service/chatbot_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'chatbot_service_provider.g.dart';

/// Provider that creates a ChatbotService without tools
/// (for title generation, etc.)
@riverpod
ChatbotService chatbotService(
  Ref ref,
  ChatModelWithProviderEntity modelProvider,
) {
  return ChatbotService(modelProvider);
}
