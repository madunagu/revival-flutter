import 'package:flutter/foundation.dart';
import 'package:quiver/core.dart';
import 'index.dart';



@immutable
class LoginData {

  const LoginData({
    required this.user,
    required this.token,
    required this.success,
  });

  final User user;
  final String token;
  final bool success;

  factory LoginData.fromJson(Map<String,dynamic> json) => LoginData(
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    token: json['token'].toString(),
    success: json['success'] as bool
  );
  
  Map<String, dynamic> toJson() => {
    'user': user.toJson(),
    'token': token,
    'success': success
  };

  LoginData clone() => LoginData(
    user: user.clone(),
    token: token,
    success: success
  );


  LoginData copyWith({
    User? user,
    String? token,
    bool? success
  }) => LoginData(
    user: user ?? this.user,
    token: token ?? this.token,
    success: success ?? this.success,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is LoginData && user == other.user && token == other.token && success == other.success;

  @override
  int get hashCode => user.hashCode ^ token.hashCode ^ success.hashCode;
}
