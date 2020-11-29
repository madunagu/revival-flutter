import 'package:devotion/misc/BorderTabIndicator.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:flutter/material.dart';

final List<Widget> navigationItems = [
  ProfileNavigationItem(),
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

class MainNavigationBarWidget extends StatefulWidget {
  final TabController tabController;
  final navItemSize = 48;
  MainNavigationBarWidget({@required this.tabController});
  @override
  _MainNavigationBarWidgetState createState() =>
      _MainNavigationBarWidgetState();
}

class _MainNavigationBarWidgetState extends State<MainNavigationBarWidget> {
  @override
  Widget build(BuildContext context) {
    return CurvedCornerWidget(
      color: Colors.white,
      child: Container(
        height: 156,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 47, left: 40),
        alignment: Alignment.topCenter,
        child: TabBar(
          isScrollable: true,
          labelPadding: EdgeInsets.all(10),
          labelColor: Color(0xff374750),
          labelStyle: TextStyle(
            color: Color.fromARGB(143, 51, 71, 70),
            fontSize: ((widget.navItemSize - 48) / 8 + 11),
            fontWeight: FontWeight.w700,
            fontFamily: 'Montserrat',
            letterSpacing: 0.34,
          ),
          unselectedLabelColor: Color.fromARGB(143, 51, 71, 70),
          indicator: BorderTabIndicator(
              indicatorHeight: 48,
              colors: [Colors.red, Colors.yellow, Colors.green],
              tabController: widget.tabController),
          controller: widget.tabController,
          onTap: (index) {
            widget.tabController.animateTo(
              index,
              duration: const Duration(milliseconds: 300),
            );
          },
          tabs: navigationItems,
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
      child: Column(
        children: <Widget>[
          SizedBox(
            height: 8,
          ),
          Container(
            width: this.size,
            height: this.size,
            decoration: BoxDecoration(
              border: Border.all(
                color: Color.fromARGB(255, 224, 224, 224),
                width: 1,
              ),
              borderRadius: BorderRadius.all(
                Radius.circular(50),
              ),
            ),
            child: Icon(
              icon,
              size: this.size / 2,
              // color: (isSelected
              //     ? Color.fromARGB(255, 53, 38, 65)
              //     : Color.fromARGB(255, 154, 166, 172)),
            ),
          ),
          SizedBox(
            height: this.size / 6,
          ),
          Text(
            title,
            // style: TextStyle(
            //   color: isSelected
            //       ? Color(0xff374750)
            //       : Color.fromARGB(143, 51, 71, 70),
            //   fontSize: ((this.size - 48) / 8 + 11),
            //   fontWeight: FontWeight.w700,
            //   letterSpacing: 0.34,
            // ),
          ),
        ],
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
              width: 48,
              height: 66,
              child: Stack(
                children: [
                  Positioned(
                    top: 8,
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
            Text(
              'YOU',
            ),
          ],
        ),
      ),
    );
  }
}
