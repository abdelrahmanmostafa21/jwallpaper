import 'package:flutter/services.dart';
import 'package:jwallpaper/src/app/presentations/liked/view_model/liked_view_model.dart';
import 'package:jwallpaper/src/app/shared/pexels/data/datasources/index.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/index.dart';
import 'package:jwallpaper/src/core/base/base_provider.dart';

class PhotoViewModel extends BaseProvider {
  PhotoViewModel({
    required this.photo,
    required this.likesViewModel,
    this.pexelsDatasource = const PexelsPrefsDatasourceImpl(),
  });

  final PexelsDatasource pexelsDatasource;
  final LikesViewModel likesViewModel;

  final PhotoEntity photo;

  void onFavorite() {
    likesViewModel.onFavorite(photo);
    refresh();
  }

  void onUnFavorite() {
    likesViewModel.onUnFavorite(photo);
    refresh();
  }

  bool get isLiked => pexelsDatasource.likedPhotos.contains(photo.id);
}
