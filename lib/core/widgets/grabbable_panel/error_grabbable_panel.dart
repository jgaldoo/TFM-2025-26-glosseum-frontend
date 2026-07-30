import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:glosseum_frontend/core/widgets/grabbable_panel/grabbable_panel.dart';

class ErrorGrabbablePanel extends StatelessWidget {
  final int? statusCode;
  final String message;

  const ErrorGrabbablePanel({
    super.key,
    this.statusCode,
    required this.message,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;

        final iconSize = size.width * 0.4;

        return GrabbablePanel(
          innerContent: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Error icon
                Center(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Stack(
                      children: [
                        Center(
                          child: Container(
                            width: iconSize,
                            height: iconSize,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: theme.primaryColor,
                            ),
                          ),
                        ),
                        Center(
                          child: GlosseumIcon(
                            GlosseumIcons.cross,
                            size: iconSize,
                            color: theme.iconTheme.color,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                Text(
                  '${statusCode != null ? 'HTTP $statusCode\n' : ''}$message',
                  style: theme.textTheme.displaySmall,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
