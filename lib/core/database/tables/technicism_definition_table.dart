import 'package:drift/drift.dart';
import 'package:glosseum_frontend/core/database/tables/technicism_table.dart';

class TechnicismDefinitionTable extends Table {
  @override
  String get tableName => 't_technicism_definition';

  // Stored as UUID
  TextColumn get id => text()();

  TextColumn get definition => text()();

  TextColumn get domain => text()();

  // References TechnicismTable
  TextColumn get technicismId =>
      text().references(TechnicismTable, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {id};
}
