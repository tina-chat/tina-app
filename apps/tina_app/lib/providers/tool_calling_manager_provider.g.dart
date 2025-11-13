// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tool_calling_manager_provider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Map<String, dynamic> _$ToolResponseItemToJson(_ToolResponseItem instance) =>
    <String, dynamic>{'id': instance.id, 'content': instance.content};

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ToolCallingManagerNotifier)
const toolCallingManagerProvider = ToolCallingManagerNotifierProvider._();

final class ToolCallingManagerNotifierProvider
    extends $NotifierProvider<ToolCallingManagerNotifier, List<ToolExecution>> {
  const ToolCallingManagerNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'toolCallingManagerProvider',
        isAutoDispose: false,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$toolCallingManagerNotifierHash();

  @$internal
  @override
  ToolCallingManagerNotifier create() => ToolCallingManagerNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(List<ToolExecution> value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<List<ToolExecution>>(value),
    );
  }
}

String _$toolCallingManagerNotifierHash() =>
    r'1ef6fa8de1f34b4021405363d43a77161f89cd9a';

abstract class _$ToolCallingManagerNotifier
    extends $Notifier<List<ToolExecution>> {
  List<ToolExecution> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<List<ToolExecution>, List<ToolExecution>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<List<ToolExecution>, List<ToolExecution>>,
              List<ToolExecution>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
