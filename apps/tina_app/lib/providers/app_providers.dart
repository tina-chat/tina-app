import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:tina_app/data/database/drift/app_database.dart';

part 'app_providers.g.dart';

@Riverpod(keepAlive: true)
AppDatabase appDatabase(Ref ref) {
  return AppDatabase()..initializeWithDefaults();
}
