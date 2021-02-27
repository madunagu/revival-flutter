import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:devotion/bloc/blocs/form.bloc.dart';
import 'package:devotion/bloc/events/FormEvent.dart';
import 'package:devotion/bloc/states/FormSheetState.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/models/ResizedImage.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/widgets/FABWidget.dart';
import 'package:devotion/widgets/SelectImageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ImageSheet extends StatefulWidget {
  @override
  _ImageSheetState createState() => _ImageSheetState();
}

class _ImageSheetState extends State<ImageSheet> {
  final ResizedImage myImage = ResizedImage();
  final NetworkingClass myNetwork = NetworkingClass();
  List<File> images = <File>[];
//  List<SelectImageWidget> selectImageWidgets = <SelectImageWidget>[];
  final _formKey = GlobalKey<FormState>();

  Future<File> _imgFromGallery() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    return File(image.path);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<FormBloc, FormSheetState>(
      builder: (BuildContext context, FormSheetState state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: size.height,
              width: size.width,
              color: trendingColors[2],
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: BlocListener<FormBloc, FormSheetState>(
                listener: (context, state) {
                  print(state);
                  if (state is FormSuccess) {
                    log(state.toString());
                    var response = <ResizedImage>[];
                    for (var resizedData in state.object['data']) {
                      response.add(ResizedImage.fromJson(resizedData));
                    }
                    Navigator.of(context).pop(response);
                  }
                },
                child: Form(
                  key: _formKey,
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 44,
                        ),
                        Text(
                          'Upload Image',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        for (var imageFile in images)
                          SelectedImageWidget(
                            imageFile,
                            onTap: () {
                              images.remove(imageFile);
                              setState(() {});
                            },
                          ),
                        SizedBox(height: 60),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
//                  left: 0,
              child: GestureDetector(
                onTap: state is FormInProgress ? null : submitButtonPressed,
                child: Container(
                  height: 52,
                  width: size.width - 80,
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(82),
                    color: state is FormInProgress
                        ? Colors.grey
                        : Color(0xff8a56ac),
                  ),
                  child: Center(
                    child: Text(
                      'CONTINUE',
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            FABWidget(
              icon: Icons.attach_file,
              onTap: () async {
                images.add(await _imgFromGallery());
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void submitButtonPressed() {
    Map<String, List<dynamic>> obj = {'photos': []};
    for (File image in images) {
      obj['photos'].add(base64Encode(image.readAsBytesSync()));
    }

    BlocProvider.of<FormBloc>(context).add(
      CreateButtonPressed(
        object: obj,
        url: '/images',
      ),
    );
  }

  void editAddress(String value, String property) {
    setState(() {
      // this.myAddress.property
    });
  }
}

class SelectedImageWidget extends StatelessWidget {
  SelectedImageWidget(this.file, {this.onTap});
  final File file;
  final VoidCallback onTap;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onDoubleTap: onTap,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(60),
          bottomLeft: Radius.circular(60),
        ),
        child: Image.file(
          file,
          fit: BoxFit.cover,
          height: 240,
          width: double.infinity,
        ),
      ),
    );
  }
}
