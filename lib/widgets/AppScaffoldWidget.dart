import 'package:devotion/CreateEventScreen.dart';
import 'package:flutter/material.dart';

class AppScaffoldWidget extends StatelessWidget {
  final Widget body;
  final Color bodyColor;
  final Widget appBar;
  final double paddingTop;
  final Widget floatingButton;
  final bool showFloatingButton;
  final scaffoldKey;

  AppScaffoldWidget({
    Key key,
    this.body,
    this.bodyColor = Colors.white,
    this.appBar,
    this.scaffoldKey,
    this.floatingButton,
    this.showFloatingButton,
    this.paddingTop = 73,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
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
                width: MediaQuery.of(context).size.height,
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
            child: (appBar != null) ? appBar : Container(),
          ),
          Positioned(
            bottom: 56,
            right: 16,
            width: 56,
            height: 56,
            child: this.showFloatingButton == true
                ? InkWell(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateEventScreen(),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Color.fromARGB(25, 0, 0, 0),
                              blurRadius: 4,
                            )
                          ],
                          borderRadius: BorderRadius.circular(30),
                          color: Colors.white,),
                      padding: EdgeInsets.all(10),
                      child: Icon(Icons.add),
                    ),
                  )
                : Container(),
          ),
        ],
      ),
    );
  }
}
