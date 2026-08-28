import 'package:flutter/material.dart';
import 'package:flutter_markdown_plus/flutter_markdown_plus.dart';
import 'package:glosseum_frontend/model/information/domain/information.dart';
import 'package:glosseum_frontend/model/technicism/domain/technicism.dart';
import 'package:glosseum_frontend/model/technicism/ui/technicism_definition_panel.dart';
import 'package:glosseum_frontend/model/technicism/ui/technicism_inline_syntax.dart';
import 'package:glosseum_frontend/model/technicism/ui/technicism_markdown_builder.dart';

class TechnicismMarkdownBody extends StatefulWidget {
  final Information information;

  const TechnicismMarkdownBody({super.key, required this.information});

  @override
  State<TechnicismMarkdownBody> createState() => _TechnicismMarkdownBodyState();
}

class _TechnicismMarkdownBodyState extends State<TechnicismMarkdownBody> {
  final Map<> _mappedTechnicisms = {};

  void _showDefinition(BuildContext context, Technicism technicism) {
    showModalBottomSheet(
      context: context,
      builder: (_) => TechnicismDefinitionPanel(technicism: technicism),
    );
  }

  Technicism? _findTechnicism(String technicismForm) {
    for (final technicism in widget.information.technicisms ?? []) {
      if (technicism.occurrences.any(
            (occurrence) => occurrence.inText == technicismForm,
      )) {
        return technicism;
      }
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return MarkdownBody(
      data: widget.information.content,
      inlineSyntaxes: [TechnicismInlineSyntax()],
      builders: {
        'technicism': TechnicismMarkdownBuilder(
          onTap: (text) {
            final technicism = _findTechnicism(text);

            if (technicism != null) {
              _showDefinition(context, technicism);
            }
          },
        ),
      },
      styleSheet: MarkdownStyleSheet(
        horizontalRuleDecoration: BoxDecoration(
          border: Border(top: BorderSide(color: theme.primaryColor, width: 1)),
        ),
      ),
    );
  }
}
