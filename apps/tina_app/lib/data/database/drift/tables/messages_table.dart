import 'package:drift/drift.dart';
import 'package:tina_app/data/database/drift/enums/message_table_enums.dart';
import 'package:tina_app/data/database/drift/tables/common.dart';
import 'package:tina_app/data/database/drift/tables/conversations_table.dart';

export 'package:tina_app/data/database/drift/enums/message_table_enums.dart';

@DataClassName('MessagesTable')
class Messages extends Table with TableMixin {
  TextColumn get conversationId => text().references(Conversations, #id)();
  TextColumn get content => text()();
  TextColumn get messageType => textEnum<MessagesTableType>()();
  BoolColumn get isUser => boolean()();
  TextColumn get status => textEnum<MessageTableStatus>()();
  TextColumn get metadata => text().nullable()();
}
