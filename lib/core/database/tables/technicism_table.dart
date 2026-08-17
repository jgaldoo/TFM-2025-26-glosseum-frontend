import 'package:drift/drift.dart';
import 'package:glosseum_frontend/core/database/tables/information_table.dart';

class TechnicismTable extends Table {
  @override
  String get tableName => 't_technicism';

  // Stored as UUID
  TextColumn get id => text()();

  TextColumn get canonicalName => text()();

  // References InformationTable
  TextColumn get informationId =>
      text().references(InformationTable, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {id};
}
