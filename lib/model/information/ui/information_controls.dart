import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/providers/text_control_notifier.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InformationControls extends ConsumerStatefulWidget {
  final Function(BuildContext context, WidgetRef ref, String message)
  sendMessage;
  final Function(BuildContext context, WidgetRef ref) simplify;
  final bool isAnswerLoading;
  final bool isSimplified;

  const InformationControls({
    super.key,
    required this.sendMessage,
    required this.simplify,
    required this.isAnswerLoading,
    required this.isSimplified,
  });

  @override
  ConsumerState<InformationControls> createState() =>
      _InformationControlsState();
}

class _InformationControlsState extends ConsumerState<InformationControls> {
  void _encapsulatedSendMessage(String message, void Function() clearField) {
    if (!widget.isAnswerLoading && message.trim().isNotEmpty) {
      FocusScope.of(context).unfocus();
      widget.sendMessage(context, ref, message);
      clearField();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textControlNotifier = ref.watch(
      textControlProvider('information-chat').notifier,
    );

    return Container(
      color: theme.scaffoldBackgroundColor,
      child: Padding(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 10),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Divider(),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton(
                    onPressed: !widget.isSimplified
                        ? () {
                            widget.simplify(context, ref);
                          }
                        : null,
                    style: theme.textButtonTheme.style,
                    child: Text('Simplificar'),
                  ),
                ],
              ),
            ),
            TextField(
              controller: textControlNotifier.controller,
              style: theme.textTheme.bodyMedium,
              decoration: InputDecoration(
                isDense: true,
                suffixIcon: ValueListenableBuilder<TextEditingValue>(
                  valueListenable: textControlNotifier.controller,
                  builder: (context, value, child) {
                    final canSend =
                        !widget.isAnswerLoading && value.text.trim().isNotEmpty;

                    return AbsorbPointer(
                      absorbing: !canSend,
                      child: IconButton(
                        onPressed: canSend
                            ? () {
                                _encapsulatedSendMessage(
                                  value.text,
                                  textControlNotifier.controller.clear,
                                );
                              }
                            : null,
                        icon: GlosseumIcon(
                          GlosseumIcons.send,
                          color: theme.primaryColor,
                          size: 44,
                        ),
                      ),
                    );
                  },
                ),
                hintText: 'Escribe una pregunta',
                hintStyle: theme.textTheme.labelLarge?.copyWith(
                  color: theme.hintColor,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: theme.colorScheme.primary,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(
                    color: theme.colorScheme.secondary,
                    width: 2,
                  ),
                ),
              ),
              onSubmitted: (message) {
                _encapsulatedSendMessage(
                  message,
                  textControlNotifier.controller.clear,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

/**
 * Material(
    color: Colors.transparent,
    child: InkWell(
    onTap: () {
    widget.askQuestion(textControlNotifier.controller.text);
    textControlNotifier.controller.clear();
    },
    child: Padding(
    padding: EdgeInsets.all(5),
    child: GlosseumIcon(
    GlosseumIcons.send,
    color: theme.primaryColor,
    ),
    ),
    ),
    ),
 */
