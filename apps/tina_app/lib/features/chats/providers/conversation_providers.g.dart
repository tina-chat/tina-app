// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversation_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ConversationsList)
const conversationsListProvider = ConversationsListProvider._();

final class ConversationsListProvider
    extends
        $AsyncNotifierProvider<ConversationsList, List<ConversationEntity>> {
  const ConversationsListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'conversationsListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$conversationsListHash();

  @$internal
  @override
  ConversationsList create() => ConversationsList();
}

String _$conversationsListHash() => r'edbfaa322386923b58f3a309bf7e499167213345';

abstract class _$ConversationsList
    extends $AsyncNotifier<List<ConversationEntity>> {
  FutureOr<List<ConversationEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<ConversationEntity>>,
              List<ConversationEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ConversationEntity>>,
                List<ConversationEntity>
              >,
              AsyncValue<List<ConversationEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
