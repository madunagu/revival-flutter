import 'dart:async';
import 'dart:developer';


import 'package:devotion/bloc/blocs/authentication.bloc.dart';
import 'package:devotion/bloc/events/index.dart';
import 'package:devotion/bloc/states/index.dart';
import 'package:devotion/repositories/UserRepository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final UserRepository userRepository;
  final AuthenticationBloc authenticationBloc;

  LoginBloc({
    @required this.userRepository,
    @required this.authenticationBloc,
  })  : assert(userRepository != null),
        assert(authenticationBloc != null);

  LoginState get initialState => LoginInitial();

  @override
  Stream<LoginState> mapEventToState(LoginEvent event) async* {
    if (event is LoginButtonPressed) {
      yield LoginInProgress();

      try {
        final token = await userRepository.authenticate(
          username: event.username,
          password: event.password,
        );

        authenticationBloc.add(AuthenticationLoggedIn(token: token));
        yield LoginInitial();
      } catch (error) {
        log(error.toString());
        yield LoginFailure(error: error.toString());
      }
    }
  }
}