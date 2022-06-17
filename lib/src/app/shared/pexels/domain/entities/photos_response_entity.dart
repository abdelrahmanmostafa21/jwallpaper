
import 'package:equatable/equatable.dart';
import 'package:jwallpaper/src/app/shared/pexels/data/models/photos_response_model.dart';

import 'package:jwallpaper/src/app/shared/pexels/domain/index.dart';

class PaginatedResponseEnitty extends Equatable {
  const PaginatedResponseEnitty({
    this.page = 1,
    this.limit = 20,
    this.photos = const [],
    this.totalResults = 0,
  });

  factory PaginatedResponseEnitty.fromResponseModel(PhotosResponseModel model) {
    return PaginatedResponseEnitty(
      page: model.page ?? 1,
      limit: model.perPage ?? 20,
      photos: List<PhotoEntity>.from(model.photos?.map(PhotoEntity.fromPhotoModel) ?? []),
      totalResults: model.totalResults ?? 0,
    );
  }
  final int page;
  final int limit;
  final List<PhotoEntity> photos;
  final int totalResults;

  PaginatedResponseEnitty copyWith({
    int? page,
    int? limit,
    List<PhotoEntity>? photos,
    int? totalResults,
  }) {
    return PaginatedResponseEnitty(
      page: page ?? this.page,
      limit: limit ?? this.limit,
      photos: photos ?? this.photos,
      totalResults: totalResults ?? this.totalResults,
    );
  }

  @override
  String toString() {
    return 'PaginatedResponseEnitty(page: $page, limit: $limit, photos: $photos, totalResults: $totalResults)';
  }

  @override
  List<Object> get props => [page, limit, photos, totalResults];
}
