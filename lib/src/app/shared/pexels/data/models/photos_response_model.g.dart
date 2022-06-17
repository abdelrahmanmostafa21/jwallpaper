// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photos_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PhotosResponseModel _$PhotosResponseModelFromJson(Map<String, dynamic> json) =>
    PhotosResponseModel()
      ..page = json['page'] as int?
      ..perPage = json['per_page'] as int?
      ..totalResults = json['total_results'] as int?
      ..photos = (json['photos'] as List<dynamic>?)
          ?.map((e) => PhotoModel.fromJson(e as Map<String, dynamic>))
          .toList();

Map<String, dynamic> _$PhotosResponseModelToJson(
        PhotosResponseModel instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.perPage,
      'total_results': instance.totalResults,
      'photos': instance.photos?.map((e) => e.toJson()).toList(),
    };
