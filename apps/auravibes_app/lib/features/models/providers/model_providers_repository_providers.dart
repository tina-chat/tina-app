import 'package:auravibes_app/data/repositories/credentials_model_repository_impl.dart';
import 'package:auravibes_app/data/repositories/credentials_repository_impl.dart';
import 'package:auravibes_app/domain/repositories/chat_models_repository.dart';
import 'package:auravibes_app/domain/repositories/model_providers_repository.dart';
import 'package:auravibes_app/providers/app_providers.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'model_providers_repository_providers.g.dart';

@riverpod
CredentialsRepository modelProvidersRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);

  return CredentialsRepositoryImpl(appDatabase);
}

@riverpod
CredentialsModelsRepository credentialsModelsRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);

  return CredentialsModelsRepositoryImpl(appDatabase);
}
