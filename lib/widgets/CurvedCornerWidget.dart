import 'package:flutter/material.dart';

class CurvedCornerWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;

  CurvedCornerWidget(
      {Key key, this.child, this.color = Colors.white, this.radius = 80})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 1.0,
      color: color,
      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius)),
      child: ClipRRect(
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(radius)),
        child: child,
      ),
    );
  }
}
