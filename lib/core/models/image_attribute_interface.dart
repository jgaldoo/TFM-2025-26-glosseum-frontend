import 'dart:ui';

import 'image_attributes.dart';

abstract class ImageAttributeInterface {
  ImageAttributes get state;

  void toggleMenu();
  void setZoom(double value);
  void setBrightness(double value);
  void setLimits({
    required double minZoom,
    required double maxZoom,
    required double minBrightness,
    required double maxBrightness,
  });
  void setDisplaySize(Size displaySize);

  void setFocusPoint(Offset point);
  void setExposurePoint(Offset point);
  void setPanningOffset(Offset panning);
  void addPanningOffset(Offset panning);
}