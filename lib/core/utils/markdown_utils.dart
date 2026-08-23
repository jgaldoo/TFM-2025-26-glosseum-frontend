import 'package:glosseum_frontend/model/technicism/ui/technicism_inline_syntax.dart';
import 'package:markdown/markdown.dart' as md;

String toPlainText(String markdownText) {
  final document = md.Document();
  final nodes = document.parseLines(
    _removeTechnicismSyntax(markdownText).split('\n'),
  );

  return nodes.map((node) => node.textContent).join('\n').trim();
}

String _removeTechnicismSyntax(String markdownText) {
  return markdownText.replaceAllMapped(
    RegExp(TechnicismInlineSyntax.syntax),
    (match) => match.group(1) ?? '',
  );
}
