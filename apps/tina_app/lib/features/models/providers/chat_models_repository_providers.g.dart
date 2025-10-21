// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_models_repository_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(chatModelRepository)
const chatModelRepositoryProvider = ChatModelRepositoryProvider._();

final class ChatModelRepositoryProvider
    extends
        $FunctionalProvider<
          ChatModelsRepository,
          ChatModelsRepository,
          ChatModelsRepository
        >
    with $Provider<ChatModelsRepository> {
  const ChatModelRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatModelRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatModelRepositoryHash();

  @$internal
  @override
  $ProviderElement<ChatModelsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ChatModelsRepository create(Ref ref) {
    return chatModelRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatModelsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatModelsRepository>(value),
    );
  }
}

String _$chatModelRepositoryHash() =>
    r'0c5a7f0ae866e6c5e5d648335a91cc68029c7474';
