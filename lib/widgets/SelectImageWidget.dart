import 'dart:io';

import 'package:devotion/bloc/states/FormSheetState.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class SelectImageWidget extends StatelessWidget {
  final String title;
  final String input;
  final File file;
  final FormSheetState state;
  final VoidCallback onTap;
  SelectImageWidget({
    @required this.title,
    this.input,
    this.onTap,
    this.file,
    @required this.state,
  });

  Future<File> _imgFromGallery() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    return File(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Icon(Icons.attach_file),
                Text(title),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.only(top: 17),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
                bottomLeft: Radius.circular(60),
              ),
              child: file == null
                  ? Image.asset(
                      'images/map.png',
                      width: double.infinity,
                      height: 116,
                      fit: BoxFit.cover,
                    )
                  : Image.file(
                      file,
                      fit: BoxFit.cover,
                    ),
            ),
          )
        ],
      ),
    );
  }
}
