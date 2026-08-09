import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/information/data/chat_role_enum.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_message_dto.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_stream_enum.dart';

part 'chat_message.freezed.dart';

part 'chat_message.g.dart';

@freezed
abstract class ChatMessage with _$ChatMessage {
  // Private constructor for the inheritance of methods
  const ChatMessage._();

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

  factory ChatMessage.fromStreamDTO(
    ChatMessageStreamResponseDTO chatStreamMessageDTO,
  ) {
    if (chatStreamMessageDTO.stream != ChatStreamEnum.start) {
      throw ArgumentError(
        'Invalid streamStatus. ChatMessage entities can only be created from'
        ' StreamDTOs with the start status.',
      );
    }

    if (chatStreamMessageDTO.role == null) {
      throw ArgumentError('Starting StreamDTO is missing the role attribute');
    }

    if (chatStreamMessageDTO.timestamp == null) {
      throw ArgumentError(
        'Starting StreamDTO is missing the timestamp attribute',
      );
    }

    return ChatMessage(
      role: ChatRoleEnum.fromString(chatStreamMessageDTO.role!),
      content: chatStreamMessageDTO.content ?? '',
      timestamp: chatStreamMessageDTO.timestamp!,
      metadata: chatStreamMessageDTO.metadata ?? {},
    );
  }

  ChatMessage appendContent(String content) {
    return copyWith(content: this.content + content);
  }
}
