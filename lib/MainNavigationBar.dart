import 'package:devotion/CurvedCornerWidget.dart';
import 'package:flutter/material.dart';

class MainNavigationBar extends StatelessWidget {
  final List<Widget> items = [
    SingleSelectedNavigationItem(
      title: 'TRENDING',
      icon: Icons.trending_up,
    ),
    SingleNavigationItem(
      title: 'HEALTH',
      icon: Icons.favorite_border,
    ),
    SingleNavigationItem(
      title: 'MUSIC',
      icon: Icons.headset,
    ),
    SingleNavigationItem(
      title: 'READING',
      icon: Icons.chrome_reader_mode,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CurvedCornerWidget(
      child: Container(
        height: 156,
        padding: EdgeInsets.only(top: 57, left: 40),
        child: ListView(
          children: items,
          scrollDirection: Axis.horizontal,
          physics: ClampingScrollPhysics(),
        ),
      ),
    );
  }
}

var defaultDecorationColor = Color.fromARGB(255, 224, 224, 224);
var defaultIconColor = Color.fromARGB(255, 154, 166, 172);
var defaultTextColor = Color.fromARGB(255, 51, 71, 70);
var defaultTextOpacity = .56;

var selectedDecorationColor = Color.fromARGB(255, 212, 127, 166);
var selectedIconColor = Color.fromARGB(255, 53, 38, 65);
var selectedTextColor = Color.fromARGB(255, 51, 71, 80);
var selectedOpacity = 1;

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
      child: InkWell(
        onTap: (){
          // here add routing code
        },
        child: Column(
          children: <Widget>[
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                border: Border.all(
                    color: Color.fromARGB(255, 224, 224, 224), width: 2),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Icon(
                icon,
                size: 21,
                color: Color.fromARGB(255, 154, 166, 172),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Opacity(
              opacity: .56,
              child: Text(
                title,
                style: TextStyle(
                  color: Color.fromARGB(255, 51, 71, 70),
                  fontSize: 11,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SingleSelectedNavigationItem extends StatelessWidget {
  final IconData icon;
  final String imagePath;
  final String title;

  SingleSelectedNavigationItem({
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
            width: 48,
            height: 48,
            decoration: BoxDecoration(
              border: Border.all(
                  color: Color.fromARGB(255, 212, 127, 166), width: 2),
              borderRadius: BorderRadius.all(Radius.circular(30)),
            ),
            //  padding: EdgeInsets.all(18),
            child: Icon(
              icon,
              size: 21,
              color: Color.fromARGB(255, 53, 38, 65),
            ),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            title,
            style: TextStyle(
                color: Color.fromARGB(255, 51, 71, 80),
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.34),
          ),
        ],
      ),
    );
  }
}
