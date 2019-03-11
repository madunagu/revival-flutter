import 'CurvedRectangleClipper.dart';
import 'MainNavigationBar.dart';
import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MainScreen(),
      title: 'Devotion',
      theme: appTheme,
    );
  }
}

var appTheme =
    ThemeData(fontFamily: 'Oxygen', primaryColor: Colors.purpleAccent);

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          MainNavigationBar(),
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
//          CurvedListItem(
//            title: 'Adobe XD Live Event in Europe',
//            time: 'FRIDAY 6:00 PM',
//            position: 3,
//          ),
        ],
      ),
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
      height: 200,
      color: themeColors[position + 1],
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            height: 200,
//            child: ClipPath(
//              clipper: CurvedRectangleClipper(),
            child: Material(
              elevation: 4.0,
              color: themeColors[position],
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.only(
                  left: 32,
                  top: 20,
                  bottom: 20,
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        time,
                        style: TextStyle(color: Colors.white, fontSize: 12),
                      ),
                      SizedBox(
                        height: 2,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          title,
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                            child: Container(
                              height: 24,
                              width: 24,
                              child: Image.asset(
                                'assets/images/avatar1.jpg',
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(width: 20,),
                          Text(
                            'Join Marie, John and 10 others',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      ),
                    ]),
              ),
            ),
//            ),
          ),
          Positioned(
            right: 30,
            top: 70,
            child: Icon(
              icon,
              size: 50,
              color: Color.fromARGB(50, 255, 255, 255),
            ),
          )
        ],
      ),
    );
  }
}
