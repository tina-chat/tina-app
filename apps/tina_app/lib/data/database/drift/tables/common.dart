import 'package:drift/drift.dart';
import 'package:uuid/v7.dart';

mixin TableMixin on Table {
  ///Primary key column as string
  late final id = text().clientDefault(() => UuidV7().generate())();

  /// when was created timestamp
  late final createdAt = dateTime().withDefault(currentDateAndTime)();

  /// when was last updated timestamp
  late final updatedAt = dateTime().withDefault(currentDateAndTime)();
}
