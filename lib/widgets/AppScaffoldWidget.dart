import 'package:devotion/CreateEventScreen.dart';
import 'package:devotion/widgets/AppButtonWidget.dart';
import 'package:devotion/widgets/AppNavigationDrawer.dart';
import 'package:devotion/widgets/FABWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

class AppScaffoldWidget extends StatelessWidget {
  final Widget body;
  final Color bodyColor;
  final Widget? appBar;
  final double paddingTop;
  final IconData? floatingButtonIcon;
  final VoidCallback? floatingButtonTap;
  final Widget? fixedWidget;
  final Widget? error;

  final scaffoldKey;

  AppScaffoldWidget({
    Key? key,
    required this.body,
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
            child: (appBar != null) ? appBar! : Container(),
          ),
          (floatingButtonIcon != null)
              ? FABWidget(
                  icon: floatingButtonIcon!,
                  onTap:floatingButtonTap,
                )
              : Container(),
          (fixedWidget != null) ? fixedWidget! : Container(),
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
