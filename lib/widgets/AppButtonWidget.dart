import 'package:flutter/material.dart';

class AppButtonWidget extends StatelessWidget {
  final String text;
  final Function onTap;
  final Color color;
  final double height;
  AppButtonWidget({
    this.text,
    this.onTap,
    this.height = 44,
    this.color = const Color(0xff9599B3),
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: height,
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
            fontWeight: FontWeight.w600,
            letterSpacing: .04,
          ),
        ),
      ),
    );
  }
}
