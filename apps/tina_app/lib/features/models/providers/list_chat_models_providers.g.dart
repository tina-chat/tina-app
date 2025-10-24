// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_chat_models_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(listChatModelProviders)
const listChatModelProvidersProvider = ListChatModelProvidersProvider._();

final class ListChatModelProvidersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ChatModelWithProviderEntity>>,
          List<ChatModelWithProviderEntity>,
          FutureOr<List<ChatModelWithProviderEntity>>
        >
    with
        $FutureModifier<List<ChatModelWithProviderEntity>>,
        $FutureProvider<List<ChatModelWithProviderEntity>> {
  const ListChatModelProvidersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listChatModelProvidersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listChatModelProvidersHash();

  @$internal
  @override
  $FutureProviderElement<List<ChatModelWithProviderEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ChatModelWithProviderEntity>> create(Ref ref) {
    return listChatModelProviders(ref);
  }
}

String _$listChatModelProvidersHash() =>
    r'a68063dd249c6cc5ac608a3dfb6de45f2f26a5a8';
