import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';

part 'information_answer_dto.freezed.dart';

@freezed
abstract class InformationAnswerDTO with _$InformationAnswerDTO {
  const factory InformationAnswerDTO({
    required String content,
    required bool isSimplified,
  }) = _InformationAnswerDTO;
}
