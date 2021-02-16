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
  Pagination pagination;
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
          yield ListSuccess(models: posts, pagination: pagination);
          return;
        }
        if (currentState is ListSuccess) {
          final posts = await _fetchList(pagination.currentPage + 1, 20);
          yield ListSuccess(
            models: currentState.models + posts,
            pagination: pagination,
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
      state is ListSuccess &&
      state.pagination.currentPage >= state.pagination.totalPages;

  Future<List<dynamic>> _fetchList(int page, int limit) async {
    final Map<String, dynamic> res =
        await NetworkingClass().get(resource + "?page=$page&perPage=$limit");
    ServerResponse response = ServerResponse.fromJson(res);
    pagination = response.pagination;
    final List<dynamic> items = [];
    for (var i = 0; i < response.data.length; i++) {
      items.add(getParentable(response.data[i]));
    }

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
