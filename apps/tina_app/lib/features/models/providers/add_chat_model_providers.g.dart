// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_chat_model_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(AddChatModelState)
const addChatModelStateProvider = AddChatModelStateProvider._();

final class AddChatModelStateProvider
    extends $NotifierProvider<AddChatModelState, AddChatModelModel> {
  const AddChatModelStateProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'addChatModelStateProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$addChatModelStateHash();

  @$internal
  @override
  AddChatModelState create() => AddChatModelState();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AddChatModelModel value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AddChatModelModel>(value),
    );
  }
}

String _$addChatModelStateHash() => r'90ed492fca207a6dc43135faa1a41e8c6b26ea6e';

abstract class _$AddChatModelState extends $Notifier<AddChatModelModel> {
  AddChatModelModel build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AddChatModelModel, AddChatModelModel>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AddChatModelModel, AddChatModelModel>,
              AddChatModelModel,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
