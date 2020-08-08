import 'package:devotion/CreateEventScreen.dart';
import 'package:devotion/MyProfileScreen.dart';
import 'package:devotion/PlayerScreen.dart';
import 'package:devotion/blocs/authentication.bloc.dart';
import 'package:devotion/blocs/post.bloc.dart';
import 'package:devotion/events/AuthenticationEvent.dart';
import 'package:devotion/events/PostEvent.dart';
import 'package:devotion/repositories/UserRepository.dart';
import 'package:devotion/states/AuthenticationState.dart';
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
import 'package:devotion/FeedsScreen.dart';
import 'package:devotion/SingleEventScreen.dart';
import 'package:devotion/widgets/ScaffoldDesignWidget.dart';
import 'package:devotion/widgets/StackedCurvedList.dart';
import 'package:devotion/widgets/TrendingWidget.dart';
import 'package:devotion/misc/StyleConstants.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'package:animations/animations.dart';

void main() {
  BlocSupervisor.delegate = SimpleBlocDelegate();
  final userRepository = UserRepository();
  runApp(
    BlocProvider<AuthenticationBloc>(
      create: (context) {
        return AuthenticationBloc(userRepository: userRepository)
          ..add(AuthenticationStarted());
      },
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
          }
          if (state is AuthenticationFailure) {
            return LoginScreen(userRepository: userRepository);
          }
          if (state is AuthenticationInProgress) {
            return LoadingIndicator();
          }
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
  @override
  void initState() {
    this._tabController =
        TabController(vsync: this, length: navigationItems.length);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldDesignWidget(
      bodyColor: trendingColors[0],
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: TabBarView(controller: _tabController, children: [
          SingleChildScrollView(child: MyProfileScreen()),
          BlocProvider(
              create: (BuildContext context) => PostBloc(
                    authenticationBloc:
                        BlocProvider.of<AuthenticationBloc>(context),
                  )..add(PostFetched()),
              child: StackedCurvedList(colors: trendingColors)),
          BlocProvider(
              create: (BuildContext context) => PostBloc(
                    authenticationBloc:
                        BlocProvider.of<AuthenticationBloc>(context),
                  )..add(PostFetched()),
              child: StackedCurvedList(colors: trendingColors)),
          StackedCurvedList(colors: trendingColors),
          StackedCurvedList(colors: trendingColors),
        ]),
      ),
      customAppBar: MainNavigationBarWidget(
        tabController: _tabController,
      ),
    );
  }
}
