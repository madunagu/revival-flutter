import 'package:flutter/material.dart';

import 'package:devotion/CurvedCornerWidget.dart';

class DefaultAppBarWidget extends StatelessWidget {
  final Color color;
  final String title;

  DefaultAppBarWidget({Key key, this.color, this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedCornerWidget(
      color: color,
      child: Container(
        height: 156,
        padding: EdgeInsets.only(left: 30, top: 44),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 44,
              child: Icon(
                Icons.arrow_back,
                color: Color.fromARGB(255, 117, 117, 117),
              ),
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
                    letterSpacing: -0.42),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
