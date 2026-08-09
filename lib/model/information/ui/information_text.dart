import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/widgets/track_scrollbar.dart';
import 'package:glosseum_frontend/model/information/data/chat_role_enum.dart';
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

                        Text(
                          widget.information.content,
                          style: theme.textTheme.bodyMedium,
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
