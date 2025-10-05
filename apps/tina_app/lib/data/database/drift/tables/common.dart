import 'package:drift/drift.dart';

mixin TableMixin on Table {
  ///Primary key column
  late final id = integer().autoIncrement()();

  /// when was created timestamp
  late final createdAt = dateTime().withDefault(currentDateAndTime)();

  /// when was last updated timestamp
  DateTimeColumn get updatedAt => dateTime().withDefault(currentDateAndTime)();
}
