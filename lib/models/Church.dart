import 'package:json_annotation/json_annotation.dart';
import 'Address.dart';
import 'ProfileMedia.dart';

part 'Church.g.dart';

@JsonSerializable()
class Church {
      Church();

  int id;
  String name;
  @JsonKey(name: 'alternate_name') String alternateName;
  @JsonKey(name: 'parent_id') String parentId;
  @JsonKey(name: 'user_id') int userId;
  @JsonKey(name: 'leader_id') int leaderId;
  @JsonKey(name: 'heirachy_group_id') int heirachyGroupId;
  @JsonKey(name: 'address_id') int addressId;
  @JsonKey(name: 'profile_media_id') int profileMediaId;
  String slogan;
  String description;
  int verified;
  @JsonKey(name: 'deleted_at') DateTime deletedAt;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  Address address;
  @JsonKey(name: 'profile_media') ProfileMedia profileMedia;

  factory Church.fromJson(Map<String,dynamic> json) => _$ChurchFromJson(json);
  Map<String, dynamic> toJson() => _$ChurchToJson(this);
}
