// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'messages_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(conversationSelectedNotifier)
const conversationSelectedProvider = ConversationSelectedNotifierProvider._();

final class ConversationSelectedNotifierProvider
    extends $FunctionalProvider<String, String, String>
    with $Provider<String> {
  const ConversationSelectedNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'conversationSelectedProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$conversationSelectedNotifierHash();

  @$internal
  @override
  $ProviderElement<String> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  String create(Ref ref) {
    return conversationSelectedNotifier(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(String value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<String>(value),
    );
  }
}

String _$conversationSelectedNotifierHash() =>
    r'6961c32224067093c21814f3c95558e110d40592';

@ProviderFor(ConversationChatNotifier)
const conversationChatProvider = ConversationChatNotifierProvider._();

final class ConversationChatNotifierProvider
    extends
        $AsyncNotifierProvider<ConversationChatNotifier, ConversationEntity?> {
  const ConversationChatNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'conversationChatProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[conversationSelectedProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          ConversationChatNotifierProvider.$allTransitiveDependencies0,
        ],
      );

  static const $allTransitiveDependencies0 = conversationSelectedProvider;

  @override
  String debugGetCreateSourceHash() => _$conversationChatNotifierHash();

  @$internal
  @override
  ConversationChatNotifier create() => ConversationChatNotifier();
}

String _$conversationChatNotifierHash() =>
    r'3eb74e57243e1a671e9ec9f89772914433cd2a56';

abstract class _$ConversationChatNotifier
    extends $AsyncNotifier<ConversationEntity?> {
  FutureOr<ConversationEntity?> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<ConversationEntity?>, ConversationEntity?>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ConversationEntity?>, ConversationEntity?>,
              AsyncValue<ConversationEntity?>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ChatMessages)
const chatMessagesProvider = ChatMessagesProvider._();

final class ChatMessagesProvider
    extends $AsyncNotifierProvider<ChatMessages, List<MessageEntity>> {
  const ChatMessagesProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatMessagesProvider',
        isAutoDispose: true,
        dependencies: const <ProviderOrFamily>[conversationChatProvider],
        $allTransitiveDependencies: const <ProviderOrFamily>[
          ChatMessagesProvider.$allTransitiveDependencies0,
          ChatMessagesProvider.$allTransitiveDependencies1,
        ],
      );

  static const $allTransitiveDependencies0 = conversationChatProvider;
  static const $allTransitiveDependencies1 =
      ConversationChatNotifierProvider.$allTransitiveDependencies0;

  @override
  String debugGetCreateSourceHash() => _$chatMessagesHash();

  @$internal
  @override
  ChatMessages create() => ChatMessages();
}

String _$chatMessagesHash() => r'2cb53cbad7b862a4c44d2cd0c5aa88f26f9713dd';

abstract class _$ChatMessages extends $AsyncNotifier<List<MessageEntity>> {
  FutureOr<List<MessageEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<MessageEntity>>, List<MessageEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<MessageEntity>>, List<MessageEntity>>,
              AsyncValue<List<MessageEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
