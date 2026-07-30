// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_turn.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatTurn _$ChatTurnFromJson(Map<String, dynamic> json) => _ChatTurn(
  question: json['question'] as String,
  answer: json['answer'] as String?,
  isSimplified: json['isSimplified'] as bool?,
);

Map<String, dynamic> _$ChatTurnToJson(_ChatTurn instance) => <String, dynamic>{
  'question': instance.question,
  'answer': instance.answer,
  'isSimplified': instance.isSimplified,
};
