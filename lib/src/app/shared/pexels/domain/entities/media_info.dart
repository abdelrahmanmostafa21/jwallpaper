
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:jwallpaper/src/app/shared/pexels/data/models/photo_model.dart';
import 'package:jwallpaper/src/core/utils/extensions/index.dart';

class MediaInfo extends Equatable {
  const MediaInfo({
    this.photographerId = -1,
    this.photographerName = '',
    this.photographerUrl = '',
    this.mediaAvgColor = Colors.transparent,
    this.liked = false,
    this.imgAlt = '',
  });

  factory MediaInfo.fromPhotoModel(PhotoModel model) {
    return MediaInfo(
      photographerId: model.photographerId ?? -1,
      photographerName: model.photographer ?? '',
      photographerUrl: model.photographerUrl ?? '',
      mediaAvgColor: model.avgColor?.hexToColor() ?? Colors.transparent,
      liked: model.liked ?? false,
      imgAlt: model.alt ?? '',
    );
  }

  final int photographerId;
  final String photographerName;
  final String photographerUrl;
  final Color mediaAvgColor;
  final bool liked;
  final String imgAlt;

  MediaInfo copyWith({
    int? photographerId,
    String? photographerName,
    String? photographerUrl,
    Color? mediaAvgColor,
    bool? liked,
    String? imgAlt,
  }) {
    return MediaInfo(
      photographerId: photographerId ?? this.photographerId,
      photographerName: photographerName ?? this.photographerName,
      photographerUrl: photographerUrl ?? this.photographerUrl,
      mediaAvgColor: mediaAvgColor ?? this.mediaAvgColor,
      liked: liked ?? this.liked,
      imgAlt: imgAlt ?? this.imgAlt,
    );
  }

  @override
  String toString() {
    return 'MediaInfo(photographerId: $photographerId, photographerName: $photographerName, photographerUrl: $photographerUrl, mediaAvgColor: $mediaAvgColor, liked: $liked, imgAlt: $imgAlt)';
  }

  @override
  List<Object> get props {
    return [
      photographerId,
      photographerName,
      photographerUrl,
      mediaAvgColor,
      liked,
      imgAlt,
    ];
  }
}
