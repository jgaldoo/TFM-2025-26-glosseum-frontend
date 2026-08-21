import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:markdown/markdown.dart' as md;

class TechnicismMarkdownBuilder extends MarkdownElementBuilder {
  final void Function(String technicismForm) onTap;

  TechnicismMarkdownBuilder({required this.onTap});

  TextSpan build(String text, int position, TextStyle style) {
    return TextSpan(text: text, style: style);
  }

  @override
  Widget? visitElementAfterWithContext(
    BuildContext context,
    md.Element element,
    TextStyle? preferredStyle,
    TextStyle? parentStyle,
  ) {
    final style = (parentStyle ?? preferredStyle ?? const TextStyle()).copyWith(
      decoration: TextDecoration.underline,
    );

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: element.textContent,
            style: style,
            recognizer: TapGestureRecognizer()
              ..onTap = () => onTap(element.textContent),
          ),
          WidgetSpan(
            alignment: PlaceholderAlignment.baseline,
            baseline: TextBaseline.alphabetic,
            child: Transform.translate(
              offset: Offset(0, -8),
              child: Text(
                '?',
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
