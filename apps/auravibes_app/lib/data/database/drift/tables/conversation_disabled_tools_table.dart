import 'package:auravibes_app/data/database/drift/tables/common.dart';
import 'package:auravibes_app/data/database/drift/tables/conversations_table.dart';
import 'package:drift/drift.dart';

@DataClassName('ConversationDisabledToolsTable')
class ConversationDisabledTools extends Table with TableMixin {
  /// Reference to the conversation this tool setting belongs to
  TextColumn get conversationId => text().references(Conversations, #id)();

  /// Type of tool (e.g., 'web_search', 'calculator', etc.)
  TextColumn get type => text()();

  @override
  Set<Column> get primaryKey => {conversationId, type};
}
