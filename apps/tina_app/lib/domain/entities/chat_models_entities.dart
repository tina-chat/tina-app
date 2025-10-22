import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_models_entities.freezed.dart';

@freezed
abstract class ChatModelEntity with _$ChatModelEntity {
  const factory ChatModelEntity({
    required int id,
    required String displayName,
    required String modelId,
    required String modelType,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int modelProviderId,
  }) = _ChatModelEntity;
}

@freezed
abstract class ChatModelToCreate with _$ChatModelToCreate {
  const factory ChatModelToCreate({
    required String displayName,
    required String modelId,
    required String modelType,
    required int modelProvider,
  }) = _ChatModelToCreate;
}
