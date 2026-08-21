import 'package:drift/drift.dart';
import 'package:glosseum_frontend/core/database/glosseum_database.dart';
import 'package:glosseum_frontend/core/database/tables/technicism_definition_table.dart';
import 'package:glosseum_frontend/model/technicism/domain/technicism.dart';

part 'technicism_definition_dao.g.dart';

@DriftAccessor(tables: [TechnicismDefinitionTable])
class TechnicismDefinitionDAO extends DatabaseAccessor<GlosseumDatabase>
    with _$TechnicismDefinitionDAOMixin {
  TechnicismDefinitionDAO(super.db);

  TechnicismDefinitionTableCompanion _toInsertCompanion(
    TechnicismDefinition technicismDefinition,
    String technicismId,
  ) {
    return TechnicismDefinitionTableCompanion.insert(
      id: technicismDefinition.id,
      definition: technicismDefinition.definition,
      domain: technicismDefinition.domain,
      technicismId: technicismId,
    );
  }

  TechnicismDefinition _fromData(
    TechnicismDefinitionTableData technicismDefinitionTableData,
  ) {
    return TechnicismDefinition(
      id: technicismDefinitionTableData.id,
      definition: technicismDefinitionTableData.definition,
      domain: technicismDefinitionTableData.domain,
    );
  }

  Future<void> insertTechnicismDefinition(
    TechnicismDefinition technicismDefinition,
    String technicismId,
  ) async {
    await into(
      technicismDefinitionTable,
    ).insert(_toInsertCompanion(technicismDefinition, technicismId));
  }

  Future<void> insertTechnicismDefinitions(
    List<TechnicismDefinition> technicismDefinitions,
    String technicismId,
  ) async {
    await batch((batch) {
      batch.insertAll(
        technicismDefinitionTable,
        technicismDefinitions.map(
          (technicismDefinition) =>
              _toInsertCompanion(technicismDefinition, technicismId),
        ),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<List<TechnicismDefinition>> selectByTechnicismId(
    String technicismId,
  ) async {
    final technicismDefinitionTableDataList =
        await (select(technicismDefinitionTable)..where(
              (technicismDefinition) =>
                  technicismDefinition.technicismId.equals(technicismId),
            ))
            .get();

    return technicismDefinitionTableDataList
        .map(
          (technicismDefinitionTableData) =>
              _fromData(technicismDefinitionTableData),
        )
        .toList();
  }
}
