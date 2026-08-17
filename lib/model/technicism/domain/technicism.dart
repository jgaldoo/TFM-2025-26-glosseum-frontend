import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/core/utils/uuid_generator_utils.dart';
import 'package:glosseum_frontend/model/technicism/data/technicism_dto.dart';

part 'technicism.freezed.dart';

part 'technicism.g.dart';

@freezed
abstract class Technicism with _$Technicism {
  const Technicism._();

  const factory Technicism({
    required String id,
    required String canonicalName,
    @Default([]) List<TechnicismDefinition> definitions,
    @Default([]) List<TechnicismOccurrence> occurrences,
  }) = _Technicism;

  factory Technicism.fromJson(Map<String, dynamic> json) =>
      _$TechnicismFromJson(json);

  factory Technicism.fromDTO(TechnicismDTO technicismDTO) => Technicism(
    id: newUUID(),
    canonicalName: technicismDTO.canonicalName,
    definitions: technicismDTO.definitions
        .map(TechnicismDefinition.fromDTO)
        .toList(),
    occurrences: technicismDTO.occurrences
        .map(TechnicismOccurrence.fromDTO)
        .toList(),
  );
}

@freezed
abstract class TechnicismOccurrence with _$TechnicismOccurrence {
  const factory TechnicismOccurrence({
    required String id,
    required String inText,
  }) = _TechnicismOccurrence;

  factory TechnicismOccurrence.fromJson(Map<String, dynamic> json) =>
      _$TechnicismOccurrenceFromJson(json);

  factory TechnicismOccurrence.fromDTO(
    TechnicismOccurrenceDTO technicismOccurrenceDTO,
  ) =>
      TechnicismOccurrence(id: newUUID(), inText: technicismOccurrenceDTO.form);
}

@freezed
abstract class TechnicismDefinition with _$TechnicismDefinition {
  const factory TechnicismDefinition({
    required String id,
    required String definition,
    required String domain,
  }) = _TechnicismDefinition;

  factory TechnicismDefinition.fromJson(Map<String, dynamic> json) =>
      _$TechnicismDefinitionFromJson(json);

  factory TechnicismDefinition.fromDTO(
    TechnicismDefinitionDTO technicismDefinitionDTO,
  ) => TechnicismDefinition(
    id: newUUID(),
    definition: technicismDefinitionDTO.text,
    domain: technicismDefinitionDTO.domain,
  );
}
