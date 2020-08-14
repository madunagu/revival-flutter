import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;

import 'package:devotion/events/AuthenticationEvent.dart';
import 'package:devotion/models/index.dart';
import 'package:meta/meta.dart';
import 'package:devotion/blocs/authentication.bloc.dart';
import 'package:devotion/events/PostEvent.dart';
import 'package:devotion/models/Event.dart';
import 'package:devotion/models/Paginated.dart';
import 'package:devotion/states/PostState.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final AuthenticationBloc authenticationBloc;
  PostBloc({
    @required this.authenticationBloc,
  }) : assert(authenticationBloc != null);
  @override
  PostState get initialState => PostInitial();
//TODO: work on navigation in infinite list
  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is PostFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostInitial) {
          final posts = await _fetchPosts(0, 20);
          yield PostSuccess(posts: posts, hasReachedMax: false);
          return;
        }
        if (currentState is PostSuccess) {
          final posts = await _fetchPosts(currentState.posts.length, 20);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostSuccess(
                  posts: currentState.posts + posts,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        yield PostFailure();
      }
    }
  }

  @override
  Stream<Transition<PostEvent, PostState>> transformEvents(
    Stream<PostEvent> events,
    TransitionFunction<PostEvent, PostState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  bool _hasReachedMax(PostState state) =>
      state is PostSuccess && state.hasReachedMax;

  Future<List<Feed>> _fetchPosts(int startIndex, int limit) async {
    NetworkingClass networker = NetworkingClass();
    final Map<ResponseKey, dynamic> res =
        await networker.get('/feed'); //?_start=$startIndex&_limit=$limit');

    if (res[ResponseKey.type] == ResponseType.data) {
      // final Paginated paginatedData = Paginated.fromJson(res[ResponseKey.data]);
      final List<Feed> feed = [];
      res[ResponseKey.data].forEach((element) {
        feed.add(Feed.fromJson(element));
      });
      // return paginatedData.data;
      return feed;
    } else {
      //TODO: handle error here
      if (res[ResponseKey.type] == ResponseType.unauthorized ||
          res[ResponseKey.type] == ResponseType.unrecognized) {
        this.authenticationBloc.add(AuthenticationLoggedOut());
      }
    }
  }
}
