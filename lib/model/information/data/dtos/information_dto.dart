import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';

part 'information_dto.freezed.dart';

@freezed
abstract class InformationDTO with _$InformationDTO {
  const factory InformationDTO({
    required String title,
    required String content,
    required InformationTypeEnum informationType,
    required bool isSimplified,
  }) = _InformationDTO;
}
