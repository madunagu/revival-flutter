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
  final ProfileMedia myProfile = ProfileMedia();
  final NetworkingClass myNetwork = NetworkingClass();
  final _formKey = GlobalKey<FormState>();
  File _avatarImage;
  File _profileImage;
  File _backgroundImage;

  final TextStyle inputStyle = const TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.w500,
    color: Color(0x52241332),
    height: 20 / 16,
    fontFamily: 'Montserrat',
    letterSpacing: -0.1,
  );
  final InputDecoration inputDecoration = const InputDecoration(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Color(0xffdddddd),
      ),
    ),
    focusedBorder: UnderlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Color(0xff352641),
        width: 2,
      ),
    ),
    border: UnderlineInputBorder(
      borderSide: BorderSide(
        style: BorderStyle.solid,
        color: Color(0xffdddddd),
      ),
    ),
    hintText: 'Address line 1',
  );

  String validationMessage(FormSheetState state, String inputName) {
    if (state is FormInvalidated) {
      if (state.errors.containsKey(inputName)) {
        return state.errors[inputName][0];
      }
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
                    Address.fromJson(state.object['data']),
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
                      file: _avatarImage,
                      onTap: () async {
                        _avatarImage = await _imgFromGallery();
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
    BlocProvider.of<FormBloc>(context).add(
      CreateButtonPressed(
        object: myProfile.toJson(),
        url: '/profile-media',
      ),
    );
  }

  void editAddress(String value, String property) {
    setState(() {
      // this.myAddress.property
    });
  }
}
