import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:developer';
import 'package:devotion/bloc/events/PostEvent.dart';
import 'package:devotion/bloc/states/PostState.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/models/Event.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  @override
  PostState get initialState => PostInitial();
  Pagination pagination;
  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is PostFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostInitial) {
          final ServerResponse serverResponse = await _fetchPosts(0, 20);
          yield PostSuccess(
            posts: serverResponse.data,
            totalPages: serverResponse.totalPages,
            currentPage: serverResponse.currentPage,
          );
          return;
        }
        if (currentState is PostSuccess) {
          final ServerResponse serverResponse =
              await _fetchPosts(currentState.currentPage + 1, 20);
          yield PostSuccess(
            posts: currentState.posts + serverResponse.data,
            totalPages: serverResponse.totalPages,
            currentPage: serverResponse.currentPage,
          );
        }
      } catch (_) {
        log(_.toString());
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
      state is PostSuccess && state.currentPage >= state.totalPages;

  Future<ServerResponse> _fetchPosts(int page, int limit) async {
    NetworkingClass networker = NetworkingClass();
    final Map<String, dynamic> res =
        await networker.get('/feed?page=$page&perPage=$limit');
    ServerResponse serverResponse = ServerResponse.fromJson(res);
    final List<Feed> feeds = [];
    for (var i = 0; i < serverResponse.data.length; i++) {
      Feed feed = Feed.fromJson(serverResponse.data[i]);
      feed.parentable = getParentable(
          serverResponse.data[i]['parentable'], feed.parentableType);
      if (feed.parentable != null) feeds.add(feed);
    }
    serverResponse.data = feeds;
    return serverResponse;
  }

  getParentable(Map<String, dynamic> parentable, String parentableType) {
    switch (parentableType) {
      case 'audio':
        return AudioPost.fromJson(parentable);
        break;
      case 'video':
        return VideoPost.fromJson(parentable);
        break;
      case 'event':
        return Event.fromJson(parentable);
        break;
      case 'post':
        return Post.fromJson(parentable);
        break;
      default:
        return;
    }
  }
}
