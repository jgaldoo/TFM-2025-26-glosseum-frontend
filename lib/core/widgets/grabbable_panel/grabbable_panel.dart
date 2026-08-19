import 'dart:math';

import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:glosseum_frontend/core/widgets/track_scrollbar.dart';
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
  final Widget? bottomNavigationBar;

  const GrabbablePanel({
    super.key,
    this.title,
    this.tabs,
    this.innerContent,
    this.bottomNavigationBar,
  }) : assert(
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
  late List<ScrollController> _controllers;
  double _height = 0.5;

  Widget _buildContent(Widget? content, ScrollController? controller) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 15, horizontal: 30),
          child: TrackScrollbar(
            controller: controller,
            child: SingleChildScrollView(
              controller: controller,
              child: content,
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();

    tabs = widget.tabs ?? [];
    _controllers = [];
    for (final _ in tabs) {
      _controllers.add(ScrollController());
    }
  }

  @override
  void dispose() {
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
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
          Stack(
            children: [
              // Handle
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
                right: 15,
                top: 15,
                child: GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: SizedBox(
                    height: 45,
                    width: 45,
                    child: Align(
                      child: GlosseumIcon(
                        GlosseumIcons.cross,
                        size: 25,
                        color: theme.colorScheme.onSurface,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          if (widget.title != null)
            Text(widget.title!, style: theme.textTheme.titleMedium),

          if (tabs.isNotEmpty) ...[
            DefaultTabController(
              length: tabs.length,
              child: Expanded(
                child: Column(
                  children: [
                    TabBar(
                      tabs: [
                        for (final tab in tabs)
                          Tab(
                            child: Text(
                              tab.title,
                              style: theme.textTheme.bodyMedium!.copyWith(
                                color: tab.enabled ? null : Colors.grey,
                              ),
                            ),
                          ),
                      ],
                    ),
                    Expanded(
                      child: TabBarView(
                        children: [
                          for (final (i, tab) in tabs.indexed)
                            _buildContent(tab.child, _controllers[i]),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ] else
            Expanded(child: _buildContent(widget.innerContent, null)),

          if (widget.bottomNavigationBar != null) widget.bottomNavigationBar!,
        ],
      ),
    );
  }
}
