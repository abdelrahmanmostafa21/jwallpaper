import 'package:flutter/services.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:jwallpaper/src/app/shared/pexels/data/index.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/index.dart';
import 'package:jwallpaper/src/core/base/base_provider.dart';
import 'package:jwallpaper/src/core/base/view_state.dart';
import 'package:jwallpaper/src/core/errors/handle_error_extension.dart';
import 'package:jwallpaper/src/core/errors/network_error_handler.dart';

class LikesViewModel extends BaseProvider {
  LikesViewModel({
    this.pexelsRepository = const PexelsRepositoryImpl(),
    this.pexelsDatasource = const PexelsPrefsDatasourceImpl(),
  }) {
    load();
  }

  final PexelsRepository pexelsRepository;
  final PexelsDatasource pexelsDatasource;

  List<PhotoEntity> photos = [];

  Future<void> load() async {
    if (!hasLikes) {
      log.info('no liked photos found');
      notifyState(const ViewState.noDataAvailable());
      return;
    }

    notifyLoading();

    log.info('will load liked photos from pexels api ${likedIds.length}');

    for (final id in likedIds) {
      if (photos.firstWhereOrNull((element) => element.id == id) == null) {
        final photo = await pexelsRepository
            .photoById(id: id)
            .then((response) => response != null ? PhotoEntity.fromPhotoModel(response) : null)
            .handleError(apiErrorHandler);
        if (photo != null) {
          log.fine(' photo with id: ${photo.id} loaded');
          photos
            ..add(photo)
            ..toSet().toList();
        }
      }
    }

    if (photos.isNotEmpty) {
      log.fine('found: ${photos.length} loaded');
      notifyState(const ViewState.dataAvailable());
    } else {
      log.fine('no photos found');
      notifyState(const ViewState.noDataAvailable());
    }
  }

  void onFavorite(PhotoEntity photo) {
    HapticFeedback.lightImpact();
    final values = List<int>.from(pexelsDatasource.likedPhotos)
      ..add(photo.id)
      ..toSet()
      ..toList();
    pexelsDatasource.likedPhotos = values;
    photos
      ..add(photo)
      ..toSet()
      ..toList();
    refresh();
  }

  void onUnFavorite(PhotoEntity photo) {
    HapticFeedback.lightImpact();
    final values = List<int>.from(pexelsDatasource.likedPhotos)
      ..remove(photo.id)
      ..toSet()
      ..toList();
    pexelsDatasource.likedPhotos = values;
    photos
      ..removeWhere((ph) => ph.id == photo.id)
      ..toSet()
      ..toList();
    refresh();
  }

  List<int> get likedIds => pexelsDatasource.likedPhotos;
  bool get hasLikes => likedIds.isNotEmpty;
}
