enum InformationStreamProgressEnum {
  simplifying,
  findingTechnicisms,
  none;

  String get snakeCase {
    switch (this) {
      case simplifying:
        return 'simplifying';
      case findingTechnicisms:
        return 'finding_technicisms';
      case none:
        return 'none';
    }
  }

  String get text {
    switch (this) {
      case simplifying:
        return 'Simplificando información';
      case findingTechnicisms:
        return 'Encontrando tecnicismos';
      case none:
        return '';
    }
  }

  factory InformationStreamProgressEnum.fromString(String? value) {
    return InformationStreamProgressEnum.values.firstWhere(
      (streamStatus) =>
          streamStatus.name == value || streamStatus.snakeCase == value,
      orElse: () => InformationStreamProgressEnum.none,
    );
  }
}
