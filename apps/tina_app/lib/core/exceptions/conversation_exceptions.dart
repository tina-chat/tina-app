/// Exception thrown when a conversation is new and doesn't have an ID yet.
class NewConversationException implements Exception {
  const NewConversationException();

  @override
  String toString() =>
      'NewConversationException: New conversation - no ID available yet';
}

/// Exception thrown when no conversation is selected.
class NoConversationSelectedException implements Exception {
  const NoConversationSelectedException();

  @override
  String toString() =>
      'NoConversationSelectedException: No conversation is currently selected';
}
