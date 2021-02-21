import 'dart:io';

import 'package:devotion/bloc/states/FormSheetState.dart';
import 'package:devotion/widgets/SearchDetailWidget.dart';
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
            decoration: BoxDecoration(
              color: Color(0xff352641),
              borderRadius: BorderRadius.circular(52),
              border: Border.all(
                color: Color(0xff261835),
              ),
            ),
            child: SearchDetailWidget(icon: Icons.attach_file, text: title),
          ),
          Container(
            padding: EdgeInsets.only(top: 17),
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(60),
                bottomLeft: Radius.circular(60),
              ),
              child: file == null
                  ? Container()
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
