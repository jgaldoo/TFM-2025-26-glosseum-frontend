import 'dart:async';

import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/models/image_attribute_interface.dart';
import 'package:glosseum_frontend/core/utils/image_utils.dart';
import 'package:glosseum_frontend/core/widgets/focus_point.dart';

class CameraGestureLayer extends StatefulWidget {

  final ImageAttributeInterface imageAttributeInterface;
  final void Function(Offset position)? onFocusRequested;
  final Widget child;
  final bool enablePanning;

  const CameraGestureLayer({
    super.key,
    required this.imageAttributeInterface,
    this.onFocusRequested,
    required this.child, 
    required this.enablePanning,
  });

  @override
  State<CameraGestureLayer> createState() => _CameraGestureLayerState();
}

class _CameraGestureLayerState extends State<CameraGestureLayer> {
  late double _gestureZoom;
  Offset? _focusPoint;
  final double _focusPointSize = 60;
  final double _focusPointPadding = 25;
  Timer? _focusTimer;
  bool showFocus = false;

  static const int FOCUS_POINT_SHOW_SECONDS = 1;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = constraints.biggest;
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.imageAttributeInterface.setDisplaySize(size);
        });

        final focusRadius = _focusPointSize/2;
        final Offset? focusDisplayOffset = _focusPoint != null
            ? Offset(
              _focusPoint!.dx.clamp(_focusPointPadding + focusRadius,
                  size.width - _focusPointPadding - focusRadius)
              , _focusPoint!.dy.clamp(_focusPointPadding + focusRadius,
                  size.height - _focusPointPadding - focusRadius)
              )
            : null;

        return GestureDetector(
          behavior: HitTestBehavior.translucent,

          onScaleStart: (_) {
            _gestureZoom = widget.imageAttributeInterface.state.zoom;
          },
          onScaleUpdate: (details) {
            // Pinching gesture to zoom
            if (details.pointerCount == 2) {
              final newZoom = (_gestureZoom * details.scale);

              widget.imageAttributeInterface.setZoom(newZoom);
            }
            // Dragging to change brightness
            else if (details.pointerCount == 1 && showFocus) {
              _focusTimer?.cancel();

              // Reduce the rate of increment to let users have more control
              final delta = details.focalPointDelta.dy / 150;
              final newBrightness = (widget.imageAttributeInterface.state
                  .brightness - delta);

              widget.imageAttributeInterface.setBrightness(newBrightness);

              _focusTimer = Timer(
                  const Duration(seconds: FOCUS_POINT_SHOW_SECONDS),
                      () {
                    setState(() {
                      showFocus = false;
                    });
                  });
            }
            else if (details.pointerCount == 1 && widget.enablePanning) {


              widget.imageAttributeInterface
                  .addPanningOffset(details.focalPointDelta);
            }
          },

          // Tapping once to focus
          onTapUp: (details) {
            final normalizedPoint = normalizePoint(
                point: details.localPosition, size: size);

            showFocus = true;
            _focusTimer?.cancel();

            setState(() => _focusPoint = details.localPosition);

            widget.onFocusRequested?.call(details.localPosition);

            widget.imageAttributeInterface.setFocusPoint(normalizedPoint);
            widget.imageAttributeInterface.setExposurePoint(normalizedPoint);

            widget.imageAttributeInterface.setBrightness(0.0);

            // Wait X seconds to remove the focus circle
            _focusTimer = Timer(
                const Duration(seconds: FOCUS_POINT_SHOW_SECONDS),
                () {
                  setState(() {
                    showFocus = false;
                  });
                });
          },


          child: Stack(
            children: [
              widget.child,

              if (showFocus && focusDisplayOffset != null)
                FocusPoint(
                  focusPointSize: _focusPointSize,
                  containerSizeWidth: size.width,
                  focusDisplayOffset: focusDisplayOffset,
                  brightness: widget.imageAttributeInterface.state.brightness,
                  minBrightness: widget.imageAttributeInterface.state
                      .minBrightness,
                  maxBrightness: widget.imageAttributeInterface.state
                      .maxBrightness,
                ),
            ],
          ),

        );
      }
    );
  }

  @override
  void dispose() {
    _focusTimer?.cancel();
    super.dispose();
  }
}
