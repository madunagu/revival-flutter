import 'package:devotion/DevotionalListScreen.dart';
import 'package:devotion/FeedScreen.dart';
import 'package:devotion/VideosScreen.dart';
import 'package:devotion/main.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

class AppNavigationDrawer extends StatefulWidget {
  @override
  _AppNavigationDrawerState createState() => _AppNavigationDrawerState();
}

class _AppNavigationDrawerState extends State<AppNavigationDrawer> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 325,
      height: size.height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(topRight: Radius.circular(80)),
        color: Colors.white,
      ),
      child: Column(
        children: [
          Container(
            height: 250,
            width: double.infinity,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(80),
                bottomLeft: Radius.circular(80),
              ),
              child: Stack(
                children: [
                  Image.asset(
                    'images/photo.png',
                    width: 325,
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                  Container(
                    height: 250,
                    width: 325,
                    color: Color(0x9e241332),
                  ),
                  Container(
                    padding: EdgeInsets.only(top: 60, left: 40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageAvatarWidget(
                          size: 64,
                          borderColor: Colors.transparent,
                          imageURL: 'images/avatar2.jpg',
                        ),
                        SizedBox(height: 15),
                        Text(
                          'Ekene Madunagu',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 7),
                        Text(
                          '@ekenemadunagu',
                          style: TextStyle(
                            color: Color(0x8fffffff),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 40, left: 27),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                DrawerLink(
                  title: 'Home',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MainScreen(),
                      ),
                    );
                  },
                ),
                DrawerLink(
                  title: 'Videos',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => VideosScreen(),
                      ),
                    );
                  },
                ),
                DrawerLink(
                  title: 'Devotionals',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => DevotionalListScreen(),
                      ),
                    );
                  },
                ),
                DrawerLink(title: 'Events', active: true),
                DrawerLink(title: 'About Us'),
                DrawerLink(title: 'Contact Us'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class DrawerLink extends StatelessWidget {
  final String title;
  final bool active;
  final Function onTap;
  DrawerLink({
    this.title,
    this.active = false,
    this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.topLeft,
        child: Container(
          decoration: active
              ? BoxDecoration(
                  color: Color(0xff8A56AC),
                  borderRadius: BorderRadius.circular(30),
                )
              : null,
          margin: EdgeInsets.only(bottom: 8),
          padding: EdgeInsets.only(left: 13, top: 9, bottom: 9, right: 24),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.home,
                  color: active ? Colors.white : Color(0xff817889)),
              SizedBox(width: 20),
              Text(
                title,
                style: TextStyle(
                  fontSize: 18,
                  color: active ? Colors.white : Color(0xff241332),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
