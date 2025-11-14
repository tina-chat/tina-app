// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_tools_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(conversationToolsRepository)
const conversationToolsRepositoryProvider =
    ConversationToolsRepositoryProvider._();

final class ConversationToolsRepositoryProvider
    extends
        $FunctionalProvider<
          ConversationToolsRepository,
          ConversationToolsRepository,
          ConversationToolsRepository
        >
    with $Provider<ConversationToolsRepository> {
  const ConversationToolsRepositoryProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'conversationToolsRepositoryProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$conversationToolsRepositoryHash();

  @$internal
  @override
  $ProviderElement<ConversationToolsRepository> $createElement(
    $ProviderPointer pointer,
  ) => $ProviderElement(pointer);

  @override
  ConversationToolsRepository create(Ref ref) {
    return conversationToolsRepository(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ConversationToolsRepository value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ConversationToolsRepository>(value),
    );
  }
}

String _$conversationToolsRepositoryHash() =>
    r'e3e65f8c9feab2c64ec51fc9ae9464e124258a26';

@ProviderFor(ConversationToolsNotifier)
const conversationToolsProvider = ConversationToolsNotifierFamily._();

final class ConversationToolsNotifierProvider
    extends
        $AsyncNotifierProvider<
          ConversationToolsNotifier,
          Map<UserToolType, bool>
        > {
  const ConversationToolsNotifierProvider._({
    required ConversationToolsNotifierFamily super.from,
    required ({String workspaceId, String? conversationId}) super.argument,
  }) : super(
         retry: null,
         name: r'conversationToolsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$conversationToolsNotifierHash();

  @override
  String toString() {
    return r'conversationToolsProvider'
        ''
        '$argument';
  }

  @$internal
  @override
  ConversationToolsNotifier create() => ConversationToolsNotifier();

  @override
  bool operator ==(Object other) {
    return other is ConversationToolsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$conversationToolsNotifierHash() =>
    r'd9589442b8087809fcb09bf89fced706b98fc163';

final class ConversationToolsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ConversationToolsNotifier,
          AsyncValue<Map<UserToolType, bool>>,
          Map<UserToolType, bool>,
          FutureOr<Map<UserToolType, bool>>,
          ({String workspaceId, String? conversationId})
        > {
  const ConversationToolsNotifierFamily._()
    : super(
        retry: null,
        name: r'conversationToolsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ConversationToolsNotifierProvider call({
    required String workspaceId,
    String? conversationId,
  }) => ConversationToolsNotifierProvider._(
    argument: (workspaceId: workspaceId, conversationId: conversationId),
    from: this,
  );

  @override
  String toString() => r'conversationToolsProvider';
}

abstract class _$ConversationToolsNotifier
    extends $AsyncNotifier<Map<UserToolType, bool>> {
  late final _$args =
      ref.$arg as ({String workspaceId, String? conversationId});
  String get workspaceId => _$args.workspaceId;
  String? get conversationId => _$args.conversationId;

  FutureOr<Map<UserToolType, bool>> build({
    required String workspaceId,
    String? conversationId,
  });
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      workspaceId: _$args.workspaceId,
      conversationId: _$args.conversationId,
    );
    final ref =
        this.ref
            as $Ref<
              AsyncValue<Map<UserToolType, bool>>,
              Map<UserToolType, bool>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<Map<UserToolType, bool>>,
                Map<UserToolType, bool>
              >,
              AsyncValue<Map<UserToolType, bool>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(AvailableConversationToolsNotifier)
const availableConversationToolsProvider =
    AvailableConversationToolsNotifierFamily._();

final class AvailableConversationToolsNotifierProvider
    extends
        $AsyncNotifierProvider<
          AvailableConversationToolsNotifier,
          List<String>
        > {
  const AvailableConversationToolsNotifierProvider._({
    required AvailableConversationToolsNotifierFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'availableConversationToolsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() =>
      _$availableConversationToolsNotifierHash();

  @override
  String toString() {
    return r'availableConversationToolsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  AvailableConversationToolsNotifier create() =>
      AvailableConversationToolsNotifier();

  @override
  bool operator ==(Object other) {
    return other is AvailableConversationToolsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$availableConversationToolsNotifierHash() =>
    r'a60967e0164ec194e12535c24e9e503a1ec1fe9f';

final class AvailableConversationToolsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          AvailableConversationToolsNotifier,
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>,
          (String, String)
        > {
  const AvailableConversationToolsNotifierFamily._()
    : super(
        retry: null,
        name: r'availableConversationToolsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  AvailableConversationToolsNotifierProvider call((String, String) ids) =>
      AvailableConversationToolsNotifierProvider._(argument: ids, from: this);

  @override
  String toString() => r'availableConversationToolsProvider';
}

abstract class _$AvailableConversationToolsNotifier
    extends $AsyncNotifier<List<String>> {
  late final _$args = ref.$arg as (String, String);
  (String, String) get ids => _$args;

  FutureOr<List<String>> build((String, String) ids);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>>, List<String>>,
              AsyncValue<List<String>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

/// Provider to get context-aware tools for chat (conversation -> workspace -> app defaults)

@ProviderFor(ContextAwareToolsNotifier)
const contextAwareToolsProvider = ContextAwareToolsNotifierFamily._();

/// Provider to get context-aware tools for chat (conversation -> workspace -> app defaults)
final class ContextAwareToolsNotifierProvider
    extends $AsyncNotifierProvider<ContextAwareToolsNotifier, List<String>> {
  /// Provider to get context-aware tools for chat (conversation -> workspace -> app defaults)
  const ContextAwareToolsNotifierProvider._({
    required ContextAwareToolsNotifierFamily super.from,
    required (String, String) super.argument,
  }) : super(
         retry: null,
         name: r'contextAwareToolsProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$contextAwareToolsNotifierHash();

  @override
  String toString() {
    return r'contextAwareToolsProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ContextAwareToolsNotifier create() => ContextAwareToolsNotifier();

  @override
  bool operator ==(Object other) {
    return other is ContextAwareToolsNotifierProvider &&
        other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$contextAwareToolsNotifierHash() =>
    r'be8cae298e644dcb6a936b30c3bf3c6709390446';

/// Provider to get context-aware tools for chat (conversation -> workspace -> app defaults)

final class ContextAwareToolsNotifierFamily extends $Family
    with
        $ClassFamilyOverride<
          ContextAwareToolsNotifier,
          AsyncValue<List<String>>,
          List<String>,
          FutureOr<List<String>>,
          (String, String)
        > {
  const ContextAwareToolsNotifierFamily._()
    : super(
        retry: null,
        name: r'contextAwareToolsProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider to get context-aware tools for chat (conversation -> workspace -> app defaults)

  ContextAwareToolsNotifierProvider call((String, String) ids) =>
      ContextAwareToolsNotifierProvider._(argument: ids, from: this);

  @override
  String toString() => r'contextAwareToolsProvider';
}

/// Provider to get context-aware tools for chat (conversation -> workspace -> app defaults)

abstract class _$ContextAwareToolsNotifier
    extends $AsyncNotifier<List<String>> {
  late final _$args = ref.$arg as (String, String);
  (String, String) get ids => _$args;

  FutureOr<List<String>> build((String, String) ids);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref = this.ref as $Ref<AsyncValue<List<String>>, List<String>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<String>>, List<String>>,
              AsyncValue<List<String>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
