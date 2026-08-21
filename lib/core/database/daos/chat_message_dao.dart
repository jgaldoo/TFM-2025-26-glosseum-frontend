import 'package:drift/drift.dart';
import 'package:glosseum_frontend/core/database/glosseum_database.dart';
import 'package:glosseum_frontend/core/database/tables/chat_message_table.dart';
import 'package:glosseum_frontend/model/information/domain/chat/chat_message.dart';

part 'chat_message_dao.g.dart';

@DriftAccessor(tables: [ChatMessageTable])
class ChatMessageDAO extends DatabaseAccessor<GlosseumDatabase>
    with _$ChatMessageDAOMixin {
  ChatMessageDAO(super.db);

  ChatMessageTableCompanion _toInsertCompanion(
    ChatMessage chatMessage,
    String sessionId,
  ) {
    return ChatMessageTableCompanion.insert(
      id: chatMessage.id,
      role: chatMessage.role,
      content: chatMessage.content,
      timestamp: chatMessage.timestamp,
      sessionId: sessionId,
    );
  }

  ChatMessage _fromData(ChatMessageTableData chatMessageTableData) {
    return ChatMessage(
      id: chatMessageTableData.id,
      role: chatMessageTableData.role,
      content: chatMessageTableData.content,
      timestamp: chatMessageTableData.timestamp,
    );
  }

  Future<void> insertChatMessage(
    ChatMessage chatMessage,
    String sessionId,
  ) async {
    await into(
      chatMessageTable,
    ).insert(_toInsertCompanion(chatMessage, sessionId));
  }

  Future<void> insertChatMessages(
    List<ChatMessage> chatMessages,
    String sessionId,
  ) async {
    await batch((batch) async {
      batch.insertAll(
        chatMessageTable,
        chatMessages.map(
          (chatMessage) => _toInsertCompanion(chatMessage, sessionId),
        ),
        mode: InsertMode.insertOrReplace,
      );
    });
  }

  Future<List<ChatMessage>> selectBySessionId(String sessionId) async {
    final chatMessageTableDataList = await (select(
      chatMessageTable,
    )..where((chatMessage) => chatMessage.sessionId.equals(sessionId))).get();

    return chatMessageTableDataList
        .map((chatMessageTableData) => _fromData(chatMessageTableData))
        .toList();
  }
}
