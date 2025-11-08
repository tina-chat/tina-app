// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'workspace_tools_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(workspaceToolsRepository)
const workspaceToolsRepositoryProvider = WorkspaceToolsRepositoryProvider._();

final class WorkspaceToolsRepositoryProvider
    extends
        $FunctionalProvider<
          WorkspaceToolsRepository,
          WorkspaceToolsRepository,
          WorkspaceToolsRepository
        >
    with $Provider<WorkspaceToolsRepository> {
  const WorkspaceToolsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workspaceToolsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workspaceToolsRepositoryHash();

  @$internal
  @override
  $ProviderElement<WorkspaceToolsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  WorkspaceToolsRepository create(Ref ref) {
    return workspaceToolsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkspaceToolsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkspaceToolsRepository>(value),
    );
  }
}

String _$workspaceToolsRepositoryHash() =>
    r'05b45d859d765fce6925970a59333568bd0be637';

@ProviderFor(workspaceToolIndexNotifier)
const workspaceToolIndexProvider = WorkspaceToolIndexNotifierProvider._();

final class WorkspaceToolIndexNotifierProvider
    extends $FunctionalProvider<int, int, int>
    with $Provider<int> {
  const WorkspaceToolIndexNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workspaceToolIndexProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[],
        $allTransitiveDependencies: const <ProviderOrFamily>[],
      );

  @override
  String debugGetCreateSourceHash() => _$workspaceToolIndexNotifierHash();

  @$internal
  @override
  $ProviderElement<int> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  int create(Ref ref) {
    return workspaceToolIndexNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(int value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<int>(value),
    );
  }
}

String _$workspaceToolIndexNotifierHash() =>
    r'd73774534b1ad72a1f843ffde7301d9a87ae9b97';

@ProviderFor(WorkspaceToolsNotifier)
const workspaceToolsProvider = WorkspaceToolsNotifierProvider._();

final class WorkspaceToolsNotifierProvider
    extends
        $AsyncNotifierProvider<WorkspaceToolsNotifier, List<WorkspaceTool>> {
  const WorkspaceToolsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workspaceToolsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$workspaceToolsNotifierHash();

  @$internal
  @override
  WorkspaceToolsNotifier create() => WorkspaceToolsNotifier();
}

String _$workspaceToolsNotifierHash() =>
    r'3425f60e25531df13e107442a0f240f6cadf3b5c';

abstract class _$WorkspaceToolsNotifier
    extends $AsyncNotifier<List<WorkspaceTool>> {
  FutureOr<List<WorkspaceTool>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<WorkspaceTool>>, List<WorkspaceTool>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<WorkspaceTool>>, List<WorkspaceTool>>,
              AsyncValue<List<WorkspaceTool>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(workspaceToolRow)
const workspaceToolRowProvider = WorkspaceToolRowProvider._();

final class WorkspaceToolRowProvider
    extends $FunctionalProvider<WorkspaceTool?, WorkspaceTool?, WorkspaceTool?>
    with $Provider<WorkspaceTool?> {
  const WorkspaceToolRowProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'workspaceToolRowProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[workspaceToolIndexProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          WorkspaceToolRowProvider.$allTransitiveDependencies0,
        ],
      );

  static const $allTransitiveDependencies0 = workspaceToolIndexProvider;

  @override
  String debugGetCreateSourceHash() => _$workspaceToolRowHash();

  @$internal
  @override
  $ProviderElement<WorkspaceTool?> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  WorkspaceTool? create(Ref ref) {
    return workspaceToolRow(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(WorkspaceTool? value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<WorkspaceTool?>(value),
    );
  }
}

String _$workspaceToolRowHash() => r'bcf968412f4c082c55edb56652a30aea119aa916';
