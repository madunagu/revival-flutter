import 'dart:developer';

import 'package:devotion/bloc/events/PlayerEvent.dart';
import 'package:devotion/bloc/states/PlayerState.dart';
import 'package:devotion/models/AudioMessage.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:equatable/equatable.dart';
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
    if (event is PlayerTouched) {
      yield PlayerAttentive();
    }

    if (event is PlayerLiked) {
      yield* _mapPlayerLikedToState(event);
    }
    if (event is PlayerFetched) {
      yield* _mapPlayerFetchedToState(event);
    }
    // event = event as PlayerFetched;
  }

  Stream<PlayerState> _mapPlayerFetchedToState(PlayerFetched event) async* {
    yield PlayerLoading();
    try {
      var playable;
      NetworkingClass server = NetworkingClass();
      String url = event.playedType == PlayedType.video
          ? '/video-posts/'
          : '/audio-posts/';
      Map<ResponseKey, dynamic> play =
          await server.get(url + event.id.toString());
      if (play[ResponseKey.type] == ResponseType.data) {
        var res = play[ResponseKey.data]['data'];
        playable = event.playedType == PlayedType.video
            ? VideoPost.fromJson(res)
            : AudioPost.fromJson(res);
      }
      yield PlayerLoaded(playable: playable);
    } catch (error) {
      log(error.toString());
      yield PlayerFailure(error: error.toString());
    }
  }

  Stream<PlayerState> _mapPlayerLikedToState(PlayerLiked event) async* {
    try {
      yield PlayerLiking();
      NetworkingClass server = NetworkingClass();
      String url = event.playedType == PlayedType.video
          ? '/video-posts/'
          : '/audio-posts/';
      Map<ResponseKey, dynamic> liked =
          await server.post(url + event.id.toString(), []);
      if (liked[ResponseKey.type] == ResponseType.data) {
        var res = liked[ResponseKey.data]['data'];
        if (res == 'true') {
          yield PlayerLiking();
        } else {
          yield PlayerUnLiking();
        }
      }
      yield PlayerUnLiking();
    } catch (error) {
      log(error.toString());
      yield PlayerFailure(error: error.toString());
    }
  }

}
