import 'package:freezed_annotation/freezed_annotation.dart';

part 'technicism_dto.freezed.dart';

part 'technicism_dto.g.dart';

@freezed
abstract class TechnicismDTO with _$TechnicismDTO {
  const factory TechnicismDTO({
    required String canonicalName,
    @Default([]) List<TechnicismDefinitionDTO> definitions,
    @Default([]) List<TechnicismOccurrenceDTO> occurrences,
  }) = _TechnicismDTO;

  factory TechnicismDTO.fromJson(Map<String, dynamic> json) =>
      _$TechnicismDTOFromJson(json);
}

@freezed
abstract class TechnicismOccurrenceDTO with _$TechnicismOccurrenceDTO {
  const factory TechnicismOccurrenceDTO({required String form}) =
      _TechnicismOccurrenceDTO;

  factory TechnicismOccurrenceDTO.fromJson(Map<String, dynamic> json) =>
      _$TechnicismOccurrenceDTOFromJson(json);
}

@freezed
abstract class TechnicismDefinitionDTO with _$TechnicismDefinitionDTO {
  const factory TechnicismDefinitionDTO({
    required String text,
    required String domain,
  }) = _TechnicismDefinitionDTO;

  factory TechnicismDefinitionDTO.fromJson(Map<String, dynamic> json) =>
      _$TechnicismDefinitionDTOFromJson(json);
}
