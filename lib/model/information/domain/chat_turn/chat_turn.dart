import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:glosseum_frontend/model/information/data/dtos/information_answer_dto.dart';
import 'package:glosseum_frontend/model/information/data/dtos/information_dto.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';

part 'chat_turn.freezed.dart';

part 'chat_turn.g.dart';

@freezed
abstract class ChatTurn with _$ChatTurn {
  const factory ChatTurn({
    required String question,
    String? answer,
    bool? isSimplified,
  }) = _ChatTurn;

  factory ChatTurn.fromJson(Map<String, dynamic> json) =>
      _$ChatTurnFromJson(json);

  factory ChatTurn.fromQuestionAndDTO(
    String question,
    InformationAnswerDTO infoDTO,
  ) => ChatTurn(
    question: question,
    answer: infoDTO.content,
    isSimplified: infoDTO.isSimplified,
  );
}
