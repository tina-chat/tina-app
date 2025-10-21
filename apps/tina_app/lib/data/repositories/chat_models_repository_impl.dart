import 'package:drift/drift.dart';
import 'package:tina_app/domain/entities/chat_model_model.dart';
import '../database/drift/app_database.dart';
import '../../domain/repositories/chat_models_repository.dart';

/// Implementation of the [WorkspaceRepository] interface.
///
/// This class provides a concrete implementation of workspace data operations
/// using the Drift database. It handles the mapping between domain entities
/// and database records, and provides proper error handling using exceptions.
class ChatModelsRepositoryImpl implements ChatModelsRepository {
  final AppDatabase _database;

  ChatModelsRepositoryImpl(this._database);

  @override
  Future<ChatModelEntity> createChatModel(ChatModelToCreate workspace) async {
    final createdId = await _database.chatModelsDao.insertChatModel(
      _chatModelToCreateToCompanion(workspace),
    );

    final createdChatModel = await _database.chatModelsDao.getChatModelById(
      createdId,
    );

    if (createdChatModel == null) {
      throw ChatModelNotFoundException(createdId);
    }

    return _chatModelTableToEntity(createdChatModel);
  }

  @override
  Future<List<ChatModelEntity>> getChatModels(ChatModelFilter filter) async {
    if (filter.workspaces?.isNotEmpty != true) {
      return [];
    }
    final chatModels = await _database.chatModelsDao
        .getAllChatModelsByWorkspace(workspaceIds: filter.workspaces!);

    return chatModels.map(_chatModelTableToEntity).toList();
  }

  ChatModelsCompanion _chatModelToCreateToCompanion(
    ChatModelToCreate workspace,
  ) {
    return ChatModelsCompanion(
      name: Value(workspace.name),
      type: Value(workspace.type),
      keyValue: Value(workspace.key),
      url: Value(workspace.url),
      workspace: Value(workspace.workspaceId),
    );
  }

  ChatModelEntity _chatModelTableToEntity(ChatModelsTable chatModel) {
    return ChatModelEntity(
      id: chatModel.id,
      name: chatModel.name,
      type: chatModel.type,
      key: chatModel.keyValue,
      url: chatModel.url,
      createdAt: chatModel.createdAt,
      updatedAt: chatModel.updatedAt,
      workspaceId: chatModel.workspace,
    );
  }
}
