import 'package:auravibes_app/domain/enums/chat_models_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'model_providers_entities.freezed.dart';

@freezed
abstract class ModelProviderEntity with _$ModelProviderEntity {
  const factory ModelProviderEntity({
    required String id,
    required String name,
    required ChatModelType type,
    required String key,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String workspaceId,
    String? url,
  }) = _ModelProviderEntity;
}

@freezed
abstract class ModelProviderToCreate with _$ModelProviderToCreate {
  const factory ModelProviderToCreate({
    required String name,
    required ChatModelType type,
    required String key,
    required String workspaceId,
    String? url,
  }) = _ModelProviderToCreate;
}

@freezed
abstract class ModelProviderFilter with _$ModelProviderFilter {
  const factory ModelProviderFilter({
    List<String>? workspaces,
    List<ChatModelType>? types,
  }) = _ModelProviderFilter;
}
