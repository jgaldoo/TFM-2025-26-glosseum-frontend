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
      required double maxBrightness
  });
}