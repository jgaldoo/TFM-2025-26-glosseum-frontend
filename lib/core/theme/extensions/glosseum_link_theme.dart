import 'package:flutter/material.dart';

class GlosseumLinkTheme extends ThemeExtension<GlosseumLinkTheme> {
  final Color linkColor;
  final TextDecoration linkDecoration;

  const GlosseumLinkTheme({
    required this.linkColor,
    required this.linkDecoration,
  });

  @override
  ThemeExtension<GlosseumLinkTheme> copyWith({
    Color? linkColor,
    TextDecoration? linkDecoration,
  }) {
    return GlosseumLinkTheme(
      linkColor: linkColor ?? this.linkColor,
      linkDecoration: linkDecoration ?? this.linkDecoration,
    );
  }

  @override
  ThemeExtension<GlosseumLinkTheme> lerp(
    covariant ThemeExtension<GlosseumLinkTheme>? other,
    double t,
  ) {
    if (other is! GlosseumLinkTheme) return this;

    return GlosseumLinkTheme(
      linkColor: Color.lerp(linkColor, other.linkColor, t) ?? linkColor,
      linkDecoration: linkDecoration,
    );
  }
}

GlosseumLinkTheme linkThemeOf(BuildContext context) {
  final linkTheme = Theme.of(context).extension<GlosseumLinkTheme>();

  if (linkTheme == null) {
    throw FlutterError(
      "GlosseumLinkTheme hasn't been found in "
      "ThemeData.extensions.\n Please ensure you've added this to "
      'GlosseumTheme before retrying.',
    );
  }

  return linkTheme;
}
