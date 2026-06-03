// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'information.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Information _$InformationFromJson(Map<String, dynamic> json) => _Information(
  title: json['title'] as String,
  content: json['content'] as String,
  status: json['status'] as String,
);

Map<String, dynamic> _$InformationToJson(_Information instance) =>
    <String, dynamic>{
      'title': instance.title,
      'content': instance.content,
      'status': instance.status,
    };
