import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:developer';

import 'package:devotion/bloc/blocs/authentication.bloc.dart';
import 'package:devotion/bloc/events/AuthenticationEvent.dart';
import 'package:devotion/bloc/events/PostEvent.dart';
import 'package:devotion/bloc/states/PostState.dart';
import 'package:devotion/models/index.dart';
import 'package:meta/meta.dart';
import 'package:devotion/models/Event.dart';
import 'package:devotion/models/Paginated.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
//  final AuthenticationBloc authenticationBloc;
//  PostBloc({
//    @required this.authenticationBloc,
//  }) ;
//  : assert(authenticationBloc != null);
  @override
  PostState get initialState => PostInitial();
  Pagination pagination;
  @override
  Stream<PostState> mapEventToState(PostEvent event) async* {
    final currentState = state;
    if (event is PostFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is PostInitial) {
          final posts = await _fetchPosts(0, 20);
          yield PostSuccess(posts: posts, pagination: pagination);
          return;
        }
        if (currentState is PostSuccess) {
          final posts = await _fetchPosts(currentState.pagination.currentPage + 1, 20);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : PostSuccess(
                  posts: currentState.posts + posts,
                  pagination: pagination,
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
      state is PostSuccess &&
      state.pagination.currentPage >= state.pagination.totalPages;

  Future<List<Feed>> _fetchPosts(int page, int limit) async {
    NetworkingClass networker = NetworkingClass();
    final Map<String, dynamic> res =
        await networker.get('/feed?page=$page&perPage=$limit');
    ServerResponse serverResponse = ServerResponse.fromJson(res);
    pagination = serverResponse.pagination;
    final List<Feed> feeds = [];
    for (var i = 0; i < serverResponse.data.length; i++) {
      Feed feed = Feed.fromJson(serverResponse.data[i]);
      feed.parentable = getParentable(
          serverResponse.data[i]['parentable'], feed.parentableType);
      if (feed.parentable != null) feeds.add(feed);
    }

    return feeds;
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
