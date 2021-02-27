import 'package:json_annotation/json_annotation.dart';


part 'ResizedImage.g.dart';

@JsonSerializable()
class ResizedImage {
      ResizedImage();

  int id;
  String large;
  String medium;
  String small;
  String full;
  @JsonKey(name: 'user_id') int userId;
  @JsonKey(name: 'created_at') String createdAt;
  @JsonKey(name: 'updated_at') String updatedAt;

  factory ResizedImage.fromJson(Map<String,dynamic> json) => _$ResizedImageFromJson(json);
  Map<String, dynamic> toJson() => _$ResizedImageToJson(this);
}
