// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatList)
const chatListProvider = ChatListProvider._();

final class ChatListProvider
    extends $AsyncNotifierProvider<ChatList, List<ChatEntity>> {
  const ChatListProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatListProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatListHash();

  @$internal
  @override
  ChatList create() => ChatList();
}

String _$chatListHash() => r'b09826961618680e4b6f7465b2bf1d9bcb04db11';

abstract class _$ChatList extends $AsyncNotifier<List<ChatEntity>> {
  FutureOr<List<ChatEntity>> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref =
        this.ref as $Ref<AsyncValue<List<ChatEntity>>, List<ChatEntity>>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<List<ChatEntity>>, List<ChatEntity>>,
              AsyncValue<List<ChatEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}

@ProviderFor(ChatMessages)
const chatMessagesProvider = ChatMessagesFamily._();

final class ChatMessagesProvider
    extends $AsyncNotifierProvider<ChatMessages, List<ChatMessageEntity>> {
  const ChatMessagesProvider._({
    required ChatMessagesFamily super.from,
    required String? super.argument,
  }) : super(
         retry: null,
         name: r'chatMessagesProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$chatMessagesHash();

  @override
  String toString() {
    return r'chatMessagesProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  ChatMessages create() => ChatMessages();

  @override
  bool operator ==(Object other) {
    return other is ChatMessagesProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chatMessagesHash() => r'4e7393b3d968ad8b3eee3d65cab9bc319ab48abf';

final class ChatMessagesFamily extends $Family
    with
        $ClassFamilyOverride<
          ChatMessages,
          AsyncValue<List<ChatMessageEntity>>,
          List<ChatMessageEntity>,
          FutureOr<List<ChatMessageEntity>>,
          String?
        > {
  const ChatMessagesFamily._()
    : super(
        retry: null,
        name: r'chatMessagesProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  ChatMessagesProvider call(String? chatId) =>
      ChatMessagesProvider._(argument: chatId, from: this);

  @override
  String toString() => r'chatMessagesProvider';
}

abstract class _$ChatMessages extends $AsyncNotifier<List<ChatMessageEntity>> {
  late final _$args = ref.$arg as String?;
  String? get chatId => _$args;

  FutureOr<List<ChatMessageEntity>> build(String? chatId);
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(_$args);
    final ref =
        this.ref
            as $Ref<
              AsyncValue<List<ChatMessageEntity>>,
              List<ChatMessageEntity>
            >;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<
                AsyncValue<List<ChatMessageEntity>>,
                List<ChatMessageEntity>
              >,
              AsyncValue<List<ChatMessageEntity>>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
