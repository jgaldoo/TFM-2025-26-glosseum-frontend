import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/information/data/dtos/information_stream_progress_enum.dart';
import 'package:glosseum_frontend/model/information/data/dtos/stream_enum.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';
import 'package:glosseum_frontend/model/technicism/data/technicism_dto.dart';

part 'information_dto.freezed.dart';

part 'information_dto.g.dart';

@freezed
abstract class InformationDTO with _$InformationDTO {
  const factory InformationDTO({
    required String title,
    required String content,
    required InformationTypeEnum informationType,
    required bool isSimplified,
    required List<TechnicismDTO> technicisms,
  }) = _InformationDTO;

  factory InformationDTO.fromJson(Map<String, dynamic> json) =>
      _$InformationDTOFromJson(json);
}

@freezed
abstract class InformationStreamDTO with _$InformationStreamDTO {
  const factory InformationStreamDTO({
    required StreamEnum stream,
    @JsonKey(fromJson: InformationStreamProgressEnum.fromString)
    InformationStreamProgressEnum? streamInfo,
    String? content,
    bool? isSimplified,
    List<TechnicismDTO>? technicisms,
  }) = _InformationStreamDTO;

  factory InformationStreamDTO.fromJson(Map<String, dynamic> json) =>
      _$InformationStreamDTOFromJson(json);
}

@freezed
abstract class InformationSimplificationRequestDTO
    with _$InformationSimplificationRequestDTO {
  const factory InformationSimplificationRequestDTO({
    required String title,
    required String content,
  }) = _InformationSimplificationRequestDTO;

  factory InformationSimplificationRequestDTO.fromJson(
    Map<String, dynamic> json,
  ) => _$InformationSimplificationRequestDTOFromJson(json);
}
