import 'package:equatable/equatable.dart';
import 'package:jwallpaper/src/app/shared/pexels/data/models/photo_model.dart';

import 'package:jwallpaper/src/app/shared/pexels/domain/entities/media_data.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/entities/media_info.dart';

class PhotoEntity extends Equatable {
  const PhotoEntity({
    required this.photoData,
    this.id = -1,
    this.photoInfo = const MediaInfo(),
  });

  factory PhotoEntity.fromPhotoModel(PhotoModel model) {
    return PhotoEntity(
      id: model.id ?? -1,
      photoData: PhotoData.fromPhotoModel(model),
      photoInfo: MediaInfo.fromPhotoModel(model),
    );
  }

  final int id;
  final MediaData photoData;
  final MediaInfo photoInfo;

  PhotoEntity copyWith({
    int? id,
    MediaData? photoData,
    MediaInfo? photoInfo,
  }) {
    return PhotoEntity(
      id: id ?? this.id,
      photoData: photoData ?? this.photoData,
      photoInfo: photoInfo ?? this.photoInfo,
    );
  }

  @override
  String toString() => 'PhotoEntity(id: $id, photoData: $photoData, photoInfo: $photoInfo)';

  @override
  List<Object> get props => [id, photoData, photoInfo];
}
