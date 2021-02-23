import 'package:json_annotation/json_annotation.dart';
import 'Comment.dart';
import 'User.dart';
import 'User.dart';
import 'Address.dart';
import 'Church.dart';
import 'ResizedImage.dart';

part 'Society.g.dart';

@JsonSerializable()
class Society {
      Society();

  int id;
  String name;
  @JsonKey(name: 'parent_id') int parentId;
  int closed;
  @JsonKey(name: 'user_id') int userId;
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
  List<Comment> comments;
  User leader;
  User user;
  List<Address> addresses;
  List<Church> churches;
  List<ResizedImage> images;

  factory Society.fromJson(Map<String,dynamic> json) => _$SocietyFromJson(json);
  Map<String, dynamic> toJson() => _$SocietyToJson(this);
}
