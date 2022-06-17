import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/presentations/common/photo/widgets/photos_list.dart';
import 'package:jwallpaper/src/app/presentations/root/components/main_content_padding.dart';
import 'package:jwallpaper/src/app/presentations/search/view_model/search_view_model.dart';
import 'package:jwallpaper/src/core/widgets/fields/index.dart';
import 'package:jwallpaper/src/core/widgets/list/index.dart';
import 'package:jwallpaper/src/core/widgets/scroll/scroll_to_start.dart';
import 'package:jwallpaper/src/core/widgets/slivers/index.dart';
import 'package:provider/provider.dart';

class SearchView extends StatelessWidget {
  const SearchView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SearchViewModel(),
      child: const _Body(),
    );
  }
}

class _Body extends StatelessWidget {
  const _Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final searchViewModel = context.watch<SearchViewModel>();
    return ScrollToStart(
      child: LoadMoreListener(
        listen: searchViewModel.canLoadMore,
        onLoadMore: searchViewModel.loadOlder,
        child: PhotosList(
          searchViewModel.photos.toList(),
          beginSlivers: [
            AppSliverAppBar(
              titleWidget: SearchTextField(
                hintText: 'what you looking for?',
                onSubmitted: (text) => searchViewModel.search(customQuery: text),
                onClear: searchViewModel.clear,
              ),
            ),
          ],
          endSlivers: [
            ...?searchViewModel.state.mapOrNull(
              loading: (_) => [const ListLoadingSliver()],
              noMoreData: (_) => [
                const SliverBoxInfoMessage(
                  secondaryMessage: Text('no more photos :('),
                ),
              ],
              noDataAvailable: (_) => [
                const SliverFillLoadingError(
                  message: Text(
                    'no photos found :( \ntry (red, cars, portraits, black and white, abtract....)',
                  ),
                )
              ],
              loadingMore: (_) => [const SliverBoxLoadingIndicator()],
              error: (_) => [
                SliverFillLoadingError(
                  message: const Text('cannot load photos, check your connection and try again!'),
                  onRetry: searchViewModel.search,
                )
              ],
            ),
            const MainBottomSliverPadding()
          ],
        ),
      ),
    );
  }
}
