import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_session_dto.dart';
import 'package:glosseum_frontend/model/information/domain/chat/chat_message.dart';

part 'chat_session.freezed.dart';

part 'chat_session.g.dart';

@freezed
abstract class ChatSession with _$ChatSession {
  const factory ChatSession({
    required String sessionId,
    @Default([]) List<ChatMessage> history,
  }) = _ChatSession;

  factory ChatSession.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionFromJson(json);

  factory ChatSession.fromDTO(ChatSessionResponseDTO chatSessionDTO) =>
      ChatSession(
        sessionId: chatSessionDTO.sessionId,
        history: chatSessionDTO.history != null
            ? chatSessionDTO.history!
                  .map((messageDTO) => ChatMessage.fromDTO(messageDTO))
                  .toList()
            : [],
      );
}
