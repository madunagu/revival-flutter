import 'package:flutter/material.dart';

import 'package:devotion/widgets/CurvedCornerWidget.dart';

class DefaultAppBarWidget extends StatelessWidget {
  final Color color;
  final String title;
  final IconData rightIcon;
  final Color borderColor;
  final Color titleColor;

  DefaultAppBarWidget(
      {Key key,
      this.color,
      this.title,
      this.rightIcon,
      this.borderColor = const Color(0x40998fa240),
      this.titleColor = const Color(0xff000000)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedCornerWidget(
      color: color,
      borderColor: this.borderColor,
      child: Container(
        height: 156,
        padding: EdgeInsets.only(left: 30, top: 44, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 44,
                    child: Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 117, 117, 117),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 44,
                  child: Icon(
                    rightIcon,
                    color: Color.fromARGB(255, 117, 117, 117),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                left: 66,
              ),
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  height: 1.15,
                  color: this.titleColor,
                  letterSpacing: -0.42,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
