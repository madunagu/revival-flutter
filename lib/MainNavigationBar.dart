import 'package:devotion/CurvedRectangleClipper.dart';
import 'package:devotion/main.dart';
import 'package:flutter/material.dart';

class MainNavigationBar extends StatelessWidget {
  final List<SingleNavigationItem> items = [
    SingleNavigationItem(
      title: 'Trending',
      icon: Icons.trending_up,
    ),
    SingleNavigationItem(
      title: 'Health',
      icon: Icons.favorite_border,
    ),
    SingleNavigationItem(
      title: 'Music',
      icon: Icons.headset,
    ),
    SingleNavigationItem(
      title: 'Reading',
      icon: Icons.chrome_reader_mode,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 132,
      color: themeColors[0],
//      child: ClipPath(
//        clipper: CurvedRectangleClipper(),
      child: Material(
        elevation: 6,
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
            color: Colors.white,
          ),
          padding: EdgeInsets.only(top: 30, left: 40),
          child: ListView(
            children: items,
            scrollDirection: Axis.horizontal,
            physics: ClampingScrollPhysics(),
          ),
        ),
//        ),
      ),
    );
  }
}

class SingleNavigationItem extends StatelessWidget {
  final IconData icon;
  final String imagePath;
  final String title;
  SingleNavigationItem({
    this.title,
    this.icon,
    this.imagePath,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        children: <Widget>[
          Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              padding: EdgeInsets.all(10),
              child: Icon(
                icon,
                size: 28,
              )),
          SizedBox(
            height: 10,
          ),
          Text(title)
        ],
      ),
    );
  }
}
