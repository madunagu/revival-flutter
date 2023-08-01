import 'package:devotion/models/address.dart';
import 'package:flutter/material.dart';

class MapWidget extends StatelessWidget {
  final String address;
  MapWidget({required this.address});
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
          'images/map.png',
          width: double.infinity,
          height: 116,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
