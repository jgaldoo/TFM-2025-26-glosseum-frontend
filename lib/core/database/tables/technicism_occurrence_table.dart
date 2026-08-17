import 'package:drift/drift.dart';
import 'package:glosseum_frontend/core/database/tables/technicism_table.dart';

class TechnicismOccurrenceTable extends Table {
  @override
  String get tableName => 't_technicism_occurrence';

  // Stored as UUID
  TextColumn get id => text()();

  TextColumn get inText => text()();

  // References TechnicismTable
  TextColumn get technicismId =>
      text().references(TechnicismTable, #id, onDelete: KeyAction.cascade)();

  @override
  Set<Column> get primaryKey => {id};
}
