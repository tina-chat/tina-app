import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tina_app/domain/entities/model_providers_entities.dart';
import 'package:tina_app/domain/enums/chat_models_type.dart';

part 'chat_models_entities.freezed.dart';

@freezed
abstract class ChatModelEntity with _$ChatModelEntity {
  const factory ChatModelEntity({
    required String id,
    required String displayName,
    required String modelId,
    required String modelType,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String modelProviderId,
  }) = _ChatModelEntity;
}

@freezed
abstract class ChatModelWithProviderEntity with _$ChatModelWithProviderEntity {
  const factory ChatModelWithProviderEntity({
    required ChatModelEntity chatModel,
    required ModelProviderEntity modelProvider,
  }) = _ChatModelWithProviderEntity;
}

@freezed
abstract class ChatModelsFilter with _$ChatModelsFilter {
  const factory ChatModelsFilter({
    List<String>? workspaces,
    List<ChatModelType>? types,
  }) = _ChatModelsFilter;
}

@freezed
abstract class ChatModelToCreate with _$ChatModelToCreate {
  const factory ChatModelToCreate({
    required String displayName,
    required String modelId,
    required String modelType,
    required String modelProviderId,
  }) = _ChatModelToCreate;
}
