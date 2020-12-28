import 'package:json_annotation/json_annotation.dart';


part 'User.g.dart';

@JsonSerializable()
class User {
      User();

  int id;
  String name;
  @JsonKey(name: 'api_token') dynamic apiToken;
  String email;
  @JsonKey(name: 'email_verified_at') DateTime emailVerifiedAt;
  @JsonKey(name: 'assigned_at') DateTime assignedAt;
  String phone;
  String gender;
  @JsonKey(name: 'created_at') DateTime createdAt;
  @JsonKey(name: 'updated_at') DateTime updatedAt;

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
