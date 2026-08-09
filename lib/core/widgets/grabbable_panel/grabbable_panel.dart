import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class PanelTab {
  final String title;
  final Widget child;
  final bool enabled;

  const PanelTab({
    required this.title,
    required this.child,
    this.enabled = true,
  });
}

class GrabbablePanel extends ConsumerStatefulWidget {
  final String? title;
  final List<PanelTab>? tabs;
  final Widget? innerContent;

  const GrabbablePanel({super.key, this.title, this.tabs, this.innerContent})
    : assert(
        (innerContent != null) != (tabs != null),
        'Provide either content or tabs.',
      );

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _GrabbablePanelState();
}

class _GrabbablePanelState extends ConsumerState<GrabbablePanel> {
  static const _maximumHeight = 0.7;
  static const _minimumHeight = 0.3;

  late List<PanelTab> tabs;
  double _height = 0.5;

  Widget _buildContent(Widget? content) {
    return Expanded(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: content,
            ),
          );
        },
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    tabs = widget.tabs ?? [];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final mediaSize = MediaQuery.of(context).size;

    return Container(
      width: mediaSize.width,
      height: mediaSize.height * _height,
      decoration: BoxDecoration(
        color: theme.scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(mediaSize.width * 0.3),
      ),
      child: Column(
        children: [
          // Handle
          Stack(
            children: [
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onVerticalDragUpdate: (details) {
                    final double delta = details.delta.dy;

                    setState(() {
                      _height = (_height - (delta / mediaSize.height)).clamp(
                        _minimumHeight,
                        _maximumHeight,
                      );
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Container(
                      width: max(mediaSize.width * 0.2, 50),
                      height: 8,
                      decoration: BoxDecoration(
                        color: theme.primaryColor,
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ),
                ),
              ),

              // Close button
              Positioned(
                right: 5,
                top: 5,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: GlosseumIcon(
                    GlosseumIcons.cross,
                    size: 60,
                    color: theme.colorScheme.onSurface,
                  ),
                ),
              ),
            ],
          ),

          if (widget.title != null) Text(widget.title!),

          if (tabs.isNotEmpty) ...[
            TabBar(
              tabs: [
                for (final tab in tabs)
                  Tab(
                    child: Text(
                      tab.title,
                      style: TextStyle(color: tab.enabled ? null : Colors.grey),
                    ),
                  ),
              ],
            ),
            TabBarView(
              children: [for (final tab in tabs) _buildContent(tab.child)],
            ),
          ] else
            _buildContent(widget.innerContent),
        ],
      ),
    );
  }
}
