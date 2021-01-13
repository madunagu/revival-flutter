import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 17),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60),
          bottomLeft: Radius.circular(60),
        ),
        child: Image.asset(
          'images/avatar1.jpg',
          width: double.infinity,
          height: 116,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
