import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/extensions/glosseum_chat_bubble_theme.dart';

class InformationQuestionContainer extends StatelessWidget {
  final String question;

  const InformationQuestionContainer({super.key, required this.question});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final chatBubbleTheme = chatBubbleThemeOf(context);

    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: chatBubbleTheme.chatBubbleColor,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            question,
            style: theme.textTheme.bodyMedium,
            textAlign: TextAlign.left,
          ),
        ),
      ),
    );
  }
}
