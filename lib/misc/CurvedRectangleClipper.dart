import 'package:flutter/material.dart';

class CurvedRectangleClipper extends CustomClipper<Path> {
  final double offset = 100;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - offset);
    var firstEndpoint = Offset(offset, size.height);
    path.arcToPoint(firstEndpoint,
        radius: Radius.circular(-offset), clockwise: false);

    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
//    path.lineTo(offset, offset);
//
//    var secondEndPoint = Offset(0,0);
//
//    path.arcToPoint(secondEndPoint, radius: Radius.circular(-offset),clockwise: true);
//
    path.lineTo(0, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper oldClipper) {
    return true;
  }
}
