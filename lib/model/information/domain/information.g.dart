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
  chatTurns:
      (json['chatTurns'] as List<dynamic>?)
          ?.map((e) => ChatTurn.fromJson(e as Map<String, dynamic>))
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
  'chatTurns': instance.chatTurns,
};

const _$InformationTypeEnumEnumMap = {
  InformationTypeEnum.transcribed: 'transcribed',
  InformationTypeEnum.generated: 'generated',
};
