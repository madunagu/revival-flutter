import 'package:flutter/material.dart';

class ImageAvatarWidget extends StatelessWidget {
  final imageURL;
  final double size;
  final Color borderColor;
  final double borderWidth;
  ImageAvatarWidget({
    Key key,
    this.imageURL,
    this.size = 40,
    this.borderColor = Colors.white,
    this.borderWidth = 1,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.size,
      width: this.size,
      decoration: BoxDecoration(
        border: Border.all(
          color: borderColor,
          width: borderWidth,
        ),
        borderRadius: BorderRadius.all(Radius.circular(50)),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(50)),
        child: Image.asset(
          imageURL,
          fit: BoxFit.fitWidth,
        ),
      ),
    );
  }
}
