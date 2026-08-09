import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/information/data/dtos/information_dto.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';
import 'package:glosseum_frontend/model/information/domain/chat/chat_session.dart';

part 'information.freezed.dart';

part 'information.g.dart';

@freezed
abstract class Information with _$Information {
  const factory Information({
    required String title,
    required String content,
    required InformationTypeEnum informationType,
    required bool isSimplified,
    @Default(null) ChatSession? chatSession,
  }) = _Information;

  factory Information.fromJson(Map<String, dynamic> json) =>
      _$InformationFromJson(json);

  factory Information.fromDTO(InformationDTO infoDTO) => Information(
    title: infoDTO.title,
    content: infoDTO.content,
    informationType: infoDTO.informationType,
    isSimplified: infoDTO.isSimplified,
  );
}
