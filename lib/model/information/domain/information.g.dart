// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Information _$InformationFromJson(Map<String, dynamic> json) => _Information(
  title: json['title'] as String,
  content: json['content'] as String,
  informationType: $enumDecode(
    _$InformationTypeEnumEnumMap,
    json['informationType'],
  ),
  isSimplified: json['isSimplified'] as bool,
  userQuestions:
      (json['userQuestions'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
  appAnswers:
      (json['appAnswers'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList() ??
      const [],
);

Map<String, dynamic> _$InformationToJson(
  _Information instance,
) => <String, dynamic>{
  'title': instance.title,
  'content': instance.content,
  'informationType': _$InformationTypeEnumEnumMap[instance.informationType]!,
  'isSimplified': instance.isSimplified,
  'userQuestions': instance.userQuestions,
  'appAnswers': instance.appAnswers,
};

const _$InformationTypeEnumEnumMap = {
  InformationTypeEnum.transcribed: 'transcribed',
  InformationTypeEnum.generated: 'generated',
};
