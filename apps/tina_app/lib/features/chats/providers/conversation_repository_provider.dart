import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/data/repositories/conversation_repository_impl.dart';
import 'package:tina_app/data/repositories/message_repository_impl.dart';
import 'package:tina_app/domain/repositories/conversation_repository.dart';
import 'package:tina_app/domain/repositories/message_repository.dart';
import 'package:tina_app/providers/app_providers.dart';

part 'conversation_repository_provider.g.dart';

@riverpod
ConversationRepository conversationRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);

  return ConversationRepositoryImpl(appDatabase);
}

@riverpod
MessageRepository messageRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);

  return MessageRepositoryImpl(appDatabase);
}
