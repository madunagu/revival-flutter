import 'package:flutter/material.dart';

import 'package:devotion/widgets/AppBarWidget.dart';

class SingleScaffoldWidget extends StatelessWidget {
  final Widget body;
  final Color titleColor;
  final Color bodyColor;
  final AppBarWidget title;

  SingleScaffoldWidget(
      {Key? key, required this.body, this.titleColor= Colors.white, this.bodyColor= Colors.white,required this.title})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: Container(
                padding: EdgeInsets.only(top: 156),
                color: bodyColor,
                child: body,
              ),
            ),
          ),
          Positioned(
            left: 0,
            top: 0,
            width: MediaQuery.of(context).size.width,
            child: title,
          ),
        ],
      ),
    );
  }
}
