import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/providers/text_control_notifier.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InformationControls extends ConsumerStatefulWidget {
  const InformationControls({super.key});

  @override
  ConsumerState<InformationControls> createState() =>
      _InformationControlsState();
}

class _InformationControlsState extends ConsumerState<InformationControls> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textControlNotifier = ref.watch(
      textControlProvider('information-question').notifier,
    );

    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: () {
                  // TODO: Send to backend to simplify
                },
                child: Text('Simplificar'),
              ),

              TextButton(
                onPressed: () {
                  // TODO: Open more options
                },
                child: Text('Más opciones'),
              ),
            ],
          ),

          TextField(
            controller: textControlNotifier.controller,
            decoration: InputDecoration(
              suffix: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    // TODO: Send to backend to process
                  },
                  child: Padding(
                    padding: EdgeInsets.all(8),
                    child: GlosseumIcon(GlosseumIcons.send),
                  ),
                ),
              ),
              hintText: 'Pregunta lo que quieras',
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.secondary,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: theme.colorScheme.primary,
                  width: 2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
