// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_model_provider_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddModelProviderState)
const addModelProviderStateProvider = AddModelProviderStateProvider._();

final class AddModelProviderStateProvider
    extends $NotifierProvider<AddModelProviderState, AddModelProviderModel> {
  const AddModelProviderStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addModelProviderStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addModelProviderStateHash();

  @$internal
  @override
  AddModelProviderState create() => AddModelProviderState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddModelProviderModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddModelProviderModel>(value),
    );
  }
}

String _$addModelProviderStateHash() =>
    r'f5ea0d9abffbaf210116ad903a9cff995c6b02a1';

abstract class _$AddModelProviderState
    extends $Notifier<AddModelProviderModel> {
  AddModelProviderModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddModelProviderModel, AddModelProviderModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddModelProviderModel, AddModelProviderModel>,
              AddModelProviderModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
