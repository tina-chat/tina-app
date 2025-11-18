import 'package:auravibes_app/data/database/drift/tables/api_model_provider_table.dart';
import 'package:auravibes_app/data/database/drift/tables/common.dart';
import 'package:auravibes_app/data/database/drift/tables/credentials_table.dart';
import 'package:drift/drift.dart';

/// Table definition for chat models in the database.
@DataClassName('CredentialModelsTable')
class CredentialModels extends Table with TableMixin {
  /// model unique identifier
  TextColumn get modelId => text().references(ApiModelProviders, #id)();

  TextColumn get credentialsId => text().references(Credentials, #id)();
}
