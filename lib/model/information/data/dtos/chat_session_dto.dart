import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_message_dto.dart';
import 'package:glosseum_frontend/model/information/domain/chat/chat_message.dart';

part 'chat_session_dto.freezed.dart';

part 'chat_session_dto.g.dart';

@freezed
abstract class ChatSessionRequestDTO with _$ChatSessionRequestDTO {
  const factory ChatSessionRequestDTO({required String document}) =
      _ChatSessionRequestDTO;

  factory ChatSessionRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionRequestDTOFromJson(json);
}

@freezed
abstract class ChatSessionResponseDTO with _$ChatSessionResponseDTO {
  const factory ChatSessionResponseDTO({
    required String sessionId,
    List<ChatMessageResponseDTO>? history,
  }) = _ChatSessionResponseDTO;

  factory ChatSessionResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatSessionResponseDTOFromJson(json);
}
