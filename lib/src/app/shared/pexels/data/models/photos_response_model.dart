import 'package:json_annotation/json_annotation.dart';
import 'package:jwallpaper/src/app/shared/pexels/data/models/index.dart';

part 'photos_response_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PhotosResponseModel {
  PhotosResponseModel();

  factory PhotosResponseModel.fromJson(Map<String, dynamic> json) =>
      _$PhotosResponseModelFromJson(json);

  int? page;
  int? perPage;
  int? totalResults;
  List<PhotoModel>? photos;
  
  Map<String, dynamic> toJson() => _$PhotosResponseModelToJson(this);
}
