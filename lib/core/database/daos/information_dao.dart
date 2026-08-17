import 'package:drift/drift.dart';
import 'package:glosseum_frontend/core/database/glosseum_database.dart';
import 'package:glosseum_frontend/core/database/tables/information_table.dart';
import 'package:glosseum_frontend/model/information/domain/chat/chat_session.dart';
import 'package:glosseum_frontend/model/information/domain/information.dart';
import 'package:glosseum_frontend/model/technicism/domain/technicism.dart';

part 'information_dao.g.dart';

@DriftAccessor(tables: [InformationTable])
class InformationDAO extends DatabaseAccessor<GlosseumDatabase>
    with _$InformationDAOMixin {
  InformationDAO(super.db);

  InformationTableCompanion _toInsertCompanion(Information information) {
    return InformationTableCompanion.insert(
      id: information.id,
      title: information.title,
      content: information.content,
      informationType: information.informationType,
      isSimplified: information.isSimplified,
      lastAccess: information.lastAccess,
    );
  }

  InformationTableCompanion _toUpdateCompanion(Information information) {
    return InformationTableCompanion(
      title: Value(information.title),
      content: Value(information.content),
      informationType: Value(information.informationType),
      isSimplified: Value(information.isSimplified),
    );
  }

  Future<Information> _fromData(
    InformationTableData informationTableData,
  ) async {
    final List<Technicism> technicisms = await db.technicismDAO
        .selectByInformationId(informationTableData.id);
    final ChatSession? chatSession = await db.chatSessionDAO
        .selectByInformationId(informationTableData.id);

    return Information(
      id: informationTableData.id,
      title: informationTableData.title,
      content: informationTableData.content,
      informationType: informationTableData.informationType,
      isSimplified: informationTableData.isSimplified,
      lastAccess: informationTableData.lastAccess,
      technicisms: technicisms,
      chatSession: chatSession,
    );
  }

  Future<void> insertInformation(Information information) async {
    return await transaction(() async {
      await into(informationTable).insert(_toInsertCompanion(information));

      await db.technicismDAO.insertTechnicisms(
        information.technicisms ?? [],
        information.id,
      );

      if (information.chatSession != null) {
        await db.chatSessionDAO.insertChatSession(
          information.chatSession!,
          information.id,
        );
      }
    });
  }

  Future<void> updateInformation(Information information) async {
    await transaction(() async {
      await (update(informationTable)..where(
            (tableInformation) => tableInformation.id.equals(information.id),
          ))
          .write(_toUpdateCompanion(information));
    });

    await db.technicismDAO.deleteRelatedTechnicisms(
      information.id,
      exceptIds: (information.technicisms ?? [])
          .map((technicism) => technicism.id)
          .toList(),
    );

    return await db.technicismDAO.insertTechnicisms(
      information.technicisms ?? [],
      information.id,
    );
  }

  Future<void> updateLastAccess(Information information) async {
    await (update(informationTable)..where(
          (tableInformation) => tableInformation.id.equals(information.id),
        ))
        .write(
          InformationTableCompanion(lastAccess: Value(information.lastAccess)),
        );
  }

  Future<Information?> selectInformationById(String informationId) async {
    return await transaction(() async {
      final InformationTableData? informationTableData =
          await (select(informationTable)..where(
                (tableInformation) => tableInformation.id.equals(informationId),
              ))
              .getSingleOrNull();

      return informationTableData == null
          ? null
          : await _fromData(informationTableData);
    });
  }
}
