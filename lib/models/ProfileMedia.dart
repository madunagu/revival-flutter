import 'package:json_annotation/json_annotation.dart';


part 'ProfileMedia.g.dart';

@JsonSerializable()
class ProfileMedia {
      ProfileMedia();

  int id;
  @JsonKey(name: 'logo_url') String logoUrl;
  @JsonKey(name: 'profile_image_url') String profileImageUrl;
  @JsonKey(name: 'background_image_url') String backgroundImageUrl;
  @JsonKey(name: 'color_choice') String colorChoice;
  @JsonKey(name: 'user_id') int userId;
  @JsonKey(name: 'deleted_at') DateTime deletedAt;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;

  factory ProfileMedia.fromJson(Map<String,dynamic> json) => _$ProfileMediaFromJson(json);
  Map<String, dynamic> toJson() => _$ProfileMediaToJson(this);
}
