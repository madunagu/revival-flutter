import 'package:json_annotation/json_annotation.dart';
import 'User.dart';

part 'Hierarchy.g.dart';

@JsonSerializable()
class Hierarchy {
      Hierarchy();

  int id;
  @JsonKey(name: 'heirachy_group_id') int heirachyGroupId;
  int rank;
  @JsonKey(name: 'position_name') String positionName;
  @JsonKey(name: 'position_slang') String positionSlang;
  @JsonKey(name: 'person_name') String personName;
  @JsonKey(name: 'user_id') int userId;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  User user;

  factory Hierarchy.fromJson(Map<String,dynamic> json) => _$HierarchyFromJson(json);
  Map<String, dynamic> toJson() => _$HierarchyToJson(this);
}
