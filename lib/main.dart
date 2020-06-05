import 'package:devotion/CreateEventScreen.dart';
import 'package:devotion/MyProfileScreen.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/LoginScreen.dart';
import 'package:devotion/widgets/ImageAvatarListWidget.dart';
import 'package:devotion/widgets/MainNavigationBarWidget.dart';
import 'package:devotion/NotificationScreen.dart';
import 'package:devotion/OnBoardingScreen.dart';
import 'package:devotion/ProfileScreen.dart';
import 'package:devotion/FeedsScreen.dart';
import 'package:devotion/SingleEventScreen.dart';
import 'package:devotion/widgets/ScaffoldDesignWidget.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CreateEventScreen(),
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

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    print('width: ');
    print(MediaQuery.of(context).size.width);
    return ScaffoldDesignWidget(
      bodyColor: trendingColors[0],
      body: this.organiseStack(
        [
          CurvedListItem(
            title: 'Practice French, English And Chinese',
            time: 'TUESDAY 5:30 PM',
            position: 0,
            icon: Icons.public,
          ),
          CurvedListItem(
            title: 'Yoga and Meditation for Beginners',
            time: 'TODAY 5:30 PM',
            icon: Icons.flight_land,
            position: 1,
          ),
          CurvedListItem(
            title: 'Practice French, English And Chinese',
            time: 'TUESDAY 5:30 PM',
            icon: Icons.hotel,
            position: 2,
          ),
          CurvedListItem(
            title: 'Yoga and Meditation for Beginners',
            time: 'TODAY 5:30 PM',
            icon: Icons.flight_land,
            position: 1,
          ),
        ],
      ),
      customAppBar: MainNavigationBarWidget(),
    );
  }

  Widget organiseStack(List<CurvedListItem> items) {
    List<Widget> output = [];
    for (var i = 0; i < items.length; i++) {
      output.insert(
        0,
        Positioned(
          top: 190.0 * i,
          child: CurvedCornerWidget(
            padding: EdgeInsets.only( top: 70),
            color: trendingColors[i % 4],
            child: items[i],
          ),
        ),
      );
    }

    return Container(
      height: 190.0 * items.length + 200,
      child: Stack(
        children: output,
      ),
    );
  }
}

class CurvedListItem extends StatelessWidget {
  final String title;
  final String time;
  final String people;
  final IconData icon;
  final int position;

  CurvedListItem(
      {this.title, this.time, this.icon, this.people, this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 32, top: 32),
      child: Stack(
        children: [
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  time,
                  style: TextStyle(
                    color: Color(0x70ffffff),
                    fontSize: 11,
                    letterSpacing: -0.22,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    letterSpacing: -0.39,
                    height: 1.25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    ImageAvatarListWidget(
                      images: [
                        'images/avatar1.jpg',
                        'images/avatar1.jpg',
                      ],
                      size: 24,
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      'Join Marie, John and 10 others',
                      style: TextStyle(
                        color: Color(0x70ffffff),
                        letterSpacing: -0.24,
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 40,),
              ]),
          Positioned(
            right: 40,
            bottom: 50,
            child: Icon(
              icon,
              size: 70,
              color: Color.fromARGB(50, 255, 255, 255),
            ),
          ),
        ],
      ),
    );
  }
}
