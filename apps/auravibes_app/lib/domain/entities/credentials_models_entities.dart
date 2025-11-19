import 'package:auravibes_app/domain/entities/api_model_provider.dart';
import 'package:auravibes_app/domain/entities/credentials_entities.dart';
import 'package:auravibes_app/domain/enums/chat_models_type.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'credentials_models_entities.freezed.dart';

@freezed
abstract class CredentialsModelEntity with _$CredentialsModelEntity {
  const factory CredentialsModelEntity({
    required String id,
    required String modelId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required String credentialsId,
  }) = _CredentialsModelEntity;
}

@freezed
abstract class CredentialsModelWithProviderEntity
    with _$CredentialsModelWithProviderEntity {
  const factory CredentialsModelWithProviderEntity({
    required CredentialsModelEntity credentialsModel,
    required CredentialsEntity credentials,
    required ApiModelProviderEntity modelsProvider,
  }) = _CredentialsModelWithProviderEntity;
}

@freezed
abstract class CredentialsModelsFilter with _$CredentialsModelsFilter {
  const factory CredentialsModelsFilter({
    List<String>? workspaces,
    List<CredentialsModelType>? types,
  }) = _CredentialsModelsFilter;
}

@freezed
abstract class CredentialModelToCreate with _$CredentialModelToCreate {
  const factory CredentialModelToCreate({
    required String modelId,
    required String credentialsId,
  }) = _CredentialModelToCreate;
}
