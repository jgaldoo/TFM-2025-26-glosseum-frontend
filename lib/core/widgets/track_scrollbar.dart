import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/extensions/glosseum_track_scrollbar_theme.dart';

class TrackScrollbar extends StatefulWidget {
  // Scrollbar parameters
  final Widget child;
  final ScrollController? controller;
  final Color? thumbColor;
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

  // Padding
  final double paddingInset;

  const TrackScrollbar({
    super.key,
    required this.child,
    this.controller,
    this.thumbVisibility = true,
    this.trackVisibility = true,
    this.thickness = 8.0,
    this.radius = const Radius.circular(8.0),
    this.interactive,
    this.notificationPredicate,
    this.scrollbarOrientation,
    this.thumbColor,
    this.trackColor,
    this.trackThickness,
    this.paddingInset = -22.5,
  });

  @override
  State<TrackScrollbar> createState() => _TrackScrollbarState();
}

class _TrackScrollbarState extends State<TrackScrollbar> {
  ScrollController? _usedController;
  bool _showTrack = false;

  void _updateShowTrack() {
    if (_usedController == null || !_usedController!.hasClients) {
      return;
    }

    if (!_usedController!.position.hasContentDimensions) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        if (mounted) {
          _updateShowTrack();
        }
      });
      return;
    }

    final shouldShow = _usedController!.position.maxScrollExtent > 0;

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
    final Color? usedThumbColor =
        widget.thumbColor ?? theme.scrollbarTheme.thumbColor?.resolve({});
    final double usedThickness =
        (widget.thickness ?? theme.scrollbarTheme.thickness?.resolve({})) ??
        8.0;

    final double trackInset = -(usedThickness - usedTrackThickness) * 0.5;

    return Stack(
      clipBehavior: Clip.none,
      children: [
        if (_showTrack)
          Positioned(
            top: 0,
            bottom: 0,
            right: widget.paddingInset - trackInset,
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: usedTrackThickness,
                height: double.infinity,
                decoration: BoxDecoration(
                  color: usedTrackColor,
                  borderRadius: BorderRadius.circular(usedTrackThickness * 0.5),
                ),
              ),
            ),
          ),

        RawScrollbar(
          controller: _usedController,
          thumbColor: usedThumbColor,
          thumbVisibility: widget.thumbVisibility,
          trackVisibility: false,
          thickness: widget.thickness,
          radius: widget.radius,
          interactive: widget.interactive,
          scrollbarOrientation: widget.scrollbarOrientation,
          padding: EdgeInsets.only(right: widget.paddingInset),
          child: widget.child,
        ),
      ],
    );
  }
}
