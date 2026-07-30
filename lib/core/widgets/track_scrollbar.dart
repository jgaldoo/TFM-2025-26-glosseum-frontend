import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/extensions/glosseum_track_scrollbar_theme.dart';

class TrackScrollbar extends StatelessWidget {
  // Scrollbar parameters
  final Widget child;
  final ScrollController? controller;
  final bool? thumbVisibility;
  final bool? trackVisibility;
  final double? thickness;
  final Radius? radius;
  final bool? interactive;
  final ScrollNotificationPredicate? notificationPredicate;
  final ScrollbarOrientation? scrollbarOrientation;

  // Track parameters
  final Color? trackColor;
  final double? trackThickness;

  const TrackScrollbar({
    super.key,
    required this.child,
    this.controller,
    this.thumbVisibility,
    this.trackVisibility,
    this.thickness,
    this.radius,
    this.interactive,
    this.notificationPredicate,
    this.scrollbarOrientation,
    this.trackColor,
    this.trackThickness,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trackTheme = trackScrollbarThemeOf(context);

    final Color? usedTrackColor = trackColor ?? trackTheme.trackColor;
    final double usedTrackThickness =
        trackThickness ?? trackTheme.trackThickness;
    final double usedThickness =
        (thickness ?? theme.scrollbarTheme.thickness?.resolve({})) ?? 8.0;

    return Stack(
      children: [
        Positioned.fill(
          child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.fromLTRB(
                0,
                0,
                (usedThickness - usedTrackThickness) / 2,
                0,
              ),
              child: Container(
                width: usedTrackThickness,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: usedTrackColor,
                  borderRadius: BorderRadius.circular(usedTrackThickness / 2),
                ),
              ),
            ),
          ),
        ),

        Scrollbar(
          controller: controller,
          thumbVisibility: thumbVisibility,
          trackVisibility: false,
          thickness: thickness,
          radius: radius,
          interactive: interactive,
          notificationPredicate: notificationPredicate,
          scrollbarOrientation: scrollbarOrientation,
          child: child,
        ),
      ],
    );
  }
}
