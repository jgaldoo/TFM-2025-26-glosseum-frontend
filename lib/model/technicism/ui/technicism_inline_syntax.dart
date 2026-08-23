import 'package:markdown/markdown.dart' as md;

class TechnicismInlineSyntax extends md.InlineSyntax {
  static final String syntax = r'\[\[\|([\s\S]+?)\|\]\]';

  TechnicismInlineSyntax() : super(syntax);

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final text = match.group(1)!;

    parser.addNode(md.Element.text('technicism', text));

    return true;
  }
}
