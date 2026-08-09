import 'package:dio/dio.dart';
import 'package:glosseum_frontend/core/models/api_result.dart';
import 'package:glosseum_frontend/core/providers/network_service.dart';
import 'package:glosseum_frontend/model/information/data/dtos/information_dto.dart';
import 'package:glosseum_frontend/model/information/domain/information.dart';
import 'package:glosseum_frontend/model/photo/data/dtos/photo_dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'photo_api_provider.g.dart';

@Riverpod(keepAlive: true)
class PhotoAPI extends _$PhotoAPI {
  @override
  FutureOr<void> build() {}

  Future<ApiResult<InformationDTO>> transcribe(PhotoDTO dto) async {
    final networkService = ref.read(networkServiceProvider);

    final formData = FormData();

    if (dto.fileBytes != null && dto.fileBytes!.isNotEmpty) {
      formData.files.add(
        MapEntry(
          'photo',
          MultipartFile.fromBytes(
            dto.fileBytes!,
            filename: dto.fileName ?? 'upload.bin',
          ),
        ),
      );
    }

    return networkService.safeRequest<InformationDTO>(() {
      return networkService.dio.post('/transcribe', data: formData);
    }, (json) => InformationDTO.fromJson(json));
  }
}
