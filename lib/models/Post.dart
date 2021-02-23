import 'package:json_annotation/json_annotation.dart';
import 'Comment.dart';
import 'User.dart';
import 'Church.dart';
import 'ResizedImage.dart';
import 'Address.dart';

part 'Post.g.dart';

@JsonSerializable()
class Post {
      Post();

  int id;
  String name;
  String body;
  @JsonKey(name: 'user_id') int userId;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  @JsonKey(name: 'comments_count') int commentsCount;
  @JsonKey(name: 'likes_count') int likesCount;
  int liked;
  @JsonKey(name: 'views_count') int viewsCount;
  int viewed;
  List<Comment> comments;
  User user;
  List<Church> churches;
  List<ResizedImage> images;
  List<Address> addresses;

  factory Post.fromJson(Map<String,dynamic> json) => _$PostFromJson(json);
  Map<String, dynamic> toJson() => _$PostToJson(this);
}
