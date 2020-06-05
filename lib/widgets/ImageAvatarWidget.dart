import 'package:flutter/material.dart';

class ImageAvatarWidget extends StatelessWidget {
  final imageURL;
  final double size;
  final bool isBordered;
  ImageAvatarWidget(
      {Key key, this.imageURL, this.size = 40, this.isBordered = false})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: this.size,
      width: this.size,
      decoration: this.isBordered
          ? BoxDecoration(
              border: Border.all(
                color: Colors.white,
                width: 1,
              ),
        borderRadius: BorderRadius.all(Radius.circular(50)),
            )
          : BoxDecoration(),
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
