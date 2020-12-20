
import 'package:devotion/events/PlayerEvent.dart';
import 'package:devotion/states/PlayerState.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:async';

class PlayerBloc extends Bloc<PlayerEvent, PlayerState> {
  // final UserRepository userRepository;
  // final AuthenticationBloc authenticationBloc;

  // LoginBloc({
  //   @required this.userRepository,
  //   @required this.authenticationBloc,
  // })  : assert(userRepository != null),
  //       assert(authenticationBloc != null);

  PlayerState get initialState => PlayerInitial();

  @override
  Stream<PlayerState> mapEventToState(PlayerEvent event) async* {
    // if (event is LoginButtonPressed) {
    //   yield LoginInProgress();

    //   try {
    //     final token = await userRepository.authenticate(
    //       username: event.username,
    //       password: event.password,
    //     );

    //     authenticationBloc.add(AuthenticationLoggedIn(token: token));
    //     yield LoginInitial();
    //   } catch (error) {
    //     log(error.toString());
    //     yield LoginFailure(error: error.toString());
    //   }
    // }
  }
}