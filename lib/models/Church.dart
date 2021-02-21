import 'package:json_annotation/json_annotation.dart';
import 'User.dart';
import 'User.dart';
import 'ProfileMedia.dart';

part 'Church.g.dart';

@JsonSerializable()
class Church {
      Church();

  int id;
  String name;
  @JsonKey(name: 'alternate_name') String alternateName;
  @JsonKey(name: 'parent_id') int parentId;
  @JsonKey(name: 'user_id') int userId;
  @JsonKey(name: 'leader_id') int leaderId;
  String slogan;
  String description;
  int verified;
  @JsonKey(name: 'deleted_at') dynamic deletedAt;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  @JsonKey(name: 'comments_count') int commentsCount;
  @JsonKey(name: 'likes_count') int likesCount;
  int liked;
  @JsonKey(name: 'views_count') int viewsCount;
  int viewed;
  List<dynamic> comments;
  User leader;
  User user;
  List<dynamic> addresses;
  @JsonKey(name: 'profile_media') ProfileMedia profileMedia;

  factory Church.fromJson(Map<String,dynamic> json) => _$ChurchFromJson(json);
  Map<String, dynamic> toJson() => _$ChurchToJson(this);
}
