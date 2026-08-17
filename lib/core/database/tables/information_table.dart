import 'package:drift/drift.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';

class InformationTable extends Table {
  @override
  String get tableName => 't_information';

  // Stored as UUID
  TextColumn get id => text()();

  TextColumn get title => text()();

  TextColumn get content => text()();

  TextColumn get informationType => textEnum<InformationTypeEnum>()();

  BoolColumn get isSimplified => boolean()();

  DateTimeColumn get lastAccess => dateTime()();

  @override
  Set<Column> get primaryKey => {id};
}
