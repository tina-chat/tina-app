import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/tables/common.dart';
import 'package:tina_app/data/database/drift/tables/workspaces_table.dart';
import 'package:tina_app/domain/enums/chat_models_type.dart';

/// Table definition for chat models in the database.
@DataClassName('ModelProvidersTable')
class ModelProviders extends Table with TableMixin {
  /// Human-readable name of the chat model
  TextColumn get name => text()();

  /// Type of chat model (local or remote)
  /// Stored as string to handle enum conversion
  TextColumn get type => textEnum<ChatModelType>()();

  /// URL for remote chat models, null for default urls
  TextColumn get url => text().nullable()();

  /// URL for remote chat models, null for default urls
  TextColumn get keyValue => text()();

  TextColumn get workspace => text().references(Workspaces, #id)();
}
