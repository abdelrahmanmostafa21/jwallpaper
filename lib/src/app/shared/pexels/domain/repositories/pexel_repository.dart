import 'package:jwallpaper/src/app/shared/pexels/data/models/photo_model.dart';
import 'package:jwallpaper/src/app/shared/pexels/data/models/photos_response_model.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/common/pexels_transformation.dart';
import 'package:jwallpaper/src/core/network/index.dart';

abstract class PexelsRepository {
  
  Future<PhotosResponseModel?> randomPhotos({
    int page = 1,
    int limit = 20,
    TransformResponse<PhotosResponseModel?> transform = PexelsTransform.defaultPhotosResponseTransform,
  });

  Future<PhotosResponseModel?> searchPhotos({
    required String query,
    int page = 1,
    int limit = 20,
    TransformResponse<PhotosResponseModel?> transform = PexelsTransform.defaultPhotosResponseTransform,
  });

  Future<PhotoModel?> photoById({
    required int id,
    TransformResponse<PhotoModel?> transform = PexelsTransform.defaultPhotoModelTransform,
  });

}
