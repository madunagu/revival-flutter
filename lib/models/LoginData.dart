import 'package:json_annotation/json_annotation.dart';
import 'User.dart';

part 'LoginData.g.dart';

@JsonSerializable()
class LoginData {
      LoginData();

  User user;
  String token;
  bool success;

  factory LoginData.fromJson(Map<String,dynamic> json) => _$LoginDataFromJson(json);
  Map<String, dynamic> toJson() => _$LoginDataToJson(this);
}
