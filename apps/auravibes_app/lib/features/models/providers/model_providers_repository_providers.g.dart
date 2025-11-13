// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'model_providers_repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(modelProvidersRepository)
const modelProvidersRepositoryProvider = ModelProvidersRepositoryProvider._();

final class ModelProvidersRepositoryProvider
    extends
        $FunctionalProvider<
          ModelProvidersRepository,
          ModelProvidersRepository,
          ModelProvidersRepository
        >
    with $Provider<ModelProvidersRepository> {
  const ModelProvidersRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'modelProvidersRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$modelProvidersRepositoryHash();

  @$internal
  @override
  $ProviderElement<ModelProvidersRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ModelProvidersRepository create(Ref ref) {
    return modelProvidersRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ModelProvidersRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ModelProvidersRepository>(value),
    );
  }
}

String _$modelProvidersRepositoryHash() =>
    r'6051a7c5398da8a61b5fc1d7638453a5e036edd7';

@ProviderFor(chatModelsRepository)
const chatModelsRepositoryProvider = ChatModelsRepositoryProvider._();

final class ChatModelsRepositoryProvider
    extends
        $FunctionalProvider<
          ChatModelsRepository,
          ChatModelsRepository,
          ChatModelsRepository
        >
    with $Provider<ChatModelsRepository> {
  const ChatModelsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatModelsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatModelsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ChatModelsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatModelsRepository create(Ref ref) {
    return chatModelsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatModelsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatModelsRepository>(value),
    );
  }
}

String _$chatModelsRepositoryHash() =>
    r'0970f1e250860672b8eda3e5f4b3cddfe079697f';
