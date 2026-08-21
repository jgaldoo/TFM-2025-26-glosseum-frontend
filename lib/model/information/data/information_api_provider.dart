import 'package:dio/dio.dart';
import 'package:glosseum_frontend/core/models/api_result.dart';
import 'package:glosseum_frontend/core/providers/network_service.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_message_dto.dart';
import 'package:glosseum_frontend/model/information/data/dtos/chat_session_dto.dart';
import 'package:glosseum_frontend/model/information/data/dtos/information_dto.dart';
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

  Future<ApiResult<Stream<ChatMessageStreamResponseDTO>>> chatStream(
    ChatMessageRequestDTO chatMessageRequestDTO,
  ) async {
    final networkService = ref.read(networkServiceProvider);

    return networkService.safeStreamRequest<ChatMessageStreamResponseDTO>(() {
      print("Chatting...");
      return networkService.dio.post(
        '/chat_stream/${chatMessageRequestDTO.sessionId}',
        data: chatMessageRequestDTO.toJson(),
        options: Options(
          responseType: ResponseType.stream,
          sendTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );
    }, (json) => ChatMessageStreamResponseDTO.fromJson(json));
  }

  Future<ApiResult<Stream<InformationStreamDTO>>> simplifyStream(
    InformationSimplificationRequestDTO informationSimplificationRequestDTO,
  ) async {
    final networkService = ref.read(networkServiceProvider);

    return networkService.safeStreamRequest<InformationStreamDTO>(() {
      print('Simplifying...');
      return networkService.dio.post(
        '/simplify_stream',
        data: informationSimplificationRequestDTO.toJson(),
        options: Options(
          responseType: ResponseType.stream,
          sendTimeout: const Duration(seconds: 15),
          receiveTimeout: const Duration(seconds: 30),
        ),
      );
    }, (json) => InformationStreamDTO.fromJson(json));
  }
}
