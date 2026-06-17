import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon_data.dart';

class GlosseumIcon extends StatelessWidget {
  final GlosseumIconData asset;
  final double? size;
  final Color? color;

  static const double _sizeDefault = 30;
  static const Color _colorDefault = Color(0xFFFFFFFF);

  const GlosseumIcon(
    this.asset, {
    super.key,
    this.size,
    this.color
  });

  @override
  Widget build(BuildContext context) {
    final iconTheme = Theme.of(context).iconTheme;

    return SvgPicture.asset(
      asset.assetPath,
      width: size ?? iconTheme.size ?? _sizeDefault,
      height: size ?? iconTheme.size ?? _sizeDefault,
      colorFilter: ColorFilter.mode(color ?? iconTheme.color ?? _colorDefault, BlendMode.srcIn),
    );
  }
}
