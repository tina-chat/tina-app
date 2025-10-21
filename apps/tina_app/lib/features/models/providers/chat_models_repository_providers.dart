import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/data/repositories/chat_models_repository_impl.dart';
import 'package:tina_app/domain/repositories/chat_models_repository.dart';
import 'package:tina_app/providers/app_providers.dart';

part 'chat_models_repository_providers.g.dart';

@riverpod
ChatModelsRepository chatModelRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);

  return ChatModelsRepositoryImpl(appDatabase);
}
