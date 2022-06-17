import 'dart:math' as math;

import 'package:built_collection/built_collection.dart';
import 'package:jwallpaper/src/app/shared/pexels/data/repositories/index.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/entities/index.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/repositories/pexel_repository.dart';
import 'package:jwallpaper/src/core/base/base_provider.dart';
import 'package:jwallpaper/src/core/base/view_state.dart';
import 'package:jwallpaper/src/core/errors/handle_error_extension.dart';
import 'package:jwallpaper/src/core/errors/network_error_handler.dart';
import 'package:jwallpaper/src/core/utils/shared/index.dart';

class HomeViewModel extends BaseProvider with RequestLock {
  HomeViewModel({
   this.pexelsRepository = const PexelsRepositoryImpl(),
  }) {
    loadInitial();
  }

  final PexelsRepository pexelsRepository;

  int currentPage = 1;
  bool canLoadMore = true;
  BuiltList<PhotoEntity> photos = BuiltList();

  Future<BuiltList<PhotoEntity>?> _request(int page) async {
    final results = await pexelsRepository.randomPhotos(page: page).then((response) {
      if (response?.photos?.isNotEmpty == true) {
        currentPage = page;
      } else {
        canLoadMore = false;
      }
      return response?.photos?.map(PhotoEntity.fromPhotoModel).toBuiltList();
    }).handleError(apiErrorHandler);
    return results;
  }

  Future<void> loadInitial({bool clearPervious = false}) async {
    if (clearPervious) {
      photos = BuiltList();
    }

    notifyLoading();

    final page = math.Random().nextInt(100);

    log.fine('Loading initial photos with page: $page');

    final results = await _request(page);

    if (results != null && results.isNotEmpty) {
      log.fine('found: ${results.length} photos loaded');
      photos = results;
      notifyState(const ViewState.dataAvailable());
    } else {
      notifyState(const ViewState.noDataAvailable());
    }
  }

  Future<void> loadOlder() async {
    if (lock()) {
      log.fine('another paginated request in process... wait ❌');
      return;
    }
    final page = currentPage + 1;
    log.fine('loading older random photos with page: $page');

    notifyLoadingMore();

    final results = await _request(page);

    if (results != null && results.isNotEmpty) {
      log.fine('found older: ${results.length} photos loaded');
      photos = photos.followedBy(results).toBuiltList();
      notifyState(const ViewState.dataAvailable());
    } else {
      notifyState(const ViewState.noMoreData());
    }
  }
}
