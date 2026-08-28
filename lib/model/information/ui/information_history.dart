import 'package:flutter/material.dart';
import 'package:glosseum_frontend/core/database/daos/information_dao.dart';
import 'package:glosseum_frontend/core/providers/database_providers/glosseum_database_provider.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icon.dart';
import 'package:glosseum_frontend/core/theme/icons/glosseum_icons.dart';
import 'package:glosseum_frontend/core/utils/date_format_utils.dart';
import 'package:glosseum_frontend/core/utils/markdown_utils.dart';
import 'package:glosseum_frontend/core/widgets/loading_blur_overlay.dart';
import 'package:glosseum_frontend/core/widgets/track_scrollbar.dart';
import 'package:glosseum_frontend/model/information/domain/information.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class InformationHistory extends ConsumerStatefulWidget {
  final bool refresh;

  const InformationHistory({super.key, required this.refresh});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _InformationHistoryState();
}

class _InformationHistoryState extends ConsumerState<InformationHistory> {
  final ScrollController _scrollController = ScrollController();
  final List<Information> _informationHistory = [];
  bool _isLoading = false;

  late int _count;
  final int _elementsPerPage = 20;
  int _pageNumber = 1;

  Future<void> _fetchInformationHistory({bool clearCurrent = false}) async {
    final InformationDAO informationDAO = ref
        .watch(glosseumDatabaseProvider)
        .informationDAO;

    setState(() {
      _isLoading = true;
    });

    if (clearCurrent) {
      _pageNumber = 1;
      _informationHistory.clear();
    }

    _count = await informationDAO.count();

    if (_count == 0) {
      setState(() {
        _isLoading = false;
      });
      return;
    }

    _informationHistory.addAll(
      await informationDAO.selectLatestInformation(
        _elementsPerPage,
        offset: (_pageNumber - 1) * _elementsPerPage,
      ),
    );

    setState(() {
      _isLoading = false;
    });
  }

  Widget _buildItem({required Widget child}) {
    return Container(
      decoration: BoxDecoration(
        border: Border.symmetric(horizontal: BorderSide()),
      ),
      child: ConstrainedBox(
        constraints: BoxConstraints(minHeight: 75),
        child: child,
      ),
    );
  }

  Widget _buildInformationSummary(Information information) {
    final theme = Theme.of(context);
    // Get the first two lines to pass through the markdown parser
    final firstTwoLines = toPlainText(
      information.content.split('\n').take(2).join('\n'),
    );
    final firstLine = firstTwoLines.isNotEmpty
        ? firstTwoLines.split('\n').first
        : '';
    final hasMore = information.content.length > firstLine.length;

    return GestureDetector(
      onTap: () {
        context.push('/information', extra: information);
      },
      child: _buildItem(
        child: Padding(
          padding: EdgeInsetsGeometry.symmetric(vertical: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  Expanded(
                    child: Text(
                      information.title,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  GlosseumIcon(
                    GlosseumIcons.clock,
                    size: 20,
                    color: theme.colorScheme.onSurface,
                  ),
                  Padding(
                    padding: EdgeInsetsGeometry.directional(start: 5),
                    child: Text(
                      datetimeToDateFormat(information.lastAccess),
                      style: theme.textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Text(
                      hasMore ? '$firstLine...' : firstLine,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLoadingItem() {
    return _buildItem(
      child: Align(
        alignment: AlignmentGeometry.center,
        child: CircularProgressIndicator(),
      ),
    );
  }

  void _onScroll() {
    if (!_scrollController.hasClients) return;

    if (_scrollController.position.extentAfter < 300 &&
        !_isLoading &&
        _elementsPerPage * _pageNumber < _count) {
      _pageNumber += 1;
      _fetchInformationHistory();
    }
  }

  @override
  void didUpdateWidget(covariant InformationHistory oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (widget.refresh != oldWidget.refresh) {
      _fetchInformationHistory(clearCurrent: true);
      setState(() {});
    }
  }

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_onScroll);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      _count = await ref.watch(glosseumDatabaseProvider).informationDAO.count();
      await _fetchInformationHistory();
    });
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Historial',
            textAlign: TextAlign.left,
            style: theme.textTheme.headlineMedium,
          ),
          Padding(
            padding: EdgeInsetsGeometry.directional(top: 7),
            child: Divider(
              height: 3,
              thickness: 3,
              indent: 0,
              endIndent: 0,
              color: theme.primaryColor,
            ),
          ),
          Expanded(
            child: TrackScrollbar(
              controller: _scrollController,
              child: CustomScrollView(
                controller: _scrollController,
                slivers: [
                  SliverFillRemaining(
                    hasScrollBody: false,
                    child: LoadingBlurOverlay(
                      isLoading: _isLoading && _informationHistory.isEmpty,
                      useBlur: false,
                      useDimming: false,
                      child: Column(
                        children: [
                          for (final information in _informationHistory) ...[
                            _buildInformationSummary(information),
                          ],
                          if (_isLoading && _informationHistory.isNotEmpty)
                            _buildLoadingItem(),

                          if (!_isLoading && _informationHistory.isEmpty)
                            Padding(
                              padding: EdgeInsetsGeometry.directional(top: 20),
                              child: Text(
                                'No se ha encontrado ningún resultado. '
                                'Transcribe información para visitar aquí '
                                'la información encontrada.',
                                style: theme.textTheme.labelLarge?.copyWith(
                                  color: theme.hintColor,
                                ),
                              ),
                            ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
