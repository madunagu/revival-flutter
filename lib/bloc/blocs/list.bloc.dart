import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:developer';

import 'package:devotion/bloc/blocs/authentication.bloc.dart';
import 'package:devotion/bloc/events/AuthenticationEvent.dart';
import 'package:devotion/bloc/events/ListEvent.dart';
import 'package:devotion/bloc/states/ListState.dart';
import 'package:devotion/models/index.dart';
import 'package:meta/meta.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';

class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc({
    @required this.feedType,
    @required this.resource,
  }) : assert(resource != null);
  final String feedType;
  final String resource;
  int currentPage = 0;
  int totalPages = 1;
  @override
  ListState get initialState => ListInitial();
  //TODO: work on navigation in infinite list
  @override
  Stream<ListState> mapEventToState(ListEvent event) async* {
    final currentState = state;
    if (event is ListFetched && !_hasReachedMax(currentState)) {
      try {
        if (currentState is ListInitial) {
          final posts = await _fetchList(0, 20);
          yield ListSuccess(models: posts, hasReachedMax: false);
          return;
        }
        if (currentState is ListSuccess) {
          final posts = await _fetchList(currentState.currentPage, 20);
          yield posts.isEmpty
              ? currentState.copyWith(hasReachedMax: true)
              : ListSuccess(
                  models: currentState.models + posts,
                  hasReachedMax: false,
                );
        }
      } catch (_) {
        log(_.toString());
        yield ListFailure();
      }
    }
  }

  @override
  Stream<Transition<ListEvent, ListState>> transformEvents(
    Stream<ListEvent> events,
    TransitionFunction<ListEvent, ListState> transitionFn,
  ) {
    return super.transformEvents(
      events.debounceTime(const Duration(milliseconds: 500)),
      transitionFn,
    );
  }

  bool _hasReachedMax(ListState state) =>
      state is ListSuccess && state.hasReachedMax;

  Future<List<dynamic>> _fetchList(int startIndex, int limit) async {
    final Map<ResponseKey, dynamic> res = await NetworkingClass()
        .get(resource + "?_start=$startIndex&_limit=$limit");
    final List<dynamic> items = [];
    List<dynamic> rawFeeds = res[ResponseKey.data]['data'];
    currentPage = res[ResponseKey.data]['current_page'];
//    totalPages = res[ResponseKey.data]['pagination']['total_pages'];
    for (var i = 0; i < rawFeeds.length; i++) {
      items.add(getParentable(rawFeeds[i]));
    }

    // return paginatedData.data;
    return items;
  }

  getParentable(Map<String, dynamic> parentable) {
    switch (feedType) {
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
      case 'comment':
        return Comment.fromJson(parentable);
        break;
      case 'devotional':
        return Devotional.fromJson(parentable);
        break;
      default:
        return;
    }
  }
}
