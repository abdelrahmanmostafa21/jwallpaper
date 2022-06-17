import 'package:jwallpaper/src/app/shared/pexels/data/models/photo_model.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/entities/photo_formats.dart';

abstract class MediaData {
  /// The url based on the media quality settings.
  String? get appropriateUrl;

  /// The url with the best quality available.
  String? get bestUrl;

  /// The width of the media.
  double get width;

  /// The height of the media.
  double get height;

  /// The url with the given photo format available.
  String? variationUrl(PhotoFormats format);
}

class PhotoData extends MediaData {
  PhotoData.fromPhotoModel(PhotoModel model) {
    variations = {};
    for (final format in PhotoFormats.values) {
      variations[format] = model.src?[format.name.toLowerCase()];
      _height = model.height?.toDouble() ?? 0.0;
      _width = model.width?.toDouble() ?? 0.0;
    }
  }

  double _height = 0;
  double _width = 0;
  Map<PhotoFormats, String?> variations = {};

  @override
  String? get appropriateUrl => variations[PhotoFormats.portrait];

  @override
  double get width => _width;
  @override
  double get height => _height;

  @override
  String? get bestUrl => variations[PhotoFormats.large2x];

  @override
  String? variationUrl(PhotoFormats format) => variations[format];
}
