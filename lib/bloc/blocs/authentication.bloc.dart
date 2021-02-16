import 'dart:async';
import 'dart:convert';

import 'package:devotion/bloc/events/index.dart';
import 'package:devotion/bloc/states/index.dart';
import 'package:devotion/models/User.dart';
import 'package:devotion/repositories/UserRepository.dart';
import 'package:meta/meta.dart';
import 'package:bloc/bloc.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  final UserRepository userRepository = UserRepository();

  @override
  AuthenticationState get initialState => AuthenticationInitial();

  @override
  Stream<AuthenticationState> mapEventToState(
    AuthenticationEvent event,
  ) async* {
    if (event is AuthenticationStarted) {
      final bool hasToken = await userRepository.hasToken();

      if (hasToken) {
        String token = await userRepository.getToken();
        User user = await userRepository.getUser();
        yield AuthenticationSuccess(user: user, token: token);
      } else {
        yield AuthenticationFailure();
      }
    }

    if (event is AuthenticationLoggedIn) {
      yield AuthenticationInProgress();
      await userRepository.persistToken(event.token);
      await userRepository.saveUser(jsonEncode(event.user.toJson()));
      yield AuthenticationSuccess(user: event.user, token: event.token);
    }

    if (event is AuthenticationLoggedOut) {
      yield AuthenticationInProgress();
      await userRepository.deleteToken();
      yield AuthenticationFailure();
    }
  }
}
