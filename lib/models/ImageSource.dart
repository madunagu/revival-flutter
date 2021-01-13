import 'package:json_annotation/json_annotation.dart';


part 'ImageSource.g.dart';

@JsonSerializable()
class ImageSource {
      ImageSource();

  int id;
  @JsonKey(name: 'large_url') String largeUrl;
  @JsonKey(name: 'medium_url') String mediumUrl;
  @JsonKey(name: 'small_url') String smallUrl;
  @JsonKey(name: 'avatar_url') String avatarUrl;
  @JsonKey(name: 'full_url') String fullUrl;
  @JsonKey(name: 'user_id') String userId;
  @JsonKey(name: 'imageable_id') int imageableId;
  @JsonKey(name: 'imageable_type') String imageableType;
  @JsonKey(name: 'created_at') String createdAt;
  @JsonKey(name: 'updated_at') String updatedAt;

  factory ImageSource.fromJson(Map<String,dynamic> json) => _$ImageSourceFromJson(json);
  Map<String, dynamic> toJson() => _$ImageSourceToJson(this);
}
