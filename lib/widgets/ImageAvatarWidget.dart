import 'package:flutter/material.dart';

class ImageAvatarWidget extends StatelessWidget {
  final imageURL;
  ImageAvatarWidget({Key key, this.imageURL}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.all(Radius.circular(50)),
      child: Container(
        height: 40,
        width: 40,
        child: Image.asset(
          imageURL,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
