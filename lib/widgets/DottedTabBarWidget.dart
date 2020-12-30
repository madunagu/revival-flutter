import 'package:flutter/material.dart';

class DottedTabBarWidget extends StatelessWidget {
  final int count;
  final int active;
  final Color color;
  final Color activeColor;
  const DottedTabBarWidget({
    Key key,
    this.count = 5,
    this.active = 0,
    this.activeColor = const Color(0xff8A56AC),
    this.color = const Color(0x52998FA2),
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<Widget> dots = [];

    for (var i = 0; i < count; i++) {
      if (i == active) {
        dots.add(
          SingleDot(color: activeColor)
        );
      } else {
        dots.add(
          SingleDot(color: color)
        );
      }
    }

    return Container(
      width: count*16.0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: dots,
      ),
    );
  }
}

class SingleDot extends StatelessWidget {
  final Color color;
  SingleDot({this.color =  const Color(0x52998FA2)});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 8),
      width: 8,
      height: 8,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color:  color,
      ),
    );
  }
}
