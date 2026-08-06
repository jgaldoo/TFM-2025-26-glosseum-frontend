import 'package:dio/dio.dart';
import 'package:glosseum_frontend/core/models/api_result.dart';
import 'package:glosseum_frontend/core/providers/network_service.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_message_dto.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_session_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'information_api_provider.g.dart';

@Riverpod(keepAlive: true)
class InformationAPI extends _$InformationAPI {
  @override
  FutureOr<void> build() {}

  Future<ApiResult<ChatSessionResponseDTO>> createSession(
    ChatSessionRequestDTO chatSessionRequestDTO,
  ) async {
    final networkService = ref.read(networkServiceProvider);

    return networkService.safeRequest<ChatSessionResponseDTO>(() {
      print("Creating session...");
      return networkService.dio.post(
        '/create-session',
        data: chatSessionRequestDTO.toJson(),
      );
    }, (json) => ChatSessionResponseDTO.fromJson(json));
  }

  Future<ApiResult<ChatMessageResponseDTO>> chat(
    ChatMessageRequestDTO chatMessageRequestDTO,
  ) async {
    final networkService = ref.read(networkServiceProvider);

    return networkService.safeRequest<ChatMessageResponseDTO>(() {
      print("Chatting...");
      return networkService.dio.post(
        '/chat/${chatMessageRequestDTO.sessionId}',
        data: chatMessageRequestDTO.toJson(),
        options: Options(
          sendTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );
    }, (json) => ChatMessageResponseDTO.fromJson(json));
  }
}
