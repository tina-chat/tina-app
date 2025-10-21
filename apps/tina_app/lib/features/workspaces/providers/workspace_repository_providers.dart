import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/data/repositories/workspace_repository_impl.dart';
import 'package:tina_app/domain/repositories/workspace_repository.dart';
import 'package:tina_app/providers/app_providers.dart';

part 'workspace_repository_providers.g.dart';

@riverpod
WorkspaceRepository workspaceRepository(Ref ref) {
  final appDatabase = ref.watch(appDatabaseProvider);

  return WorkspaceRepositoryImpl(appDatabase);
}
