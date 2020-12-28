import 'package:json_annotation/json_annotation.dart';
import 'Comment.dart';
import 'User.dart';
import 'User.dart';
import 'Church.dart';
import 'Address.dart';

part 'VideoPost.g.dart';

@JsonSerializable()
class VideoPost {
      VideoPost();

  int id;
  String name;
  @JsonKey(name: 'src_url') String srcUrl;
  @JsonKey(name: 'full_text') String fullText;
  String description;
  @JsonKey(name: 'author_id') int authorId;
  @JsonKey(name: 'uploader_id') int uploaderId;
  int size;
  int length;
  String language;
  @JsonKey(name: 'deleted_at') DateTime deletedAt;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  @JsonKey(name: 'comments_count') int commentsCount;
  @JsonKey(name: 'likes_count') int likesCount;
  int liked;
  @JsonKey(name: 'views_count') int viewsCount;
  int viewed;
  List<Comment> comments;
  User author;
  User user;
  List<Church> churches;
  List<Address> addresses;

  factory VideoPost.fromJson(Map<String,dynamic> json) => _$VideoPostFromJson(json);
  Map<String, dynamic> toJson() => _$VideoPostToJson(this);
}
