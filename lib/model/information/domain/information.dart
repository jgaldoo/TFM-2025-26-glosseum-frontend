import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/information/data/dtos/information_dto.dart';
import 'package:glosseum_frontend/model/information/data/dtos/stream_enum.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';
import 'package:glosseum_frontend/model/information/domain/chat/chat_session.dart';
import 'package:glosseum_frontend/model/technicism/domain/technicism.dart';

part 'information.freezed.dart';

part 'information.g.dart';

@freezed
abstract class Information with _$Information {
  // Private constructor for inheriting methods
  const Information._();

  const factory Information({
    required String title,
    required String content,
    required InformationTypeEnum informationType,
    required bool isSimplified,
    @Default([]) List<Technicism>? technicisms,
    @Default(null) ChatSession? chatSession,
  }) = _Information;

  factory Information.fromJson(Map<String, dynamic> json) =>
      _$InformationFromJson(json);

  factory Information.fromDTO(InformationDTO infoDTO) => Information(
    title: infoDTO.title,
    content: infoDTO.content,
    technicisms: infoDTO.technicisms.map(Technicism.fromDTO).toList(),
    informationType: infoDTO.informationType,
    isSimplified: infoDTO.isSimplified,
  );

  Information updateFromStreamDTO(InformationStreamDTO informationStreamDTO) {
    final bool resetTextContent =
        informationStreamDTO.stream == StreamEnum.start ||
        informationStreamDTO.technicisms != null;

    return copyWith(
      content: resetTextContent
          ? informationStreamDTO.content ?? ''
          : content + (informationStreamDTO.content ?? ''),
      technicisms: informationStreamDTO.technicisms != null
          ? informationStreamDTO.technicisms!.map(Technicism.fromDTO).toList()
          : technicisms,
      isSimplified: informationStreamDTO.isSimplified ?? isSimplified,
    );
  }
}
