// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_tools_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ChatToolsNotifier)
const chatToolsProvider = ChatToolsNotifierProvider._();

final class ChatToolsNotifierProvider
    extends $AsyncNotifierProvider<ChatToolsNotifier, ChatToolsState> {
  const ChatToolsNotifierProvider._()
    : super(
        from: null,
        argument: null,
        retry: null,
        name: r'chatToolsProvider',
        isAutoDispose: true,
        dependencies: null,
        $allTransitiveDependencies: null,
      );

  @override
  String debugGetCreateSourceHash() => _$chatToolsNotifierHash();

  @$internal
  @override
  ChatToolsNotifier create() => ChatToolsNotifier();
}

String _$chatToolsNotifierHash() => r'7e458874e3b1a5e61480f9aa46c5012d56388ff5';

abstract class _$ChatToolsNotifier extends $AsyncNotifier<ChatToolsState> {
  FutureOr<ChatToolsState> build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<AsyncValue<ChatToolsState>, ChatToolsState>;
    final element =
        ref.element
            as $ClassProviderElement<
              AnyNotifier<AsyncValue<ChatToolsState>, ChatToolsState>,
              AsyncValue<ChatToolsState>,
              Object?,
              Object?
            >;
    element.handleValue(ref, created);
  }
}
