import 'package:flutter/material.dart';

class InformationAnswerContainer extends StatelessWidget {
  final String answer;

  const InformationAnswerContainer({super.key, required this.answer});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Text(answer, textAlign: TextAlign.left),
    );
  }
}
