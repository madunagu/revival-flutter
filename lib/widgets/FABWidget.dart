import 'package:flutter/material.dart';

class FABWidget extends StatelessWidget {
  const FABWidget({
    Key key,
    @required this.icon,
    @required this.onTap,
  }) : super(key: key);

  final IconData icon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 56,
      right: 16,
      width: 56,
      height: 56,
      child: this.icon != null
          ? InkWell(
        onTap: onTap,
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
          child: Icon(icon),
        ),
      )
          : Container(),
    );
  }
}