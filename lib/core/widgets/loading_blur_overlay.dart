import 'dart:ui';

import 'package:flutter/material.dart';

class LoadingBlurOverlay extends StatelessWidget {
  final bool isLoading;
  final bool useBlur;
  final bool useDimming;
  final Widget child;

  const LoadingBlurOverlay({
    super.key,
    required this.isLoading,
    this.useBlur = true,
    this.useDimming = true,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Stack(
      children: [
        child,

        if (isLoading)
          Positioned.fill(
            child: useBlur
                ? BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 8, sigmaY: 8),
                    child: Container(
                      color: useDimming
                          ? Colors.black.withValues(alpha: 0.2)
                          : null, // subtle dimming
                    ),
                  )
                : Container(
                    color: useDimming
                        ? Colors.black.withValues(alpha: 0.2)
                        : null, // subtle dimming
                  ),
          ),

        if (isLoading)
          Center(
            child: CircularProgressIndicator(
              color: theme.primaryColor,
              backgroundColor: theme.scaffoldBackgroundColor,
            ),
          ),
      ],
    );
  }
}
