import 'package:meta/meta.dart';
import 'package:equatable/equatable.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class LoginButtonPressed extends LoginEvent {
  final String username;
  final String password;

  const LoginButtonPressed({
    @required this.username,
    @required this.password,
  });

  @override
  List<Object> get props => [username, password];

  @override
  String toString() =>
      'LoginButtonPressed { username: $username, password: $password }';
}

class RegisterButtonPressed extends LoginEvent {
  final String name;
  final String email;
  final String phone;

  const RegisterButtonPressed({
    @required this.name,
    @required this.email,
    @required this.phone,
  });

  @override
  List<Object> get props => [name,  email, phone];

  @override
  String toString() =>
      'LoginButtonPressed { name: $name, email: $email, phone: $phone }';
}
