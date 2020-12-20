import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color color;
  AppButtonWidget({
    this.text,
    this.onTap,
    this.color = const Color(0xff9599B3),
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 44,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 21),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(52),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}
