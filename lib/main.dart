import 'package:devotion/CurvedCornerWidget.dart';
import 'package:devotion/LoginScreen.dart';
import 'package:devotion/MainNavigationBar.dart';
import 'package:devotion/NotificationScreen.dart';
import 'package:devotion/OnBoardingScreen.dart';
import 'package:devotion/ProfileScreen.dart';
import 'package:devotion/ScaffoldDesignWidget.dart';
import 'package:devotion/SingleEventScreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SingleEventScreen(),
      title: 'Devotion',
      theme: appTheme,
      debugShowCheckedModeBanner: false,
    );
  }
}

var appTheme =
    ThemeData(fontFamily: 'Montserrat', primaryColor: Colors.purpleAccent);

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print('width: ');
    print(MediaQuery.of(context).size.width);
    return ScaffoldDesignWidget(
      bodyColor: themeColors[0],
      body: Column(
        children: <Widget>[
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
        ],
      ),
      customAppBar: MainNavigationBar(),
    );
  }
}

List<Color> themeColors = [
  Color.fromARGB(255, 217, 111, 159),
  Color.fromARGB(255, 133, 65, 176),
  Color.fromARGB(255, 21, 4, 40),
  Color.fromARGB(255, 142, 147, 179),
];

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
      color: themeColors[position + 1],
      child: Stack(
        children: <Widget>[
          CurvedCornerWidget(
            color: themeColors[position],
            child: Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.only(left: 32, top: 32, bottom: 40),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Opacity(
                      child: Text(
                        time,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 11,
                            letterSpacing: -0.22,
                            fontWeight: FontWeight.w600),
                      ),
                      opacity: .48,
                    ),
                    Container(
                      width: 309,
                      child: Text(
                        title,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            letterSpacing: -0.39,
                            height: 1.25,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      children: <Widget>[
                        ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(50)),
                          child: Container(
                            height: 24,
                            width: 24,
                            child: Image.asset(
                              'images/avatar1.jpg',
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Opacity(
                          opacity: .48,
                          child: Text(
                            'Join Marie, John and 10 others',
                            style: TextStyle(
                              color: Colors.white,
                              letterSpacing: -0.24,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ]),
            ),
          ),
          Positioned(
            right: 40,
            top: 90,
            child: Icon(
              icon,
              size: 70,
              color: Color.fromARGB(50, 255, 255, 255),
            ),
          )
        ],
      ),
    );
  }
}
