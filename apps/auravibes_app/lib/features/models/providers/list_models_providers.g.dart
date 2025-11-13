// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'list_models_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(listModelProviders)
const listModelProvidersProvider = ListModelProvidersProvider._();

final class ListModelProvidersProvider
    extends
        $FunctionalProvider<
          AsyncValue<List<ModelProviderEntity>>,
          List<ModelProviderEntity>,
          FutureOr<List<ModelProviderEntity>>
        >
    with
        $FutureModifier<List<ModelProviderEntity>>,
        $FutureProvider<List<ModelProviderEntity>> {
  const ListModelProvidersProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'listModelProvidersProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$listModelProvidersHash();

  @$internal
  @override
  $FutureProviderElement<List<ModelProviderEntity>> $createElement(
    $ProviderPointer pointer,
  ) => $FutureProviderElement(pointer);

  @override
  FutureOr<List<ModelProviderEntity>> create(Ref ref) {
    return listModelProviders(ref);
  }
}

String _$listModelProvidersHash() =>
    r'4775799687a6817f7430c3b75ea6edcf9ff0a8ca';
