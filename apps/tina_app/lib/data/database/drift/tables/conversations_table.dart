import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/tables/chat_models_table.dart';
import 'package:tina_app/data/database/drift/tables/common.dart';
import 'package:tina_app/data/database/drift/tables/workspaces_table.dart';

@DataClassName('ConversationsTable')
class Conversations extends Table with TableMixin {
  TextColumn get workspaceId => text().references(Workspaces, #id)();
  TextColumn get title => text()();
  TextColumn get modelId => text().nullable().references(ChatModels, #id)();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
}
