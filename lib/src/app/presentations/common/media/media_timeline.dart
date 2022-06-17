import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jwallpaper/src/app/presentations/common/photo/widgets/photos_list.dart';
import 'package:jwallpaper/src/app/presentations/home/view_model/home_view_model.dart';
import 'package:jwallpaper/src/config/layout/index.dart';
import 'package:jwallpaper/src/core/widgets/list/index.dart';
import 'package:jwallpaper/src/core/widgets/misc/custom_refresh_indicator.dart';
import 'package:jwallpaper/src/core/widgets/scroll/scroll_direction_listener.dart';
import 'package:jwallpaper/src/core/widgets/scroll/scroll_to_start.dart';
import 'package:jwallpaper/src/core/widgets/slivers/index.dart';

class MediaTimeline extends StatefulWidget {
  const MediaTimeline({
    Key? key,
    this.beginSlivers = const [],
    this.endSlivers = const [SliverBottomPadding()],
    this.refreshIndicatorOffset,
    this.listKey,
  }) : super(key: key);

  final List<Widget> beginSlivers;
  final List<Widget> endSlivers;
  final double? refreshIndicatorOffset;
  final Key? listKey;

  @override
  _MediaTimelineState createState() => _MediaTimelineState();
}

class _MediaTimelineState extends State<MediaTimeline> {
  late ScrollController _controller;
  late bool _disposeController;

  /// The index of the newest visible post.

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final primaryScrollController = PrimaryScrollController.of(context);
    _disposeController = primaryScrollController == null;
    _controller = primaryScrollController ?? ScrollController();
  }

  @override
  void dispose() {
    if (_disposeController) {
      _controller.dispose();
    }

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final config = context.watch<LayoutConfigCubit>().state;
    final viewModel = context.watch<HomeViewModel>();

    return ScrollToStart(
      controller: _controller,
      child: CustomRefreshIndicator(
        offset: widget.refreshIndicatorOffset ?? config.paddingValue,
        onRefresh: () async {
          ScrollDirection.of(context)?.reset();
          await viewModel.loadInitial();
        },
        child: LoadMoreListener(
          listen: viewModel.canLoadMore,
          onLoadMore: viewModel.loadOlder,
          child: PhotosList(
            viewModel.photos.toList(),
            key: widget.listKey,
            controller: _controller,
            beginSlivers: widget.beginSlivers,
            endSlivers: [
              ...?viewModel.state.mapOrNull(
                loading: (_) => [const ListLoadingSliver()],
                noMoreData: (_) => [
                  const SliverBoxInfoMessage(
                    secondaryMessage: Text('no more photos :('),
                  ),
                ],
                noDataAvailable: (_) => [
                  const SliverFillLoadingError(
                    message: Text('no photos found :('),
                  )
                ],
                loadingMore: (_) => [const SliverBoxLoadingIndicator()],
                error: (_) => [
                  SliverFillLoadingError(
                    message: const Text('cannot load photos, check your connection and try again!'),
                    onRetry: () => viewModel.loadInitial(clearPervious: true),
                  )
                ],
              ),
              ...widget.endSlivers,
            ],
          ),
        ),
      ),
    );
  }
}
