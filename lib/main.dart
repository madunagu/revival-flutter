import 'dart:convert';

import 'package:devotion/ActivitiesScreen.dart';
import 'package:devotion/ChatScreen.dart';
import 'package:devotion/CreateEventScreen.dart';
import 'package:devotion/FeedScreen.dart';
import 'package:devotion/FlightsScreen.dart';
import 'package:devotion/MessagesScreen.dart';
import 'package:devotion/MyProfileScreen.dart';
import 'package:devotion/MusicPlayerScreen.dart';
import 'package:devotion/PlayerScreen.dart';
import 'package:devotion/bloc/blocs/authentication.bloc.dart';
import 'package:devotion/bloc/blocs/player.bloc.dart';
import 'package:devotion/bloc/blocs/post.bloc.dart';
import 'package:devotion/bloc/events/PostEvent.dart';
import 'package:devotion/bloc/events/index.dart';
import 'package:devotion/bloc/states/AuthenticationState.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/repositories/UserRepository.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/LoginScreen.dart';
import 'package:devotion/widgets/CurvedListItem.dart';
import 'package:devotion/widgets/ImageAvatarListWidget.dart';
import 'package:devotion/widgets/LoadingIndicator.dart';
import 'package:devotion/widgets/MainNavigationBarWidget.dart';
import 'package:devotion/NotificationScreen.dart';
import 'package:devotion/SplashScreen.dart';
import 'package:devotion/OnBoardingScreen.dart';
import 'package:devotion/ProfileScreen.dart';
import 'package:devotion/VideosScreen.dart';
import 'package:devotion/SingleEventScreen.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/TrendingWidget.dart';
import 'package:devotion/misc/StyleConstants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:animations/animations.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<AuthenticationBloc>(
          create: (context) =>
              AuthenticationBloc(userRepository: userRepository)
                ..add(AuthenticationStarted()),
        ),
        BlocProvider<PlayerBloc>(create: (context) => PlayerBloc())
      ],
      child: MyApp(userRepository: userRepository),
    ),
  );
}

class MyApp extends StatelessWidget {
  final UserRepository userRepository;

  MyApp({Key key, @required this.userRepository}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthenticationBloc, AuthenticationState>(
        builder: (context, state) {
          if (state is AuthenticationInitial) {
            return SplashScreen();
          }
          if (state is AuthenticationSuccess) {
             return MainScreen();
            VideoPost video = VideoPost.fromJson(jsonDecode('''{
              "id": 3,
              "name": "At ut laudantium dolores quis molestiae tenetur aliquid.",
              "src_url": "/storage/video/videoplayback.mp4",
              "full_text": "Alias voluptas quam et explicabo et. Numquam tempora fuga nostrum id quia. Eaque velit a aut expedita omnis aliquid placeat nisi.",
              "description": "Aliquid perferendis ex sint fuga sit.",
              "author_id": 1,
              "uploader_id": 1,
              "created_at": "2020-12-28 05:25:16",
              "size": 97158,
              "length": 167198,
              "language": "hr",
              "comments_count": 0,
              "likes_count": 0,
              "liked": 0,
              "views_count": 0,
              "user":{
                "id": 1,
                "name": "Dr. Maria Rolfson MD",
                "api_token": null,
                "email": "gwolff@example.com",
                "phone": "+2348065708630",
                "gender": "String"
              },
              "viewed": 0}
            '''));

//            return PlayerScreen(playable: video);
          }
          if (state is AuthenticationFailure) {
            return LoginScreen(userRepository: userRepository);
          }
          if (state is AuthenticationInProgress) {
            return LoadingIndicator();
          }
          return Container();
        },
      ),
      title: 'Devotion',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

var appTheme = ThemeData(
  fontFamily: 'Montserrat',
  primaryColor: Color(0xff8a56ac),
  accentColor: Color(0xffd47fa6),
);

class SimpleBlocDelegate extends BlocDelegate {
  @override
  void onEvent(Bloc bloc, Object event) {
    print(event);
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    print(transition);
    super.onTransition(bloc, transition);
  }

  @override
  void onError(Bloc bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  AuthenticationBloc _authenticationBloc;
  @override
  void initState() {
    this._tabController =
        TabController(vsync: this, length: navigationItems.length);
    this._authenticationBloc = BlocProvider.of<AuthenticationBloc>(context);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
//    AuthenticationBloc authenticationBloc =
//        BlocProvider.of<AuthenticationBloc>(context);
    return AppScaffoldWidget(
      bodyColor: Color(0xffF1F0F2),
      paddingTop: 0,
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: TabBarView(controller: _tabController, children: [
          SingleChildScrollView(child: MyProfileScreen()),
          BlocProvider(
            create: (BuildContext context) => PostBloc(
              authenticationBloc: _authenticationBloc,
            )..add(PostFetched()),
            child: FeedScreen(colors: trendingColors),
          ),
          BlocProvider(
            create: (BuildContext context) => PostBloc(
              authenticationBloc: _authenticationBloc,
            )..add(PostFetched()),
            child: FeedScreen(colors: healthColors),
          ),
          FeedScreen(colors: trendingColors),
          FeedScreen(colors: trendingColors),
        ]),
      ),
      showFloatingButton: true,
      floatingButtonTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => CreateEventScreen(),
          ),
        );
      },
      appBar: MainNavigationBarWidget(
        tabController: _tabController,
      ),
    );
  }
}
