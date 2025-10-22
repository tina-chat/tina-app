import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/tables/common.dart';
import 'package:tina_app/data/database/drift/tables/model_provider_table.dart';

/// Table definition for chat models in the database.
@DataClassName('ChatModelsTable')
class ChatModels extends Table with TableMixin {
  /// Model Display Name
  TextColumn get displayName => text()();

  /// model unique identifier
  TextColumn get modelId => text()();

  /// model type
  TextColumn get modelType => text()();

  IntColumn get modelProvider => integer().references(ModelProviders, #id)();
}
