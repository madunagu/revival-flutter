import 'package:json_annotation/json_annotation.dart';
import 'User.dart';

part 'Heirachy.g.dart';

@JsonSerializable()
class Heirachy {
      Heirachy();

  int id;
  @JsonKey(name: 'heirachy_group_id') int heirachyGroupId;
  int rank;
  @JsonKey(name: 'position_name') String positionName;
  @JsonKey(name: 'position_slang') String positionSlang;
  @JsonKey(name: 'person_name') String personName;
  @JsonKey(name: 'user_id') int userId;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  @JsonKey(name: 'deleted_at') DateTime deletedAt;
  User user;

  factory Heirachy.fromJson(Map<String,dynamic> json) => _$HeirachyFromJson(json);
  Map<String, dynamic> toJson() => _$HeirachyToJson(this);
}
