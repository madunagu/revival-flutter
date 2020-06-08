import 'package:json_annotation/json_annotation.dart';


part 'user.g.dart';

@JsonSerializable()
class User {
      User();

  int id;
  String name;
  @JsonKey(name: 'api_token') dynamic apiToken;
  String email;
  @JsonKey(name: 'email_verified_at') String emailVerifiedAt;
  dynamic phone;
  dynamic gender;
  @JsonKey(name: 'created_at') String createdAt;
  @JsonKey(name: 'updated_at') String updatedAt;

  factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
