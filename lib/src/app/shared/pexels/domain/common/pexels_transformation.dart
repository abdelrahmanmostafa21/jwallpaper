import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:jwallpaper/src/app/shared/pexels/data/models/photo_model.dart';
import 'package:jwallpaper/src/app/shared/pexels/data/models/photos_response_model.dart';
import 'package:jwallpaper/src/core/utils/shared/index.dart';

mixin PexelsTransform {
  /// Parses the [response] of request into a [PhotosResponseModel] object in an isolate.
  static Future<PhotosResponseModel?> defaultPhotosResponseTransform(Response response) async {
    return compute<String, PhotosResponseModel?>(_isolatePhotosResponseTransform, response.data);
  }

  static PhotosResponseModel? _isolatePhotosResponseTransform(String body) {
    final data = _parseApiJson<Map<String, dynamic>>(body);
    if (data == null) {
      return null;
    }
    return PhotosResponseModel.fromJson(data);
  }

  /// Parses the [response] of request  into a [PhotoModel] object in an isolate.
  static Future<PhotoModel?> defaultPhotoModelTransform(Response response) async {
    return compute<String, PhotoModel?>(_isolatePhotoTransform, response.data);
  }

  static PhotoModel? _isolatePhotoTransform(String body) {
    final data = _parseApiJson<Map<String, dynamic>>(body);
    if (data == null) {
      return null;
    }
    return PhotoModel.fromJson(data);
  }

  /// Parses the [response] of request into a List of [PhotoModel] object in an isolate.
  static Future<List<PhotoModel>> defaultPhotosModelTransform(Response response) async {
    return compute<String, List<PhotoModel>>(_isolatePhotosTransform, response.data);
  }

  static List<PhotoModel> _isolatePhotosTransform(String body) {
    final data = _parseApiJson<List<Map<String, dynamic>>>(body);
    if (data == null) {
      return [];
    }
    return List<PhotoModel>.from(data.map(PhotoModel.fromJson));
  }
}

T? _parseApiJson<T>(String body) {
  final jsonBody = json.decode(body);
  return jsonBody;
}
