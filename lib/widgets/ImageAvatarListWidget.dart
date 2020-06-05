import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

class ImageAvatarListWidget extends StatelessWidget {
  final List<String> images;
  final double size;
  ImageAvatarListWidget({this.images, this.size =24});
  @override
  Widget build(BuildContext context) {
    List<Widget> imageAvatars = [];
    for (var i = 0; i < this.images.length; i++) {
      imageAvatars.insert(
        0,
        Positioned(
          height: this.size,
          width: this.size,
          child: ImageAvatarWidget(
            imageURL: this.images[i],
            size: this.size,
            isBordered: true,
          ),
          left: this.size * 3/4 * i ,
        ),
      );
    }

    return Container(
      width: this.size * 3/4 * this.images.length + 10,
      height: this.size + 10,
      child: Stack(
        overflow: Overflow.clip,
        children: imageAvatars,
      ),
    );
  }
}
