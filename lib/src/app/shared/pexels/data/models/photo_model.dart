import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.snake)
class PhotoModel {
  PhotoModel();

  factory PhotoModel.fromJson(Map<String, dynamic> json) => _$PhotoModelFromJson(json);

  int? id;
  int? width;
  int? height;

  String? url;

  String? photographer;
  int? photographerId;
  String? photographerUrl;

  Map<String, String>? src;

  String? avgColor;
  bool? liked;
  String? alt;

  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
