import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tina_app/domain/enums/chat_models_type.dart';

part 'model_providers_entities.freezed.dart';

@freezed
abstract class ModelProviderEntity with _$ModelProviderEntity {
  const factory ModelProviderEntity({
    required int id,
    required String name,
    required ChatModelType type,
    required String key,
    String? url,
    required DateTime createdAt,
    required DateTime updatedAt,
    required int workspaceId,
  }) = _ModelProviderEntity;
}

@freezed
abstract class ModelProviderToCreate with _$ModelProviderToCreate {
  const factory ModelProviderToCreate({
    required String name,
    required ChatModelType type,
    required String key,
    required int workspaceId,
    String? url,
  }) = _ModelProviderToCreate;
}

@freezed
abstract class ModelProviderFilter with _$ModelProviderFilter {
  const factory ModelProviderFilter({
    List<int>? workspaces,
    List<ChatModelType>? types,
  }) = _ModelProviderFilter;
}
