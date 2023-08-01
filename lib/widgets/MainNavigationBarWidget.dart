import 'package:devotion/MyProfileScreen.dart';
import 'package:devotion/ProfileScreen.dart';
import 'package:devotion/misc/BorderTabIndicator.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class MainNavigationBarWidget extends StatefulWidget {
  final TabController tabController;
  final navItemSize = 48;
  MainNavigationBarWidget({required this.tabController});
  @override
  _MainNavigationBarWidgetState createState() =>
      _MainNavigationBarWidgetState();
}

class _MainNavigationBarWidgetState extends State<MainNavigationBarWidget> {
  late ScrollController _scrollController;
  @override
  void initState() {
    widget.tabController.addListener(() {
      setState(() {
        int i = widget.tabController.index;
        _scrollController.animateTo(
          108.0 * (i - 1),
          duration: Duration(milliseconds: 300),
          curve: Curves.ease,
        );
      });
    });
    _scrollController = ScrollController();
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return CurvedCornerWidget(
      color: Colors.white,
      child: Container(
        height: 156,
        width: size.width,
        padding: EdgeInsets.only(top: 47, left: 10),
        alignment: Alignment.topCenter,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          controller: _scrollController,
          child: Row(
            children: [
              ProfileNavigationItem(
                index: 0,
                tabController: widget.tabController,
                isSelected: widget.tabController.index == 0,
              ),
              SingleNavigationItem(
                title: 'TRENDING',
                icon: Icons.trending_up,
                index: 1,
                tabController: widget.tabController,
                isSelected: widget.tabController.index == 1,
              ),
              SingleNavigationItem(
                title: 'HEALTH',
                icon: Icons.favorite_border,
                index: 2,
                tabController: widget.tabController,
                isSelected: widget.tabController.index == 2,
              ),
              SingleNavigationItem(
                title: 'MUSIC',
                icon: Icons.headset,
                index: 3,
                tabController: widget.tabController,
                isSelected: widget.tabController.index == 3,
              ),
              SingleNavigationItem(
                title: 'READING',
                icon: Icons.chrome_reader_mode,
                index: 4,
                tabController: widget.tabController,
                isSelected: widget.tabController.index == 4,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

List<Color> borderColors = [
  Color(0xff9599b3),
  trendingColors[0],
  healthColors[0],
  musicColors[0],
];

class SingleNavigationItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final double size;
  final int? index;
  final TabController tabController;
  final bool isSelected;

  SingleNavigationItem({
    required this.title,
    required this.icon,
    this.index,
    this.size = 48,
    required this.tabController,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => tabController.animateTo(
        index,
        duration: const Duration(milliseconds: 300),
      ),
      child: Container(
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
                  color:
                      isSelected ? borderColors[index % 4] : Color(0xffE0E0E0),
                  width: isSelected ? 2 : 1,
                ),
                borderRadius: BorderRadius.all(
                  Radius.circular(50),
                ),
              ),
              child: Icon(
                icon,
                size: this.size / 2,
                color: isSelected ? Color(0xff352641) : Color(0xff9AA6AC),
              ),
            ),
            SizedBox(
              height: this.size / 6,
            ),
            Text(
              title,
              style: TextStyle(
                color: isSelected ? Color(0xff374750) : Color(0x89374750),
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileNavigationItem extends StatelessWidget {
  final double size;
  final int? index;
  final TabController tabController;
  final bool isSelected;
  final int notifications;
  final String image;

  ProfileNavigationItem({
    this.index,
    this.size = 48,
    required this.tabController,
    this.isSelected = false,
    this.image = 'images/avatar1.jpg',
    this.notifications = 12,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(
        onTap: () => tabController.animateTo(
          index,
          duration: const Duration(milliseconds: 300),
        ),
        child: Column(
          children: <Widget>[
            Container(
              width: 52,
              height: 66,
              child: Stack(
                children: [
                  Positioned(
                    top: 8,
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: isSelected
                              ? Color(0xff9599b3)
                              : Color(0x009599b3),
                          width: 2,
                        ),
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        child: Image.asset(
                          image,
                          height: 48,
                          width: 48,
                        ),
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
                        notifications.toString(),
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
              style: TextStyle(
                color: isSelected ? Color(0xff374750) : Color(0x89374750),
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
