import 'package:json_annotation/json_annotation.dart';
import 'Church.dart';
import 'User.dart';

part 'AudioMessage.g.dart';

@JsonSerializable()
class AudioMessage {
      AudioMessage();

  int id;
  String name;
  @JsonKey(name: 'src_url') String srcUrl;
  @JsonKey(name: 'full_text') String fullText;
  String description;
  @JsonKey(name: 'author_id') int authorId;
  @JsonKey(name: 'uploader_id') int uploaderId;
  @JsonKey(name: 'church_id') int churchId;
  int size;
  int length;
  @JsonKey(name: 'profile_media_id') int profileMediaId;
  String language;
  @JsonKey(name: 'address_id') int addressId;
  @JsonKey(name: 'deleted_at') DateTime deletedAt;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  Church church;
  User author;

  factory AudioMessage.fromJson(Map<String,dynamic> json) => _$AudioMessageFromJson(json);
  Map<String, dynamic> toJson() => _$AudioMessageToJson(this);
}
