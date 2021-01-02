import 'dart:async';
import 'dart:convert';
import 'dart:developer' as developer;
import 'dart:developer';

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
 {"data":[{"id":40,"parentable_type":"post","postable_type":"user","postable_id":10,"parentable_id":10,"created_at":null,"updated_at":null,"parentable":{"id":10,"name":"Minima sint laborum pariatur itaque non accusantium officia.","body":"Est fugit est nobis. Itaque a nesciunt blanditiis ut expedita. Voluptas praesentium occaecati ipsam eos consequatur.","user_id":3,"deleted_at":null,"created_at":"2021-01-02 02:27:15","updated_at":"2021-01-02 02:27:15"}},{"id":23,"parentable_type":"video","postable_type":"user","postable_id":6,"parentable_id":6,"created_at":null,"updated_at":null,"parentable":{"id":6,"name":"Possimus non occaecati deleniti.","src_url":"\/storage\/video\/videoplayback.mp4","full_text":"Minima est exercitationem voluptate rerum neque suscipit. Aut quis sit temporibus magni illo amet. Quia dolorem esse et vitae voluptate consequuntur. Eius ut aut corporis animi.","description":"Vitae eligendi aut libero impedit.","author_id":1,"uploader_id":1,"church_id":null,"size":132329,"length":154197,"language":"cv","deleted_at":null,"created_at":"2021-01-02 02:27:24","updated_at":"2021-01-02 02:27:24"}},{"id":22,"parentable_type":"audio","postable_type":"user","postable_id":6,"parentable_id":6,"created_at":null,"updated_at":null,"parentable":{"id":6,"name":"Esse minus quaerat nobis.","src_url":"\/storage\/audio\/Hillsong-Touch-Of-Heaven.mp3","full_text":"Aut aspernatur non harum est consequatur illum. Odio dicta et et quaerat esse culpa numquam quibusdam. Quae delectus non error eos non dolorum. Aut ducimus delectus quaerat quia.","description":"Quas maiores dolore et nesciunt nulla.","author_id":1,"uploader_id":1,"size":141804,"length":105192,"language":"is","address_id":null,"deleted_at":null,"created_at":"2021-01-02 02:27:30","updated_at":"2021-01-02 02:27:30"}},{"id":21,"parentable_type":"event","postable_type":"user","postable_id":6,"parentable_id":6,"created_at":null,"updated_at":null,"parentable":{"id":6,"name":"Ut sit voluptatibus harum ut veritatis.","description":null,"starting_at":"2011-10-11 14:00:00","ending_at":"1974-09-14 14:44:56","user_id":8,"deleted_at":null,"created_at":"2021-01-02 02:27:06","updated_at":"2021-01-02 02:27:06"}},{"id":20,"parentable_type":"post","postable_type":"user","postable_id":5,"parentable_id":5,"created_at":null,"updated_at":null,"parentable":{"id":5,"name":"Non voluptatibus in eaque.","body":"Dolor iusto ut molestiae neque dicta quae. Est delectus eveniet qui aliquam esse deserunt et. Iure rerum consectetur nobis.","user_id":10,"deleted_at":null,"created_at":"2021-01-02 02:27:14","updated_at":"2021-01-02 02:27:14"}},{"id":19,"parentable_type":"video","postable_type":"user","postable_id":5,"parentable_id":5,"created_at":null,"updated_at":null,"parentable":{"id":5,"name":"Ipsa eos necessitatibus pariatur dicta.","src_url":"\/storage\/video\/videoplayback.mp4","full_text":"Asperiores distinctio voluptatem quas recusandae. Eum officiis dolores eos est voluptatem consectetur. Occaecati dolor labore laborum quam labore fugit.","description":"Omnis accusamus quia numquam est.","author_id":1,"uploader_id":1,"church_id":null,"size":158122,"length":84203,"language":"tt","deleted_at":null,"created_at":"2021-01-02 02:27:24","updated_at":"2021-01-02 02:27:24"}},{"id":18,"parentable_type":"audio","postable_type":"user","postable_id":5,"parentable_id":5,"created_at":null,"updated_at":null,"parentable":{"id":5,"name":"Officiis sed odio quisquam.","src_url":"\/storage\/audio\/Hillsong-Touch-Of-Heaven.mp3","full_text":"Iure voluptatum maiores omnis. Eius sit asperiores harum dolorum distinctio debitis beatae. Est voluptates aut rerum sequi deserunt quod. Id eum qui exercitationem dolor. Iusto eveniet ipsa nihil quasi.","description":"Vitae ullam animi vero saepe quis.","author_id":1,"uploader_id":1,"size":192016,"length":68099,"language":"si","address_id":null,"deleted_at":null,"created_at":"2021-01-02 02:27:30","updated_at":"2021-01-02 02:27:30"}},{"id":17,"parentable_type":"event","postable_type":"user","postable_id":5,"parentable_id":5,"created_at":null,"updated_at":null,"parentable":{"id":5,"name":"Accusamus ullam aperiam alias est asperiores officiis.","description":null,"starting_at":"1987-02-16 09:55:40","ending_at":"1999-05-08 20:46:26","user_id":9,"deleted_at":null,"created_at":"2021-01-02 02:27:06","updated_at":"2021-01-02 02:27:06"}},{"id":16,"parentable_type":"post","postable_type":"user","postable_id":4,"parentable_id":4,"created_at":null,"updated_at":null,"parentable":{"id":4,"name":"Veritatis et est dolor consequatur omnis voluptatem.","body":"Vero autem vel dolores consequatur rerum itaque eum corporis. Molestias id qui dolor cupiditate. Temporibus similique eius autem qui velit maiores et quod.","user_id":5,"deleted_at":null,"created_at":"2021-01-02 02:27:14","updated_at":"2021-01-02 02:27:14"}},{"id":15,"parentable_type":"video","postable_type":"user","postable_id":4,"parentable_id":4,"created_at":null,"updated_at":null,"parentable":{"id":4,"name":"Impedit omnis accusantium repellat libero assumenda totam.","src_url":"\/storage\/video\/videoplayback.mp4","full_text":"Iste tenetur aut dolores. Ut suscipit tempora ratione sit exercitationem voluptatem id. Consequatur aspernatur est tempora beatae vero ea consequatur. Illo in dicta dolore sunt sapiente veritatis.","description":"Asperiores dolor animi natus ut.","author_id":1,"uploader_id":1,"church_id":null,"size":120294,"length":124054,"language":"is","deleted_at":null,"created_at":"2021-01-02 02:27:24","updated_at":"2021-01-02 02:27:24"}},{"id":14,"parentable_type":"audio","postable_type":"user","postable_id":4,"parentable_id":4,"created_at":null,"updated_at":null,"parentable":{"id":4,"name":"Molestiae est nihil amet dolores.","src_url":"\/storage\/audio\/Hillsong-Touch-Of-Heaven.mp3","full_text":"Sint ducimus animi ut perspiciatis architecto. Vero et ut autem reiciendis aut rerum. Cupiditate itaque velit cupiditate qui optio soluta dolorum.","description":"Quod et aliquam in nobis sed repellendus ex ut.","author_id":1,"uploader_id":1,"size":181872,"length":124618,"language":"ca","address_id":null,"deleted_at":null,"created_at":"2021-01-02 02:27:30","updated_at":"2021-01-02 02:27:30"}},{"id":13,"parentable_type":"event","postable_type":"user","postable_id":4,"parentable_id":4,"created_at":null,"updated_at":null,"parentable":{"id":4,"name":"Totam autem et quo sint.","description":null,"starting_at":"1975-08-07 05:48:29","ending_at":"2005-01-22 20:21:08","user_id":2,"deleted_at":null,"created_at":"2021-01-02 02:27:06","updated_at":"2021-01-02 02:27:06"}},{"id":8,"parentable_type":"post","postable_type":"user","postable_id":2,"parentable_id":2,"created_at":null,"updated_at":null,"parentable":{"id":2,"name":"Explicabo eum dolore enim soluta voluptas perspiciatis earum aut.","body":"Quis recusandae enim magnam laborum quia eaque explicabo. Praesentium in veritatis non est voluptates. Est facere mollitia est vero et.","user_id":10,"deleted_at":null,"created_at":"2021-01-02 02:27:14","updated_at":"2021-01-02 02:27:14"}},{"id":7,"parentable_type":"video","postable_type":"user","postable_id":2,"parentable_id":2,"created_at":null,"updated_at":null,"parentable":{"id":2,"name":"Aperiam ut odit placeat.","src_url":"\/storage\/video\/videoplayback.mp4","full_text":"Temporibus qui molestias voluptatem dolor velit. Voluptatem et et deleniti autem voluptatibus qui. Ad dolorem recusandae in voluptas.","description":"Recusandae explicabo unde unde quis velit reprehenderit amet.","author_id":1,"uploader_id":1,"church_id":null,"size":6162,"length":23340,"language":"ce","deleted_at":null,"created_at":"2021-01-02 02:27:23","updated_at":"2021-01-02 02:27:23"}},{"id":6,"parentable_type":"audio","postable_type":"user","postable_id":2,"parentable_id":2,"created_at":null,"updated_at":null,"parentable":{"id":2,"name":"Nulla et nulla iste optio.","src_url":"\/storage\/audio\/Hillsong-Touch-Of-Heaven.mp3","full_text":"Nulla numquam ducimus eius mollitia. Itaque temporibus iure qui quidem in.","description":"Quod assumenda quaerat repudiandae aut voluptate.","author_id":1,"uploader_id":1,"size":144749,"length":185147,"language":"sw","address_id":null,"deleted_at":null,"created_at":"2021-01-02 02:27:30","updated_at":"2021-01-02 02:27:30"}}],"pagination":{"total":28,"count":15,"per_page":15,"current_page":1,"total_pages":2}}
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
