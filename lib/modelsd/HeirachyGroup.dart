import 'package:json_annotation/json_annotation.dart';
import 'Heirachy.dart';

part 'HeirachyGroup.g.dart';

@JsonSerializable()
class HeirachyGroup {
      HeirachyGroup();

  int id;
  String name;
  String description;
  @JsonKey(name: 'user_id') int userId;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;
  List<Heirachy> heirachies;

  factory HeirachyGroup.fromJson(Map<String,dynamic> json) => _$HeirachyGroupFromJson(json);
  Map<String, dynamic> toJson() => _$HeirachyGroupToJson(this);
}
