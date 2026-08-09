import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_stream_enum.dart';

part 'chat_message_dto.freezed.dart';

part 'chat_message_dto.g.dart';

@freezed
abstract class ChatMessageRequestDTO with _$ChatMessageRequestDTO {
  const factory ChatMessageRequestDTO({
    required String sessionId,
    required String message,
  }) = _ChatMessageRequestDTO;

  factory ChatMessageRequestDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageRequestDTOFromJson(json);
}

@freezed
abstract class ChatMessageResponseDTO with _$ChatMessageResponseDTO {
  const factory ChatMessageResponseDTO({
    required String role,
    required String content,
    required DateTime timestamp,
    required Map<String, String> metadata,
  }) = _ChatMessageResponseDTO;

  factory ChatMessageResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageResponseDTOFromJson(json);
}

@freezed
abstract class ChatMessageStreamResponseDTO
    with _$ChatMessageStreamResponseDTO {
  const factory ChatMessageStreamResponseDTO({
    required ChatStreamEnum stream,
    String? role,
    String? content,
    DateTime? timestamp,
    Map<String, String>? metadata,
  }) = _ChatMessageStreamResponseDTO;

  factory ChatMessageStreamResponseDTO.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageStreamResponseDTOFromJson(json);
}
