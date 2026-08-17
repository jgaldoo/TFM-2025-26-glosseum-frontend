import 'package:drift/drift.dart';
import 'package:glosseum_frontend/core/database/glosseum_database.dart';
import 'package:glosseum_frontend/core/database/tables/chat_session_table.dart';
import 'package:glosseum_frontend/model/information/domain/chat/chat_message.dart';
import 'package:glosseum_frontend/model/information/domain/chat/chat_session.dart';

part 'chat_session_dao.g.dart';

@DriftAccessor(tables: [ChatSessionTable])
class ChatSessionDAO extends DatabaseAccessor<GlosseumDatabase>
    with _$ChatSessionDAOMixin {
  ChatSessionDAO(super.db);

  ChatSessionTableCompanion _toInsertCompanion(
    ChatSession chatSession,
    String informationId,
  ) {
    return ChatSessionTableCompanion.insert(
      id: chatSession.id,
      informationId: informationId,
    );
  }

  Future<ChatSession> _fromData(
    ChatSessionTableData chatSessionTableData,
  ) async {
    final List<ChatMessage> chatMessages = await db.chatMessageDAO
        .selectBySessionId(chatSessionTableData.id);

    return ChatSession(id: chatSessionTableData.id, history: chatMessages);
  }

  Future<void> insertChatSession(
    ChatSession chatSession,
    String informationId,
  ) async {
    await into(
      chatSessionTable,
    ).insert(_toInsertCompanion(chatSession, informationId));

    await db.chatMessageDAO.insertChatMessages(
      chatSession.history,
      chatSession.id,
    );
  }

  Future<ChatSession?> selectByInformationId(String informationId) async {
    final chatSessionTableData =
        await (select(chatSessionTable)..where(
              (chatSession) => chatSession.informationId.equals(informationId),
            ))
            .getSingleOrNull();

    return chatSessionTableData == null
        ? null
        : await _fromData(chatSessionTableData);
  }
}
