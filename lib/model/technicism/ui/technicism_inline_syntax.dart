import 'package:markdown/markdown.dart' as md;

class TechnicismInlineSyntax extends md.InlineSyntax {
  TechnicismInlineSyntax() : super(r'\[\[\|([^\]]+)\|\]\]');

  @override
  bool onMatch(md.InlineParser parser, Match match) {
    final text = match.group(1)!;

    parser.addNode(md.Element.text('technicism', text));

    return true;
  }
}
