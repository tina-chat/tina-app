import 'package:auravibes_app/data/database/drift/tables/api_model_table.dart';
import 'package:auravibes_app/data/database/drift/tables/common.dart';
import 'package:auravibes_app/data/database/drift/tables/workspaces_table.dart';
import 'package:drift/drift.dart';

@DataClassName('CredentialsTable')
class Credentials extends Table with TableMixin {
  /// Human-readable name of the chat model
  TextColumn get name => text()();

  TextColumn get modelId => text().references(ApiModels, #id)();

  /// URL for remote chat models, null for default urls
  TextColumn get url => text().nullable()();

  /// UUID reference to securely stored API key
  TextColumn get keyValue => text()();

  TextColumn get workspaceId => text().references(Workspaces, #id)();
}
