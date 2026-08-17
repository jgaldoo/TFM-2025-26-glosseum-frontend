import 'package:drift/drift.dart';
import 'package:glosseum_frontend/core/database/tables/chat_session_table.dart';
import 'package:glosseum_frontend/model/information/data/chat_role_enum.dart';

class ChatMessageTable extends Table {
  @override
  String get tableName => 't_chat_message';

  // Stored as UUID
  TextColumn get id => text()();

  // References ChatSessionTable
  TextColumn get sessionId =>
      text().references(ChatSessionTable, #id, onDelete: KeyAction.cascade)();

  TextColumn get role => textEnum<ChatRoleEnum>()();

  TextColumn get content => text()();

  DateTimeColumn get timestamp => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
