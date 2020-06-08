import "package:flutter/material.dart";
import 'package:devotion/widgets/MainNavigationBarWidget.dart';

class TrendingWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        alignment: Alignment.topCenter,
        padding: EdgeInsets.only(top: 62),
        child: Column(
          children: [
            ProfileNavigationItem(),
            SizedBox(
              height: 51,
            ),
            SingleNavigationItem(
              title: 'HEALTH',
              icon: Icons.favorite_border,
            ),
            SizedBox(
              height: 51,
            ),
            SingleNavigationItem(
              title: 'HEALTH',
              icon: Icons.favorite_border,
              isSelected: true,
              size: 80,
            ),
            SizedBox(
              height: 51,
            ),
            SingleNavigationItem(
              title: 'HEALTH',
              icon: Icons.favorite_border,
              size: 56,
            ),
            SizedBox(
              height: 51,
            ),
            SingleNavigationItem(
              title: 'MUSIC',
              icon: Icons.headset,
              size: 56,
            ),
            SizedBox(
              height: 51,
            ),
            SingleNavigationItem(
              title: 'READING',
              icon: Icons.chrome_reader_mode,
              size: 56,
            ),
          ],
        ),
      ),
    );
  }
}
