import 'dart:io';

import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/utils/image_utils.dart';
import 'package:glosseum_frontend/model/photo/data/photo_attributes_notifier.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PhotoPreview extends ConsumerWidget {
  final String imagePath;
  const PhotoPreview({
    super.key,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final photoAttributes = ref.watch(photoAttributesProvider);

    return Transform.translate( // Move the zoom center towards the center of the image
      offset: photoAttributes.panningOffset,
      child: Transform.scale(
        scale: photoAttributes.zoom,
        child: ColorFiltered(
          colorFilter: brightnessFilter(
            photoAttributes.brightness,
          ),
          child: Image.file(
            File(imagePath),
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
