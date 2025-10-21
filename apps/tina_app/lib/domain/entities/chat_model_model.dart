import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tina_app/domain/enums/chat_models_type.dart';

part 'chat_model_model.freezed.dart';

@freezed
abstract class ChatModelEntity with _$ChatModelEntity {
  const factory ChatModelEntity({
    required int id,
    required String name,
    required ChatModelType type,
    required String key,
    String? url,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int workspaceId,
  }) = _ChatModelEntity;
}

@freezed
abstract class ChatModelToCreate with _$ChatModelToCreate {
  const factory ChatModelToCreate({
    required String name,
    required ChatModelType type,
    required String key,
    required int workspaceId,
    String? url,
  }) = _ChatModelToCreate;
}

@freezed
abstract class ChatModelFilter with _$ChatModelFilter {
  const factory ChatModelFilter({
    List<int>? workspaces,
    List<ChatModelType>? types,
  }) = _ChatModelFilter;
}
