import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/widgets/track_scrollbar.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';
import 'package:glosseum_frontend/model/information/domain/information.dart';
import 'package:glosseum_frontend/model/information/ui/information_answer_container.dart';
import 'package:glosseum_frontend/model/information/ui/information_question_container.dart';

class InformationText extends StatefulWidget {
  final Information information;
  final bool isAnswerLoading;

  const InformationText({
    super.key,
    required this.information,
    required this.isAnswerLoading,
  });

  @override
  State<InformationText> createState() => _InformationTextState();
}

class _InformationTextState extends State<InformationText> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            child: Text(
              informationTypeText(
                widget.information.informationType,
                widget.information.isSimplified,
              ),
              textAlign: TextAlign.right,
              style: theme.textTheme.labelLarge?.copyWith(
                color: theme.hintColor,
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              widget.information.title,
              textAlign: TextAlign.left,
              style: theme.textTheme.titleMedium,
            ),
          ),

          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Divider(
              height: 20,
              thickness: 3,
              indent: 0,
              endIndent: 0,
              color: theme.primaryColor,
            ),
          ),

          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: TrackScrollbar(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.information.content,
                          style: theme.textTheme.bodyMedium,
                          textAlign: TextAlign.left,
                        ),

                        for (
                          var i = 0;
                          i < widget.information.chatTurns.length;
                          i++
                        ) ...[
                          Align(
                            alignment: Alignment.centerRight,
                            child: InformationQuestionContainer(
                              question:
                                  widget.information.chatTurns[i].question,
                            ),
                          ),
                          if (widget.information.chatTurns[i].answer != null)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InformationAnswerContainer(
                                answer: widget.information.chatTurns[i].answer!,
                                isSimplified:
                                    widget
                                        .information
                                        .chatTurns[i]
                                        .isSimplified ??
                                    false,
                              ),
                            ),

                          if (widget.information.chatTurns[i].answer == null)
                            Align(
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: EdgeInsetsGeometry.all(10),
                                child: CircularProgressIndicator(
                                  color: theme.primaryColor,
                                  backgroundColor:
                                      theme.scaffoldBackgroundColor,
                                ),
                              ),
                            ),
                        ],
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
