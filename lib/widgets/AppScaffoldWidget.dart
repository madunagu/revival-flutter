import 'package:devotion/CreateEventScreen.dart';
import 'package:devotion/widgets/AppButtonWidget.dart';
import 'package:devotion/widgets/AppNavigationDrawer.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

class AppScaffoldWidget extends StatelessWidget {
  final Widget body;
  final Color bodyColor;
  final Widget appBar;
  final double paddingTop;
  final IconData floatingButtonIcon;
  final Function floatingButtonTap;
  final Widget fixedWidget;
  final Widget error;

  final scaffoldKey;

  AppScaffoldWidget({
    Key key,
    this.body,
    this.bodyColor = Colors.white,
    this.appBar,
    this.scaffoldKey,
    this.floatingButtonIcon,
    this.paddingTop = 73,
    this.floatingButtonTap,
    this.fixedWidget,
    this.error,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: scaffoldKey,
      drawer: AppNavigationDrawer(),
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Positioned(
            top: 0,
            left: 0,
            height: size.height,
            width: size.width,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              physics: ClampingScrollPhysics(),
              child: Container(
                width: size.width,
                color: bodyColor,
                padding: EdgeInsets.only(top: this.paddingTop),
                child: body,
              ),
            ),
          ),
          Positioned(
            top: 0,
            left: 0,
            width: size.width,
            child: (appBar != null) ? appBar : Container(),
          ),
          Positioned(
            bottom: 56,
            right: 16,
            width: 56,
            height: 56,
            child: this.floatingButtonIcon != null
                ? InkWell(
                    onTap: floatingButtonTap,
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Color.fromARGB(25, 0, 0, 0),
                            blurRadius: 4,
                          )
                        ],
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.white,
                      ),
                      padding: EdgeInsets.all(10),
                      child: Icon(floatingButtonIcon),
                    ),
                  )
                : Container(),
          ),
          (fixedWidget != null) ? fixedWidget : Container(),
          Positioned(
            top: 0,
            width: size.width,
            height: size.height,
            child: (error != null)
                ? Container(
                    width: size.width,
                    height: size.height,
                    alignment: Alignment.center,
                    color: Color(0xa4998FA2),
                    child: error,
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
