import 'package:flutter/material.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';
import 'package:glosseum_frontend/model/information/domain/information.dart';

class InformationText extends StatefulWidget {
  final Information information;

  const InformationText({super.key, required this.information});

  @override
  State<InformationText> createState() => _InformationTextState();
}

class _InformationTextState extends State<InformationText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          informationTypeText(
            widget.information.informationType,
            widget.information.isSimplified,
          ),
          textAlign: TextAlign.right,
        ),
        Text(widget.information.title),

        Text(widget.information.content),

        for (var i = 0; i < widget.information.appAnswers.length; i++) ...[
          Text(widget.information.userQuestions[i], textAlign: TextAlign.right),
          Text(widget.information.appAnswers[i]),
        ],
      ],
    );
  }
}
