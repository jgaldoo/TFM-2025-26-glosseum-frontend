// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InformationDTO _$InformationDTOFromJson(Map<String, dynamic> json) =>
    _InformationDTO(
      title: json['title'] as String,
      content: json['content'] as String,
      informationType: $enumDecode(
        _$InformationTypeEnumEnumMap,
        json['informationType'],
      ),
      isSimplified: json['isSimplified'] as bool,
    );

Map<String, dynamic> _$InformationDTOToJson(
  _InformationDTO instance,
) => <String, dynamic>{
  'title': instance.title,
  'content': instance.content,
  'informationType': _$InformationTypeEnumEnumMap[instance.informationType]!,
  'isSimplified': instance.isSimplified,
};

const _$InformationTypeEnumEnumMap = {
  InformationTypeEnum.transcribed: 'transcribed',
  InformationTypeEnum.generated: 'generated',
};
