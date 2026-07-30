import 'package:flutter/material.dart';

class InformationAnswerContainer extends StatelessWidget {
  final String answer;
  final bool isSimplified;

  const InformationAnswerContainer({
    super.key,
    required this.answer,
    required this.isSimplified,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 20),
      child: Text(answer, textAlign: TextAlign.left),
    );
  }
}
