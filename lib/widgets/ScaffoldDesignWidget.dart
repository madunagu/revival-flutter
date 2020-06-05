import 'package:flutter/material.dart';

class ScaffoldDesignWidget extends StatelessWidget {
  final Widget body;
  final Color bodyColor;
  final Widget customAppBar;
  final double paddingTop;

  ScaffoldDesignWidget(
      {Key key, this.body, this.bodyColor = Colors.white, this.customAppBar, this.paddingTop = 73})
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
                width:MediaQuery.of(context).size.height,
                padding: EdgeInsets.only(top: this.paddingTop),
                //here use navigation - radius as padding
                child: body,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            width: MediaQuery.of(context).size.width,
            child: customAppBar,
          ),
          Positioned(
            bottom: 56,
            right: 16,
            width: 56,
            height: 56,
            child: InkWell(
              child: Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color.fromARGB(25, 0, 0, 0),
                        blurRadius: 4,
                      )
                    ],
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white),
                padding: EdgeInsets.all(10),
                child: Icon(Icons.add),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
