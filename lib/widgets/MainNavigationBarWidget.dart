import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:flutter/material.dart';

class MainNavigationBarWidget extends StatelessWidget {
  final List<Widget> items = [
    SingleNavigationItem(
        title: 'TRENDING', icon: Icons.trending_up, isSelected: true),
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
      color: Colors.white,
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
  final double size;
  final bool isSelected;

  SingleNavigationItem({
    this.title,
    this.icon,
    this.imagePath,
    this.size = 48,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        onTap: () {
          // here add routing code
        },
        child: Column(
          children: <Widget>[
            Container(
              width: this.size,
              height: this.size,
              decoration: BoxDecoration(
                border: Border.all(
                    color: (isSelected
                        ? Color.fromARGB(255, 212, 127, 166)
                        : Color.fromARGB(255, 224, 224, 224)),
                    width: isSelected ? 2 : 1),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Icon(
                icon,
                size: this.size / 2,
                color: (isSelected
                    ? Color.fromARGB(255, 53, 38, 65)
                    : Color.fromARGB(255, 154, 166, 172)),
              ),
            ),
            SizedBox(
              height: this.size / 6,
            ),
            Text(
              title,
              style: TextStyle(
                color: isSelected
                    ? Color(0xff374750)
                    : Color.fromARGB(143, 51, 71, 70),
                fontSize: ((this.size - 48) / 8 + 11),
                fontWeight: FontWeight.w700,
                letterSpacing: 0.34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileNavigationItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        onTap: () {
          // here add routing code
        },
        child: Column(
          children: <Widget>[
            Container(
              width: 56,
              height: 66,
              child: Stack(
                children: [
                  Positioned(
                    top: 15,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                      child: Image.asset(
                        'images/avatar1.jpg',
                        height: 48,
                        width: 48,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 0,
                    right: 0,
                    child: Container(
                      height: 24,
                      width: 24,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(40),
                        color: Color(0xff9599b3),
                      ),
                      child: Text(
                        '12',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              'YOU',
              style: TextStyle(
                color: Color.fromARGB(143, 51, 71, 70),
                fontSize: 11,
                fontWeight: FontWeight.w700,
                letterSpacing: 0.34,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
