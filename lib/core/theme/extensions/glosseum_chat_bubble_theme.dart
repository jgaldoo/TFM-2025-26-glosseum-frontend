import 'package:flutter/material.dart';

class GlosseumChatBubbleTheme extends ThemeExtension<GlosseumChatBubbleTheme> {
  final Color chatBubbleColor;

  const GlosseumChatBubbleTheme({required this.chatBubbleColor});

  @override
  ThemeExtension<GlosseumChatBubbleTheme> copyWith({Color? chatBubbleColor}) {
    return GlosseumChatBubbleTheme(
      chatBubbleColor: chatBubbleColor ?? this.chatBubbleColor,
    );
  }

  @override
  ThemeExtension<GlosseumChatBubbleTheme> lerp(
    covariant ThemeExtension<GlosseumChatBubbleTheme>? other,
    double t,
  ) {
    if (other is! GlosseumChatBubbleTheme) return this;

    return GlosseumChatBubbleTheme(
      chatBubbleColor:
          Color.lerp(chatBubbleColor, other.chatBubbleColor, t) ??
          chatBubbleColor,
    );
  }
}

GlosseumChatBubbleTheme chatBubbleThemeOf(BuildContext context) {
  final chatBubbleTheme = Theme.of(
    context,
  ).extension<GlosseumChatBubbleTheme>();

  if (chatBubbleTheme == null) {
    throw FlutterError(
      "GlosseumChatBubbleTheme hasn't been found in "
      "ThemeData.extensions.\n Please ensure you've added this to "
      'GlosseumTheme before retrying.',
    );
  }

  return chatBubbleTheme;
}
