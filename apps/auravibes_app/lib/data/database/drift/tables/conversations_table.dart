import 'package:auravibes_app/data/database/drift/tables/common.dart';
import 'package:auravibes_app/data/database/drift/tables/credentials_models_table.dart';
import 'package:auravibes_app/data/database/drift/tables/workspaces_table.dart';
import 'package:drift/drift.dart';

@DataClassName('ConversationsTable')
class Conversations extends Table with TableMixin {
  TextColumn get workspaceId => text().references(Workspaces, #id)();
  TextColumn get title => text()();
  TextColumn get modelId =>
      text().nullable().references(CredentialModels, #id)();
  BoolColumn get isPinned => boolean().withDefault(const Constant(false))();
}
