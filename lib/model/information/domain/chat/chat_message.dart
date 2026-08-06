import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/information/data/chat_role_enum.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_message_dto.dart';
import 'package:glosseum_frontend/model/information/data/dtos/information_answer_dto.dart';
import 'package:glosseum_frontend/model/information/data/dtos/information_dto.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';

part 'chat_message.freezed.dart';

part 'chat_message.g.dart';

@freezed
abstract class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required ChatRoleEnum role,
    required String content,
    required DateTime timestamp,
    @Default({}) Map<String, String> metadata,
  }) = _ChatMessage;

  factory ChatMessage.fromUser({required String content}) => ChatMessage(
    role: ChatRoleEnum.user,
    content: content,
    timestamp: DateTime.now(),
  );

  factory ChatMessage.fromJson(Map<String, dynamic> json) =>
      _$ChatMessageFromJson(json);

  factory ChatMessage.fromDTO(ChatMessageResponseDTO chatMessageDTO) =>
      ChatMessage(
        role: ChatRoleEnum.fromString(chatMessageDTO.role),
        content: chatMessageDTO.content,
        timestamp: chatMessageDTO.timestamp,
        metadata: chatMessageDTO.metadata,
      );
}
