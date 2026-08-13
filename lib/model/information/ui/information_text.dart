import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/widgets/track_scrollbar.dart';
import 'package:glosseum_frontend/model/information/data/chat_role_enum.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';
import 'package:glosseum_frontend/model/information/domain/information.dart';
import 'package:glosseum_frontend/model/information/ui/information_answer_container.dart';
import 'package:glosseum_frontend/model/information/ui/information_question_container.dart';
import 'package:glosseum_frontend/model/technicism/domain/technicism.dart';

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
  final ScrollController _scrollController = ScrollController();

  @override
  void didUpdateWidget(covariant InformationText oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldCount = oldWidget.information.chatSession != null
        ? oldWidget.information.chatSession!.history.length
        : 0;
    final newCount = widget.information.chatSession != null
        ? widget.information.chatSession!.history.length
        : 0;
    final oldContent = oldCount != 0
        ? oldWidget.information.chatSession!.history.last.content
        : '';
    final newContent = newCount != 0
        ? widget.information.chatSession!.history.last.content
        : '';

    if (newCount > oldCount || oldContent != newContent) {
      _scrollToBottom();
    }
  }

  void _scrollToBottom() {
    if (!_scrollController.hasClients) return;

    final shouldScrollDown =
        _scrollController.position.maxScrollExtent -
            _scrollController.position.pixels <=
        100;

    if (!shouldScrollDown) return;

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (!_scrollController.hasClients) return;

      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    });
  }

  InlineSpan _annotateTechnicism(String technicism) {
    return TextSpan(
      children: [
        TextSpan(
          text: technicism,
          style: const TextStyle(decoration: TextDecoration.underline),
        ),
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: Transform.translate(
            offset: const Offset(1, -4),
            child: const Text('?', style: TextStyle(fontSize: 8)),
          ),
        ),
      ],
    );
  }

  List<InlineSpan> _buildText() {
    final technicismOccurrences =
        (widget.information.technicisms ?? [])
            .expand(
              (entity) => entity.occurrences.map(
                (occurrence) => FlattenedTechnicismOccurrence(
                  parent: entity,
                  inText: occurrence.inText,
                  position: occurrence.position,
                ),
              ),
            )
            .toList()
          ..sort((a, b) => a.position.compareTo(b.position));

    final spans = <InlineSpan>[];
    var cursor = 0;

    for (final occurrence in technicismOccurrences) {
      // Texto antes del tecnicismo
      if (cursor < occurrence.position) {
        spans.add(
          TextSpan(
            text: widget.information.content.substring(
              cursor,
              occurrence.position,
            ),
          ),
        );
      }

      // Tecnicismo
      spans.add(
        TextSpan(
          text: occurrence.inText,
          style: const TextStyle(decoration: TextDecoration.underline),
        ),
      );

      spans.add(
        WidgetSpan(
          alignment: PlaceholderAlignment.baseline,
          baseline: TextBaseline.alphabetic,
          child: Transform.translate(
            offset: const Offset(1, -4),
            child: const Text('?', style: TextStyle(fontSize: 8)),
          ),
        ),
      );

      cursor = occurrence.position + occurrence.inText.length;
    }

    // Unir lo que quede de texto al final
    if (cursor < widget.information.content.length) {
      spans.add(TextSpan(text: widget.information.content.substring(cursor)));
    }

    return spans;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  List<Widget> _buildChat(BuildContext context) {
    final sessionHistory = widget.information.chatSession != null
        ? widget.information.chatSession!.history
        : [];

    return sessionHistory.map((message) {
      return message.role == ChatRoleEnum.user
          ? Align(
              alignment: Alignment.centerRight,
              child: InformationQuestionContainer(question: message.content),
            )
          : Align(
              alignment: Alignment.centerLeft,
              child: InformationAnswerContainer(answer: message.content),
            );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 7.5),
              child: TrackScrollbar(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 22.5),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Align(
                          alignment: Alignment.centerRight,
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 15),
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
                        ),

                        Text(
                          widget.information.title,
                          textAlign: TextAlign.left,
                          style: theme.textTheme.titleMedium,
                        ),

                        Divider(
                          height: 20,
                          thickness: 3,
                          indent: 0,
                          endIndent: 0,
                          color: theme.primaryColor,
                        ),

                        RichText(
                          text: TextSpan(
                            style: theme.textTheme.bodyMedium,
                            children: _buildText(),
                          ),
                          textAlign: TextAlign.left,
                        ),

                        ..._buildChat(context),

                        if (widget.isAnswerLoading)
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Padding(
                              padding: EdgeInsetsGeometry.all(10),
                              child: CircularProgressIndicator(
                                color: theme.primaryColor,
                                backgroundColor: theme.scaffoldBackgroundColor,
                              ),
                            ),
                          ),
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
