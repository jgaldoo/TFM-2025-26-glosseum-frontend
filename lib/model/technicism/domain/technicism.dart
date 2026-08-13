import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/technicism/data/technicism_dto.dart';

part 'technicism.freezed.dart';

part 'technicism.g.dart';

@freezed
abstract class Technicism with _$Technicism {
  const Technicism._();

  const factory Technicism({
    required String canonicalName,
    @Default([]) List<TechnicismDefinition> definitions,
    @Default([]) List<TechnicismOccurrence> occurrences,
  }) = _Technicism;

  factory Technicism.fromJson(Map<String, dynamic> json) =>
      _$TechnicismFromJson(json);

  factory Technicism.fromDTO(TechnicismDTO technicismDTO) => Technicism(
    canonicalName: technicismDTO.canonicalName,
    definitions: technicismDTO.definitions
        .map(TechnicismDefinition.fromDTO)
        .toList(),
    occurrences: technicismDTO.occurrences
        .map(TechnicismOccurrence.fromDTO)
        .toList(),
  );

  List<FlattenedTechnicismOccurrence> get flattenOccurrences {
    return [...occurrences]
        .map(
          (occurrence) => FlattenedTechnicismOccurrence(
            parent: this,
            inText: occurrence.inText,
            position: occurrence.position,
          ),
        )
        .toList()
      ..sort((a, b) => a.position.compareTo(b.position));
  }
}

@freezed
abstract class TechnicismOccurrence with _$TechnicismOccurrence {
  const factory TechnicismOccurrence({
    required String inText,
    required int position,
  }) = _TechnicismOccurrence;

  factory TechnicismOccurrence.fromJson(Map<String, dynamic> json) =>
      _$TechnicismOccurrenceFromJson(json);

  factory TechnicismOccurrence.fromDTO(
    TechnicismOccurrenceDTO technicismOccurrenceDTO,
  ) => TechnicismOccurrence(
    inText: technicismOccurrenceDTO.form,
    position: technicismOccurrenceDTO.position,
  );
}

@freezed
abstract class TechnicismDefinition with _$TechnicismDefinition {
  const factory TechnicismDefinition({
    required String definition,
    required String domain,
  }) = _TechnicismDefinition;

  factory TechnicismDefinition.fromJson(Map<String, dynamic> json) =>
      _$TechnicismDefinitionFromJson(json);

  factory TechnicismDefinition.fromDTO(
    TechnicismDefinitionDTO technicismDefinitionDTO,
  ) => TechnicismDefinition(
    definition: technicismDefinitionDTO.text,
    domain: technicismDefinitionDTO.domain,
  );
}

@freezed
abstract class FlattenedTechnicismOccurrence
    with _$FlattenedTechnicismOccurrence {
  const factory FlattenedTechnicismOccurrence({
    required Technicism parent,
    required String inText,
    required int position,
  }) = _FlattenedTechnicismOccurrence;

  factory FlattenedTechnicismOccurrence.fromJson(Map<String, dynamic> json) =>
      _$FlattenedTechnicismOccurrenceFromJson(json);
}
