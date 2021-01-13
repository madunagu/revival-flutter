import 'package:json_annotation/json_annotation.dart';
import 'User.dart';

part 'Comment.g.dart';

@JsonSerializable()
class Comment {
      Comment();

  int id;
  @JsonKey(name: 'parent_id') int parentId;
  String comment;
  @JsonKey(name: 'user_id') int userId;
  int likes;
  int liked;
  @JsonKey(name: 'commentable_id') int commentableId;
  @JsonKey(name: 'commentable_type') String commentableType;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  User user;

  factory Comment.fromJson(Map<String,dynamic> json) => _$CommentFromJson(json);
  Map<String, dynamic> toJson() => _$CommentToJson(this);
}
