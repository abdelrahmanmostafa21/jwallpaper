import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/common/misc/default_app_bar.dart';
import 'package:jwallpaper/src/app/presentations/common/photo/widgets/photos_list.dart';
import 'package:jwallpaper/src/app/presentations/liked/view_model/liked_view_model.dart';
import 'package:jwallpaper/src/app/presentations/root/components/main_content_padding.dart';
import 'package:jwallpaper/src/core/widgets/list/index.dart';
import 'package:jwallpaper/src/core/widgets/slivers/index.dart';
import 'package:provider/provider.dart';

class LikesView extends StatelessWidget {
  const LikesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<LikesViewModel>();
    return PhotosList(
      viewModel.photos.toList(),
      beginSlivers: const [
        DefaultSliverAppBar(
          showIcon: false,
          title: 'likes',
        ),
      ],
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
              onRetry: viewModel.load,
            )
          ],
        ),
        const MainBottomSliverPadding()
      ],
    );
  }
}
