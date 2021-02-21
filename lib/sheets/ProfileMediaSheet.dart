import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:devotion/bloc/blocs/form.bloc.dart';
import 'package:devotion/bloc/events/FormEvent.dart';
import 'package:devotion/bloc/states/FormSheetState.dart';
import 'package:devotion/models/Address.dart';
import 'package:devotion/models/ProfileMedia.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/widgets/MapWidget.dart';
import 'package:devotion/widgets/SelectImageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

class ProfileMediaSheet extends StatefulWidget {
  ProfileMediaSheet({Key key}) : super(key: key);
  @override
  _ProfileSheetState createState() => _ProfileSheetState();
}

class _ProfileSheetState extends State<ProfileMediaSheet> {
  final _formKey = GlobalKey<FormState>();
  File _logoImage;
  File _profileImage;
  File _backgroundImage;

  getRawImage(File pic) {
    if (pic != null) {
      return base64Encode(pic.readAsBytesSync());
    }
    return null;
  }

  Future<File> _imgFromGallery() async {
    PickedFile image = await ImagePicker()
        .getImage(source: ImageSource.gallery, imageQuality: 50);

    return File(image.path);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<FormBloc, FormSheetState>(
        builder: (BuildContext context, FormSheetState state) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: BlocListener<FormBloc, FormSheetState>(
              listener: (context, state) {
                print(state);
                if (state is FormSuccess) {
                  log(state.toString());
                  Navigator.of(context).pop(
                    ProfileMedia.fromJson(state.object['data']),
                  );
                }
              },
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 44,
                    ),
                    Text(
                      'Object Media',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    SelectImageWidget(
                      title: 'Logo',
                      state: state,
                      input: 'logo_url',
                      file: _logoImage,
                      onTap: () async {
                        _logoImage = await _imgFromGallery();
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    SelectImageWidget(
                      title: 'Profile Image',
                      state: state,
                      input: 'profile_image_url',
                      file: _profileImage,
                      onTap: () async {
                        _profileImage = await _imgFromGallery();
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    SelectImageWidget(
                      title: 'Cover Image',
                      file: _backgroundImage,
                      state: state,
                      input: 'background_image_url',
                      onTap: () async {
                        _backgroundImage = await _imgFromGallery();
                        setState(() {});
                      },
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    SizedBox(height: 20),
                    GestureDetector(
                      onTap:
                          state is FormInProgress ? null : submitButtonPressed,
                      child: Container(
                        height: 52,
                        width: double.infinity,
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
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
          );
        },
      ),
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
    Map<String, dynamic> obj = {
      'logo_url': getRawImage(_logoImage),
      'profile_image_url': getRawImage(_profileImage),
      'background_image_url': getRawImage(_backgroundImage)
    };
    BlocProvider.of<FormBloc>(context).add(
      CreateButtonPressed(
        object: obj,
        url: '/profile-media',
      ),
    );
  }
}
