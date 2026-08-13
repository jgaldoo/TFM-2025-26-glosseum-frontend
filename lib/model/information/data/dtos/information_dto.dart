import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';
import 'package:glosseum_frontend/model/technicism/data/technicism_dto.dart';
import 'package:glosseum_frontend/model/technicism/domain/technicism.dart';

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
