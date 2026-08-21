import 'package:drift/drift.dart';
import 'package:glosseum_frontend/core/database/glosseum_database.dart';
import 'package:glosseum_frontend/core/database/tables/technicism_table.dart';
import 'package:glosseum_frontend/model/technicism/domain/technicism.dart';

part 'technicism_dao.g.dart';

@DriftAccessor(tables: [TechnicismTable])
class TechnicismDAO extends DatabaseAccessor<GlosseumDatabase>
    with _$TechnicismDAOMixin {
  TechnicismDAO(super.db);

  TechnicismTableCompanion _toInsertCompanion(
    Technicism technicism,
    String informationId,
  ) {
    return TechnicismTableCompanion.insert(
      id: technicism.id,
      canonicalName: technicism.canonicalName,
      informationId: informationId,
    );
  }

  Future<Technicism> _fromData(TechnicismTableData technicismTableData) async {
    final List<TechnicismDefinition> technicismDefinitions = await db
        .technicismDefinitionDAO
        .selectByTechnicismId(technicismTableData.id);
    final List<TechnicismOccurrence> technicismOccurrences = await db
        .technicismOccurrenceDAO
        .selectByTechnicismId(technicismTableData.id);

    return Technicism(
      id: technicismTableData.id,
      canonicalName: technicismTableData.canonicalName,
      definitions: technicismDefinitions,
      occurrences: technicismOccurrences,
    );
  }

  Future<void> insertTechnicism(
    Technicism technicism,
    String informationId,
  ) async {
    await into(
      technicismTable,
    ).insert(_toInsertCompanion(technicism, informationId));
  }

  Future<void> insertTechnicisms(
    List<Technicism> technicisms,
    String informationId,
  ) async {
    await batch((batch) async {
      batch.insertAll(
        technicismTable,
        technicisms.map(
          (technicism) => _toInsertCompanion(technicism, informationId),
        ),
        mode: InsertMode.insertOrReplace,
      );

      for (final technicism in technicisms) {
        await db.technicismDefinitionDAO.insertTechnicismDefinitions(
          technicism.definitions,
          technicism.id,
        );
        await db.technicismOccurrenceDAO.insertTechnicismOccurrences(
          technicism.occurrences,
          technicism.id,
        );
      }
    });
  }

  Future<void> deleteRelatedTechnicisms(
    String informationId, {
    List<String>? exceptIds,
  }) async {
    final ids = (exceptIds ?? []).toSet();

    await (delete(technicismTable)..where((technicism) {
          final isRelated = technicism.informationId.equals(informationId);

          return ids.isEmpty
              ? isRelated
              : isRelated & technicism.id.isNotIn(ids);
        }))
        .go();
  }

  Future<List<Technicism>> selectByInformationId(String informationId) async {
    final technicismTableDataList =
        await (select(technicismTable)..where(
              (technicism) => technicism.informationId.equals(informationId),
            ))
            .get();

    return await Future.wait(
      technicismTableDataList
          .map(
            (technicismTableData) async => await _fromData(technicismTableData),
          )
          .toList(),
    );
  }
}
