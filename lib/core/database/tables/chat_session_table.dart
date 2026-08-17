import 'package:drift/drift.dart';
import 'package:glosseum_frontend/core/database/tables/information_table.dart';

class ChatSessionTable extends Table {
  @override
  String get tableName => 't_chat_session';

  // Stored as UUID
  TextColumn get id => text()();

  // References InformationTable
  TextColumn get informationId =>
      text().references(InformationTable, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {id};
}
