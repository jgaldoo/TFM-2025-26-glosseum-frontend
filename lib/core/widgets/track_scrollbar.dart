import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/extensions/glosseum_track_scrollbar_theme.dart';

class TrackScrollbar extends StatefulWidget {
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
  State<TrackScrollbar> createState() => _TrackScrollbarState();
}

class _TrackScrollbarState extends State<TrackScrollbar> {
  ScrollController? _usedController;
  bool _showTrack = false;

  void _updateShowTrack() {
    final shouldShow =
        _usedController != null &&
        _usedController!.hasClients &&
        _usedController!.position.maxScrollExtent > 0;

    if (shouldShow != _showTrack) {
      setState(() {
        _showTrack = shouldShow;
      });
    }
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final ScrollController possibleController =
        widget.controller ?? PrimaryScrollController.of(context);

    if (possibleController != _usedController) {
      if (_usedController != null) {
        _usedController!.removeListener(_updateShowTrack);
      }

      _usedController = possibleController;
      _usedController!.addListener(_updateShowTrack);

      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _updateShowTrack();
        }
      });
    }
  }

  @override
  void dispose() {
    if (_usedController != null) {
      _usedController!.removeListener(_updateShowTrack);
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final trackTheme = trackScrollbarThemeOf(context);

    final Color? usedTrackColor = widget.trackColor ?? trackTheme.trackColor;
    final double usedTrackThickness =
        widget.trackThickness ?? trackTheme.trackThickness;
    final double usedThickness =
        (widget.thickness ?? theme.scrollbarTheme.thickness?.resolve({})) ??
        8.0;

    return Stack(
      children: [
        if (_showTrack)
          Positioned.fill(
            child: Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.fromLTRB(
                  0,
                  0,
                  (usedThickness - usedTrackThickness) * 0.5,
                  0,
                ),
                child: Container(
                  width: usedTrackThickness,
                  height: double.infinity,
                  decoration: BoxDecoration(
                    color: usedTrackColor,
                    borderRadius: BorderRadius.circular(
                      usedTrackThickness * 0.5,
                    ),
                  ),
                ),
              ),
            ),
          ),

        Scrollbar(
          controller: _usedController,
          thumbVisibility: widget.thumbVisibility,
          trackVisibility: false,
          thickness: widget.thickness,
          radius: widget.radius,
          interactive: widget.interactive,
          notificationPredicate: widget.notificationPredicate,
          scrollbarOrientation: widget.scrollbarOrientation,
          child: widget.child,
        ),
      ],
    );
  }
}
