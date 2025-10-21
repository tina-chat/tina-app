// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_models_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(listModels)
const listModelsProvider = ListModelsProvider._();

final class ListModelsProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ChatModelEntity>>,
          List<ChatModelEntity>,
          FutureOr<List<ChatModelEntity>>
        >
    with
        $FutureModifier<List<ChatModelEntity>>,
        $FutureProvider<List<ChatModelEntity>> {
  const ListModelsProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listModelsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listModelsHash();

  @$internal
  @override
  $FutureProviderElement<List<ChatModelEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ChatModelEntity>> create(Ref ref) {
    return listModels(ref);
  }
}

String _$listModelsHash() => r'3f66aba5437aad05765f3dd89bcd87fe31c5c201';
