import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:glosseum_frontend/core/database/daos/chat_message_dao.dart';
import 'package:glosseum_frontend/core/database/daos/chat_session_dao.dart';
import 'package:glosseum_frontend/core/database/daos/information_dao.dart';
import 'package:glosseum_frontend/core/database/daos/technicism_dao.dart';
import 'package:glosseum_frontend/core/database/daos/technicism_definition_dao.dart';
import 'package:glosseum_frontend/core/database/daos/technicism_occurrence_dao.dart';
import 'package:glosseum_frontend/core/database/tables/chat_message_table.dart';
import 'package:glosseum_frontend/core/database/tables/chat_session_table.dart';
import 'package:glosseum_frontend/core/database/tables/information_table.dart';
import 'package:glosseum_frontend/core/database/tables/technicism_definition_table.dart';
import 'package:glosseum_frontend/core/database/tables/technicism_occurrence_table.dart';
import 'package:glosseum_frontend/core/database/tables/technicism_table.dart';

// Necessary Enum imports for the DB to know how to convert them
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';
import 'package:glosseum_frontend/model/information/data/chat_role_enum.dart';

part 'glosseum_database.g.dart';

@DriftDatabase(
  tables: [
    InformationTable,
    TechnicismTable,
    TechnicismDefinitionTable,
    TechnicismOccurrenceTable,
    ChatSessionTable,
    ChatMessageTable,
  ],
  daos: [
    InformationDAO,
    TechnicismDAO,
    TechnicismDefinitionDAO,
    TechnicismOccurrenceDAO,
    ChatSessionDAO,
    ChatMessageDAO,
  ],
)
class GlosseumDatabase extends _$GlosseumDatabase {
  GlosseumDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  Future<T> runInTransaction<T>(Future<T> Function() action) {
    return transaction(action);
  }
}

QueryExecutor _openConnection() {
  return driftDatabase(name: 'glosseum_database');
}
