import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/tables/common.dart';
import 'package:tina_app/data/database/drift/tables/conversations_table.dart';

enum MessagesTableType {
  text('text');

  const MessagesTableType(this.value);
  final String value;
}

@DataClassName('MessagesTable')
class Messages extends Table with TableMixin {
  TextColumn get conversationId => text().references(Conversations, #id)();
  TextColumn get content => text()();
  TextColumn get messageType => textEnum<MessagesTableType>()();
  BoolColumn get isUser => boolean()();
  TextColumn get status => text()();
  TextColumn get metadata => text().nullable()();
}
