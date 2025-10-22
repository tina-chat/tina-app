import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/data/repositories/chat_model_repository_impl.dart';
import 'package:tina_app/data/repositories/model_providers_repository_impl.dart';
import 'package:tina_app/domain/repositories/chat_models_repository.dart';
import 'package:tina_app/domain/repositories/model_providers_repository.dart';
import 'package:tina_app/providers/app_providers.dart';

part 'model_providers_repository_providers.g.dart';

@riverpod
ModelProvidersRepository modelProvidersRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);

  return ModelProvidersRepositoryImpl(appDatabase);
}

@riverpod
ChatModelsRepository chatModelsRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);

  return ChatModelsRepositoryImpl(appDatabase);
}
