import 'package:flutter/material.dart';

class BottomSheetWidget extends StatelessWidget {
  final Widget child;
  BottomSheetWidget({this.child});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: child,
    );
  }
}
