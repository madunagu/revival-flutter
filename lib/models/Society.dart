import 'package:json_annotation/json_annotation.dart';
import 'Church.dart';
import 'ProfileMedia.dart';

part 'Society.g.dart';

@JsonSerializable()
class Society {
      Society();

  int id;
  String name;
  @JsonKey(name: 'church_id') int churchId;
  @JsonKey(name: 'parent_id') int parentId;
  int closed;
  @JsonKey(name: 'profile_media_id') int profileMediaId;
  @JsonKey(name: 'user_id') int userId;
  @JsonKey(name: 'heirachy_group_id') int heirachyGroupId;
  String description;
  @JsonKey(name: 'deleted_at') DateTime deletedAt;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  Church church;
  @JsonKey(name: 'profile_media') ProfileMedia profileMedia;

  factory Society.fromJson(Map<String,dynamic> json) => _$SocietyFromJson(json);
  Map<String, dynamic> toJson() => _$SocietyToJson(this);
}
