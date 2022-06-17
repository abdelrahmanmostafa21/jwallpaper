import 'package:built_collection/built_collection.dart';
import 'package:jwallpaper/src/app/shared/pexels/data/index.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/index.dart';
import 'package:jwallpaper/src/core/base/base_provider.dart';
import 'package:jwallpaper/src/core/base/view_state.dart';
import 'package:jwallpaper/src/core/errors/handle_error_extension.dart';
import 'package:jwallpaper/src/core/errors/network_error_handler.dart';
import 'package:jwallpaper/src/core/utils/shared/index.dart';

class SearchViewModel extends BaseProvider with RequestLock {
  SearchViewModel({
    this.pexelsRepository = const PexelsRepositoryImpl(),
  });

  final PexelsRepository pexelsRepository;

  String? query;

  int currentPage = 1;
  bool canLoadMore = true;
  BuiltList<PhotoEntity> photos = BuiltList();

  Future<BuiltList<PhotoEntity>?> _request(int page) async {
    if (query == null) {
      return null;
    }
    final results = await pexelsRepository.searchPhotos(query: query!, page: page).then((response) {
      if (response?.photos?.isNotEmpty == true) {
        currentPage = page;
      } else {
        canLoadMore = false;
      }
      return response?.photos?.map(PhotoEntity.fromPhotoModel).toBuiltList();
    }).handleError(apiErrorHandler);
    return results;
  }

  Future<void> search({
    String? customQuery,
  }) async {
    if (_queryUnchanged(query: customQuery)) {
      log.fine('search query does not differ from last query');
      return;
    }

    clear();

    query = customQuery;

    notifyLoading();

    log.fine('searching initial photos with page: 1 for query: $query');

    final results = await _request(currentPage);

    if (results != null && results.isNotEmpty) {
      log.fine('found search: ${results.length} photos loaded for query: $query');
      photos = results;
      notifyState(const ViewState.dataAvailable());
    } else {
      log.fine('not found search: for query: $query');
      notifyState(const ViewState.noDataAvailable());
    }
  }

  Future<void> loadOlder() async {
    if (lock()) {
      log.fine('another paginated search request in process... wait ❌');
      return;
    }
    final page = currentPage + 1;
    log.fine('loading older search photos with page: $page');

    notifyLoadingMore();

    final results = await _request(page);

    if (results != null && results.isNotEmpty) {
      log.fine('found older search: ${results.length} photos loaded');
      photos = photos.followedBy(results).toBuiltList();
      notifyState(const ViewState.dataAvailable());
    } else {
      notifyState(const ViewState.noMoreData());
    }
  }

  bool _queryUnchanged({
    required String? query,
  }) =>
      query == null || query == this.query;

  void clear() {
    currentPage = 1;
    canLoadMore = true;
    photos = BuiltList();
    query = null;
    refresh();
  }
}
