import 'package:json_annotation/json_annotation.dart';
import 'User.dart';
import 'User.dart';
import 'Church.dart';
import 'Address.dart';

part 'AudioPost.g.dart';

@JsonSerializable()
class AudioPost {
      AudioPost();

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
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  @JsonKey(name: 'comments_count') int commentsCount;
  @JsonKey(name: 'likes_count') int likesCount;
  int liked;
  @JsonKey(name: 'views_count') int viewsCount;
  int viewed;
  List<dynamic> comments;
  User author;
  User user;
  List<Church> churches;
  List<Address> addresses;

  factory AudioPost.fromJson(Map<String,dynamic> json) => _$AudioPostFromJson(json);
  Map<String, dynamic> toJson() => _$AudioPostToJson(this);
}
