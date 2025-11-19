// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chatbot_service_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Provider that creates a ChatbotService without tools
/// (for title generation, etc.)

@ProviderFor(chatbotService)
const chatbotServiceProvider = ChatbotServiceFamily._();

/// Provider that creates a ChatbotService without tools
/// (for title generation, etc.)

final class ChatbotServiceProvider
    extends $FunctionalProvider<ChatbotService, ChatbotService, ChatbotService>
    with $Provider<ChatbotService> {
  /// Provider that creates a ChatbotService without tools
  /// (for title generation, etc.)
  const ChatbotServiceProvider._({
    required ChatbotServiceFamily super.from,
    required CredentialsModelWithProviderEntity super.argument,
  }) : super(
         retry: null,
         name: r'chatbotServiceProvider',
         isAutoDispose: true,
         dependencies: null,
         $allTransitiveDependencies: null,
       );

  @override
  String debugGetCreateSourceHash() => _$chatbotServiceHash();

  @override
  String toString() {
    return r'chatbotServiceProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  $ProviderElement<ChatbotService> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ChatbotService create(Ref ref) {
    final argument = this.argument as CredentialsModelWithProviderEntity;
    return chatbotService(ref, argument);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ChatbotService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ChatbotService>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is ChatbotServiceProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$chatbotServiceHash() => r'c6927355a42a8075dee27597c5d9e47a67ab2bb5';

/// Provider that creates a ChatbotService without tools
/// (for title generation, etc.)

final class ChatbotServiceFamily extends $Family
    with
        $FunctionalFamilyOverride<
          ChatbotService,
          CredentialsModelWithProviderEntity
        > {
  const ChatbotServiceFamily._()
    : super(
        retry: null,
        name: r'chatbotServiceProvider',
        dependencies: null,
        $allTransitiveDependencies: null,
        isAutoDispose: true,
      );

  /// Provider that creates a ChatbotService without tools
  /// (for title generation, etc.)

  ChatbotServiceProvider call(
    CredentialsModelWithProviderEntity modelProvider,
  ) => ChatbotServiceProvider._(argument: modelProvider, from: this);

  @override
  String toString() => r'chatbotServiceProvider';
}
