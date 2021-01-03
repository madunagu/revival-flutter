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
        log(_);
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
    await Future.delayed(Duration(seconds: 2));
    //final Map<ResponseKey, dynamic> res = await networker.get('/feed'); //?_start=$startIndex&_limit=$limit');
    final Map<String, dynamic> res = jsonDecode('''
  {
  "data": [
    {
      "id": 36,
      "parentable_type": "post",
      "postable_type": "user",
      "postable_id": 9,
      "parentable_id": 9,
      "created_at": null,
      "updated_at": null,
      "parentable":{
        "id": 100,
        "name": "Quaerat nostrum velit at debitis.",
        "body": "Ducimus consequatur odio quia voluptas amet veritatis. Quae dolores quam ut distinctio quibusdam dolores et. Unde odio delectus aliquid optio eum quo sed.",
        "user_id": 3,
        "deleted_at": null,
        "created_at": "2021-01-02 22:06:13",
        "updated_at": "2021-01-02 22:06:13",
        "likes_count": 0,
        "comments_count": 0,
        "views_count": 0,
        "user": {
          "id": 3,
          "name": "Carleton Nader",
          "api_token": null,
          "avatar": "https://lorempixel.com/50/50/?14300",
          "email": "claire99@example.org",
          "assigned_at": null,
          "email_verified_at": "2021-01-02 22:05:49",
          "deleted_at": null,
          "phone": null,
          "gender": null,
          "verified": 0,
          "created_at": "2021-01-02 22:05:49",
          "updated_at": "2021-01-02 22:05:49"
        }

      }},
    {
      "id": 27,
      "parentable_type": "video",
      "postable_type": "user",
      "postable_id": 7,
      "parentable_id": 7,
      "created_at": null,
      "updated_at": null,
      "parentable":  {
        "id": 1,
        "name": "Quae reprehenderit sit aut at.",
        "src_url": "/storage/video/videoplayback.mp4",
        "full_text": "Nihil amet dolores molestiae ullam hic odit. Maiores qui quisquam adipisci id et. Qui odio perferendis eaque perferendis voluptatem consequatur ea.",
        "description": "Aut dignissimos natus id dolore.",
        "author_id": 1,
        "uploader_id": 1,
        "church_id": null,
        "size": 167802,
        "length": 190714,
        "language": "az",
        "likes_count": 0,
        "comments_count": 0,
        "views_count": 0,
        "deleted_at": null,
        "created_at": "2021-01-02 22:06:15",
        "updated_at": "2021-01-02 22:06:15",
        "churches": [],
        "author": {
          "id": 1,
          "name": "Ekene Madunagu",
          "api_token": null,
          "avatar": "https://lorempixel.com/50/50/?14300",
          "email": "ekenemadunagu@gmail.com",
          "assigned_at": null,
          "email_verified_at": null,
          "deleted_at": null,
          "phone": null,
          "gender": null,
          "verified": 0,
          "created_at": "2021-01-02 22:05:46",
          "updated_at": "2021-01-02 22:05:46"
        },
        "user": {
          "id": 1,
          "name": "Ekene Madunagu",
          "api_token": null,
          "avatar": "https://lorempixel.com/50/50/?14300",
          "email": "ekenemadunagu@gmail.com",
          "assigned_at": null,
          "email_verified_at": null,
          "deleted_at": null,
          "phone": null,
          "gender": null,
          "verified": 0,
          "created_at": "2021-01-02 22:05:46",
          "updated_at": "2021-01-02 22:05:46"
        }
      }
    },
    {
      "id": 26,
      "parentable_type": "audio",
      "postable_type": "user",
      "postable_id": 7,
      "parentable_id": 7,
      "created_at": null,
      "updated_at": null,
      "parentable":  {
        "id": 1,
        "name": "Qui eveniet ullam odio accusamus non qui.",
        "src_url": "/storage/audio/Hillsong-Touch-Of-Heaven.mp3",
        "full_text": "Quia harum qui maiores et officia. Voluptatem tempore magni omnis aut voluptatem aut alias dignissimos. Officiis vero qui expedita accusamus dolor. Nihil laborum ipsum ducimus atque temporibus accusamus repellat. Voluptatem cupiditate maxime autem quo voluptate.",
        "description": "Et ducimus dolorum perferendis est.",
        "author_id": 1,
        "uploader_id": 1,
        "size": 123435,
        "length": 118152,
        "language": "bn",
        "address_id": null,
        "deleted_at": null,
        "likes_count": 0,
        "comments_count": 0,
        "views_count": 0,
        "created_at": "2021-01-02 22:06:21",
        "updated_at": "2021-01-02 22:06:21",
        "author": {
          "id": 1,
          "name": "Ekene Madunagu",
          "api_token": null,
          "avatar": "https://lorempixel.com/50/50/?14300",
          "email": "ekenemadunagu@gmail.com",
          "assigned_at": null,
          "email_verified_at": null,
          "deleted_at": null,
          "phone": null,
          "gender": null,
          "verified": 0,
          "created_at": "2021-01-02 22:05:46",
          "updated_at": "2021-01-02 22:05:46"
        },
        "user": {
          "id": 1,
          "name": "Ekene Madunagu",
          "api_token": null,
          "avatar": "https://lorempixel.com/50/50/?14300",
          "email": "ekenemadunagu@gmail.com",
          "assigned_at": null,
          "email_verified_at": null,
          "deleted_at": null,
          "phone": null,
          "gender": null,
          "verified": 0,
          "created_at": "2021-01-02 22:05:46",
          "updated_at": "2021-01-02 22:05:46"
        }
      }
    },
    {
      "id": 25,
      "parentable_type": "event",
      "postable_type": "user",
      "postable_id": 7,
      "parentable_id": 7,
      "created_at": null,
      "updated_at": null,
      "parentable": {
        "id": 1,
        "name": "Voluptatem laudantium sapiente dolorum ducimus sint.",
        "description": null,
        "starting_at": "2017-07-16 13:35:34",
        "ending_at": "1986-03-10 08:27:05",
        "user_id": 9,
        "deleted_at": null,
        "created_at": "2021-01-02 22:06:00",
        "updated_at": "2021-01-02 22:06:00",
        "attendees_count": 0,
        "attending": 0,
        "user": {
          "id": 9,
          "name": "Enid Schiller",
          "api_token": null,
          "avatar": "https://lorempixel.com/50/50/?94790",
          "email": "schumm.garfield@example.net",
          "assigned_at": null,
          "email_verified_at": "2021-01-02 22:05:49",
          "deleted_at": null,
          "phone": null,
          "gender": null,
          "verified": 0,
          "created_at": "2021-01-02 22:05:50",
          "updated_at": "2021-01-02 22:05:50"
        },
        "attendees": [],
        "profile_media": null
      }
    },
    {
      "id": 36,
      "parentable_type": "post",
      "postable_type": "user",
      "postable_id": 9,
      "parentable_id": 9,
      "created_at": null,
      "updated_at": null,
      "parentable":
      {
        "id": 100,
        "name": "Quaerat nostrum velit at debitis.",
        "body": "Ducimus consequatur odio quia voluptas amet veritatis. Quae dolores quam ut distinctio quibusdam dolores et. Unde odio delectus aliquid optio eum quo sed.",
        "user_id": 3,
        "deleted_at": null,
        "created_at": "2021-01-02 22:06:13",
        "updated_at": "2021-01-02 22:06:13",
        "likes_count": 0,
        "comments_count": 0,
        "views_count": 0,
        "user": {
          "id": 3,
          "name": "Carleton Nader",
          "api_token": null,
          "avatar": "https://lorempixel.com/50/50/?14300",
          "email": "claire99@example.org",
          "assigned_at": null,
          "email_verified_at": "2021-01-02 22:05:49",
          "deleted_at": null,
          "phone": null,
          "gender": null,
          "verified": 0,
          "created_at": "2021-01-02 22:05:49",
          "updated_at": "2021-01-02 22:05:49"
        }

      }},
    {
      "id": 27,
      "parentable_type": "video",
      "postable_type": "user",
      "postable_id": 7,
      "parentable_id": 7,
      "created_at": null,
      "updated_at": null,
      "parentable":  {
        "id": 1,
        "name": "Quae reprehenderit sit aut at.",
        "src_url": "/storage/video/videoplayback.mp4",
        "full_text": "Nihil amet dolores molestiae ullam hic odit. Maiores qui quisquam adipisci id et. Qui odio perferendis eaque perferendis voluptatem consequatur ea.",
        "description": "Aut dignissimos natus id dolore.",
        "author_id": 1,
        "uploader_id": 1,
        "church_id": null,
        "size": 167802,
        "length": 190714,
        "language": "az",
        "deleted_at": null,
        "created_at": "2021-01-02 22:06:15",
        "updated_at": "2021-01-02 22:06:15",
        "churches": [],
        "likes_count": 0,
        "comments_count": 0,
        "views_count": 0,
        "author": {
          "id": 1,
          "name": "Ekene Madunagu",
          "api_token": null,
          "avatar": "https://lorempixel.com/50/50/?14300",
          "email": "ekenemadunagu@gmail.com",
          "assigned_at": null,
          "email_verified_at": null,
          "deleted_at": null,
          "phone": null,
          "gender": null,
          "verified": 0,
          "created_at": "2021-01-02 22:05:46",
          "updated_at": "2021-01-02 22:05:46"
        },
        "user": {
          "id": 1,
          "name": "Ekene Madunagu",
          "api_token": null,
          "avatar": "https://lorempixel.com/50/50/?14300",
          "email": "ekenemadunagu@gmail.com",
          "assigned_at": null,
          "email_verified_at": null,
          "deleted_at": null,
          "phone": null,
          "gender": null,
          "verified": 0,
          "created_at": "2021-01-02 22:05:46",
          "updated_at": "2021-01-02 22:05:46"
        }
      }
    },
    {
      "id": 26,
      "parentable_type": "audio",
      "postable_type": "user",
      "postable_id": 7,
      "parentable_id": 7,
      "created_at": null,
      "updated_at": null,
      "parentable":  {
        "id": 1,
        "name": "Qui eveniet ullam odio accusamus non qui.",
        "src_url": "/storage/audio/Hillsong-Touch-Of-Heaven.mp3",
        "full_text": "Quia harum qui maiores et officia. Voluptatem tempore magni omnis aut voluptatem aut alias dignissimos. Officiis vero qui expedita accusamus dolor. Nihil laborum ipsum ducimus atque temporibus accusamus repellat. Voluptatem cupiditate maxime autem quo voluptate.",
        "description": "Et ducimus dolorum perferendis est.",
        "author_id": 1,
        "uploader_id": 1,
        "size": 123435,
        "length": 118152,
        "language": "bn",
        "address_id": null,
        "deleted_at": null,
        "created_at": "2021-01-02 22:06:21",
        "updated_at": "2021-01-02 22:06:21",
        "likes_count": 0,
        "comments_count": 0,
        "views_count": 0,

        "author": {
          "id": 1,
          "name": "Ekene Madunagu",
          "api_token": null,
          "avatar": "https://lorempixel.com/50/50/?14300",
          "email": "ekenemadunagu@gmail.com",
          "assigned_at": null,
          "email_verified_at": null,
          "deleted_at": null,
          "phone": null,
          "gender": null,
          "verified": 0,
          "created_at": "2021-01-02 22:05:46",
          "updated_at": "2021-01-02 22:05:46"
        },
        "user": {
          "id": 1,
          "name": "Ekene Madunagu",
          "api_token": null,
          "avatar": "https://lorempixel.com/50/50/?14300",
          "email": "ekenemadunagu@gmail.com",
          "assigned_at": null,
          "email_verified_at": null,
          "deleted_at": null,
          "phone": null,
          "gender": null,
          "verified": 0,
          "created_at": "2021-01-02 22:05:46",
          "updated_at": "2021-01-02 22:05:46"
        }
      }
    },
    {
      "id": 25,
      "parentable_type": "event",
      "postable_type": "user",
      "postable_id": 7,
      "parentable_id": 7,
      "created_at": null,
      "updated_at": null,
      "parentable": {
        "id": 1,
        "name": "Voluptatem laudantium sapiente dolorum ducimus sint.",
        "description": null,
        "starting_at": "2017-07-16 13:35:34",
        "ending_at": "1986-03-10 08:27:05",
        "user_id": 9,
        "deleted_at": null,
        "created_at": "2021-01-02 22:06:00",
        "updated_at": "2021-01-02 22:06:00",
        "attendees_count": 0,
        "attending": 0,
        "user": {
          "id": 9,
          "name": "Enid Schiller",
          "api_token": null,
          "avatar": "https://lorempixel.com/50/50/?94790",
          "email": "schumm.garfield@example.net",
          "assigned_at": null,
          "email_verified_at": "2021-01-02 22:05:49",
          "deleted_at": null,
          "phone": null,
          "gender": null,
          "verified": 0,
          "created_at": "2021-01-02 22:05:50",
          "updated_at": "2021-01-02 22:05:50"
        },
        "attendees": [],
        "profile_media": null
      }
    }
  ],
  "pagination": {
    "total": 20,
    "count": 15,
    "per_page": 15,
    "current_page": 1,
    "total_pages": 2
  }
}
    
    ''');

    // final Paginated paginatedData = Paginated.fromJson(res[ResponseKey.data]);
    final List<Feed> feeds = [];
//      List<dynamic> rawFeeds = res[ResponseKey.data]['data'];
    List<dynamic> rawFeeds = res['data'];
    for (var i = 0; i < rawFeeds.length; i++) {
      Map<String, dynamic> singleFeed = rawFeeds[i];
      Feed feed = Feed.fromJson(rawFeeds[i]);
      feed.parentable =
          getParentable(rawFeeds[i]['parentable'], feed.parentableType);
      if (feed.parentable != null) feeds.add(feed);
    }

    // return paginatedData.data;
    return feeds;
    if (res[ResponseKey.type] == ResponseType.data) {
    } else {
      //TODO: handle error here
      if (res[ResponseKey.type] == ResponseType.unauthorized ||
          res[ResponseKey.type] == ResponseType.unrecognized) {
        this.authenticationBloc.add(AuthenticationLoggedOut());
      }
    }
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
