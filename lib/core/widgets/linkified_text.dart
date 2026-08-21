import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/extensions/glosseum_link_theme.dart';
import 'package:glosseum_frontend/core/utils/link_utils.dart';

class LinkifiedText extends StatefulWidget {
  final String text;
  final List<RegExpMatch> links;
  final TextStyle? style;

  const LinkifiedText({
    super.key,
    required this.text,
    required this.links,
    this.style,
  });

  @override
  State<LinkifiedText> createState() => _LinkifiedTextState();
}

class _LinkifiedTextState extends State<LinkifiedText> {
  final List<TapGestureRecognizer> _tapRecognizers = [];

  List<InlineSpan> _buildText(BuildContext context) {
    final theme = Theme.of(context);
    final linkTheme = linkThemeOf(context);
    final usedStyle = widget.style ?? theme.textTheme.titleSmall;

    final spans = <InlineSpan>[];
    var cursor = 0;

    for (final link in widget.links) {
      final recognizer = TapGestureRecognizer()
        ..onTap = () => openLink(link.group(0)!);

      _tapRecognizers.add(recognizer);

      if (link.start > cursor) {
        spans.add(
          TextSpan(
            text: widget.text.substring(cursor, link.start),
            style: usedStyle,
          ),
        );
      }

      spans.add(
        TextSpan(
          text: link.group(0),
          style: usedStyle?.copyWith(
            color: linkTheme.linkColor,
            decoration: linkTheme.linkDecoration,
          ),
          recognizer: recognizer,
        ),
      );

      cursor = link.end;
    }

    if (cursor < widget.text.length) {
      spans.add(
        TextSpan(text: widget.text.substring(cursor), style: usedStyle),
      );
    }

    return spans;
  }
  
  @override
  void dispose() {
    for (final recognizer in _tapRecognizers) {
      recognizer.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(children: _buildText(context)));
  }
}
