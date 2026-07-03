enum InformationTypeEnum { transcribed, generated }

String informationTypeText(InformationTypeEnum infoType, bool isSimplified) {
  switch (infoType) {
    case InformationTypeEnum.transcribed:
      return 'Información transcrita ${isSimplified ? 'y simplificada' : ''}'
          'por la aplicación';
    case InformationTypeEnum.generated:
      return 'Información generada ${isSimplified ? 'y simplificada' : ''}'
          'por la aplicación';
  }
}
