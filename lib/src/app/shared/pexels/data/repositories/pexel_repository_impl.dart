import 'package:jwallpaper/src/app/shared/pexels/data/models/photo_model.dart';
import 'package:jwallpaper/src/app/shared/pexels/data/models/photos_response_model.dart';
import 'package:jwallpaper/src/app/shared/pexels/domain/index.dart';
import 'package:jwallpaper/src/core/di/service_locator.dart';
import 'package:jwallpaper/src/core/network/client/abstract_app_client.dart';

class PexelsRepositoryImpl implements PexelsRepository {
  const PexelsRepositoryImpl();

  AbstractAppClient get client => di<AbstractAppClient>();

  @override
  Future<PhotosResponseModel?> randomPhotos({
    int page = 1,
    int limit = 20,
    TransformResponse<PhotosResponseModel?> transform =
        PexelsTransform.defaultPhotosResponseTransform,
  }) {
    return client.request(
      PexelsEndpoints.photoCurated,
      params: {
        'page': page,
        'perPage': limit,
      },
    ).then(transform);
  }

  @override
  Future<PhotoModel?> photoById({
    required int id,
    TransformResponse<PhotoModel?> transform = PexelsTransform.defaultPhotoModelTransform,
  }) {
    return client
        .request(
          PexelsEndpoints.photo(id),
        )
        .then(transform);
  }

  @override
  Future<PhotosResponseModel?> searchPhotos({
    required String query,
    int page = 1,
    int limit = 20,
    TransformResponse<PhotosResponseModel?> transform =
        PexelsTransform.defaultPhotosResponseTransform,
  }) {
    return client.request(
      PexelsEndpoints.photoSearch,
      params: {
        'page': page,
        'perPage': limit,
        'query': query.toLowerCase(),
      },
    ).then(transform);
  }
}
