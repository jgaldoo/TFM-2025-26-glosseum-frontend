import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:glosseum_frontend/core/widgets/loading_blur_overlay.dart';
import 'package:glosseum_frontend/core/widgets/track_scrollbar.dart';
import 'package:glosseum_frontend/model/information/data/chat_role_enum.dart';
import 'package:glosseum_frontend/model/information/data/information_type_enum.dart';
import 'package:glosseum_frontend/model/information/domain/information.dart';
import 'package:glosseum_frontend/model/information/ui/information_answer_container.dart';
import 'package:glosseum_frontend/model/information/ui/information_question_container.dart';
import 'package:glosseum_frontend/model/technicism/domain/technicism.dart';
import 'package:glosseum_frontend/model/technicism/ui/technicism_definition_panel.dart';
import 'package:glosseum_frontend/model/technicism/ui/technicism_inline_syntax.dart';
import 'package:glosseum_frontend/model/technicism/ui/technicism_markdown_builder.dart';
import 'package:simple_typing_indicator/simple_typing_indicator.dart';

class InformationText extends StatefulWidget {
  final Information information;
  final bool isAnswerLoading;
  final bool isSimplifying;
  final String? progressInformation;

  const InformationText({
    super.key,
    required this.information,
    required this.isAnswerLoading,
    required this.isSimplifying,
    this.progressInformation,
  });

  @override
  State<InformationText> createState() => _InformationTextState();
}

class _InformationTextState extends State<InformationText> {
  final ScrollController _scrollController = ScrollController();
  final List<TapGestureRecognizer> _tapRecognizers = [];

  void _showDefinition(Technicism technicism) {
    showModalBottomSheet(
      context: context,
      builder: (_) => TechnicismDefinitionPanel(technicism: technicism),
    );
  }

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

  Technicism? _findTechnicism(String technicismForm) {
    for (final technicism in widget.information.technicisms ?? []) {
      if (technicism.occurrences.any(
        (occurrence) => occurrence.inText == technicismForm,
      )) {
        return technicism;
      }
    }

    return null;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    for (final recognizer in _tapRecognizers) {
      recognizer.dispose();
    }
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
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: TrackScrollbar(
                controller: _scrollController,
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
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
                            style: theme.textTheme.headlineMedium,
                          ),
                          Divider(
                            height: 20,
                            thickness: 3,
                            indent: 0,
                            endIndent: 0,
                            color: theme.primaryColor,
                          ),
                        ],
                      ),
                    ),

                    SliverFillRemaining(
                      hasScrollBody: false,
                      child: LoadingBlurOverlay(
                        isLoading:
                            widget.isSimplifying &&
                            widget.information.content.isEmpty,
                        useBlur: false,
                        useDimming: false,
                        child: Column(
                          children: [
                            if (!widget.isSimplifying ||
                                widget.information.content.isNotEmpty) ...[
                              MarkdownBody(
                                data: widget.information.content,
                                inlineSyntaxes: [TechnicismInlineSyntax()],
                                builders: {
                                  'technicism': TechnicismMarkdownBuilder(
                                    onTap: (text) {
                                      // Find the corresponding special entity.
                                      final technicism = _findTechnicism(text);

                                      if (technicism != null) {
                                        _showDefinition(technicism);
                                      }
                                    },
                                  ),
                                },
                              ),

                              if (widget.isSimplifying)
                                Padding(
                                  padding: EdgeInsetsGeometry.symmetric(
                                    vertical: 10,
                                  ),
                                  child: Row(
                                    children: [
                                      if (widget.progressInformation != null)
                                        Padding(
                                          padding:
                                              EdgeInsetsGeometry.directional(
                                                end: 10,
                                              ),
                                          child: Text(
                                            widget.progressInformation!,
                                            style: theme.textTheme.labelMedium
                                                ?.copyWith(
                                                  color: theme.hintColor,
                                                ),
                                          ),
                                        ),
                                      SimpleTypingIndicator(),
                                    ],
                                  ),
                                ),

                              if (!widget.isSimplifying) ...[
                                ..._buildChat(context),
                                if (widget.isAnswerLoading)
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
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

/**
 * RichText(
    text: TextSpan(
    style: theme.textTheme.bodyMedium,
    children: _buildText(),
    ),
    textAlign: TextAlign.left,
    ),
 */
