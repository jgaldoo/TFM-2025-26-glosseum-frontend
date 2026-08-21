import 'package:drift/drift.dart';
import 'package:glosseum_frontend/core/database/glosseum_database.dart';
import 'package:glosseum_frontend/core/database/tables/technicism_occurrence_table.dart';
import 'package:glosseum_frontend/model/technicism/domain/technicism.dart';

part 'technicism_occurrence_dao.g.dart';

@DriftAccessor(tables: [TechnicismOccurrenceTable])
class TechnicismOccurrenceDAO extends DatabaseAccessor<GlosseumDatabase>
    with _$TechnicismOccurrenceDAOMixin {
  TechnicismOccurrenceDAO(super.db);

  TechnicismOccurrenceTableCompanion _toInsertCompanion(
    TechnicismOccurrence technicismOccurrence,
    String technicismId,
  ) {
    return TechnicismOccurrenceTableCompanion.insert(
      id: technicismOccurrence.id,
      inText: technicismOccurrence.inText,
      technicismId: technicismId,
    );
  }

  TechnicismOccurrence _fromData(
    TechnicismOccurrenceTableData technicismOccurrenceTableData,
  ) {
    return TechnicismOccurrence(
      id: technicismOccurrenceTableData.id,
      inText: technicismOccurrenceTableData.inText,
    );
  }

  Future<void> insertTechnicismOccurrence(
    TechnicismOccurrence technicismOccurrence,
    String technicismId,
  ) async {
    await into(
      technicismOccurrenceTable,
    ).insert(_toInsertCompanion(technicismOccurrence, technicismId));
  }

  Future<void> insertTechnicismOccurrences(
    List<TechnicismOccurrence> technicismOccurrences,
    String technicismId,
  ) async {
    await batch((batch) {
      batch.insertAll(
        technicismOccurrenceTable,
        technicismOccurrences.map(
          (technicismOccurrence) =>
              _toInsertCompanion(technicismOccurrence, technicismId),
        ),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<List<TechnicismOccurrence>> selectByTechnicismId(
    String technicismId,
  ) async {
    final technicismOccurrenceTableDataList =
        await (select(technicismOccurrenceTable)..where(
              (technicismOccurrence) =>
                  technicismOccurrence.technicismId.equals(technicismId),
            ))
            .get();

    return technicismOccurrenceTableDataList
        .map(
          (technicismOccurrenceTableData) =>
              _fromData(technicismOccurrenceTableData),
        )
        .toList();
  }
}
