import 'dart:convert';
import 'dart:developer';

import 'package:devotion/bloc/blocs/form.bloc.dart';
import 'package:devotion/bloc/events/FormEvent.dart';
import 'package:devotion/bloc/states/FormSheetState.dart';
import 'package:devotion/models/VideoPost.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/widgets/MapWidget.dart';
import 'package:devotion/widgets/SelectImageWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoSheet extends StatefulWidget {
  VideoSheet({Key key}) : super(key: key);
  @override
  _VideoSheetState createState() => _VideoSheetState();
}

class _VideoSheetState extends State<VideoSheet> {
  final VideoPost myVideo = VideoPost();
  final NetworkingClass myNetwork = NetworkingClass();
  final _formKey = GlobalKey<FormState>();
  TextEditingController nameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController transcriptController = TextEditingController();
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
                  Navigator.of(context)
                      .pop(VideoPost.fromJson(state.object['data']));
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
                      'Create Video',
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    TextFormField(
                      controller: nameController,
                      style: inputStyle.copyWith(color: Color(0xff241332)),
                      decoration: inputDecoration.copyWith(
                        errorText: validationMessage(state, 'name'),
                        hintText: 'Video Title',
                        hintStyle: inputStyle,
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    TextFormField(
                      style: inputStyle.copyWith(color: Color(0xff241332)),
                      controller: descriptionController,
                      decoration: inputDecoration.copyWith(
                        errorText: validationMessage(state, 'description'),
                        hintText: 'Video Description',
                        hintStyle: inputStyle,
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    TextFormField(
                      controller: transcriptController,
                      style: inputStyle.copyWith(color: Color(0xff241332)),
                      decoration: inputDecoration.copyWith(
                        errorText: validationMessage(state, 'full_text'),
                        hintText: 'Audio Transcript',
                        hintStyle: inputStyle,
                      ),
                    ),
                    SizedBox(height: 21),
                    SelectImageWidget(title: 'Select Video'),
                    SizedBox(height: 21),
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

  String validationMessage(FormSheetState state, String inputName) {
    if (state is FormInvalidated) {
      if (state.errors.containsKey(inputName)) {
        return state.errors[inputName][0];
      }
    }
    return null;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
    descriptionController.dispose();
    transcriptController.dispose();
  }

  void submitButtonPressed() {
    this.myVideo.name = nameController.value.text;
    this.myVideo.description = descriptionController.value.text;
    this.myVideo.fullText = transcriptController.value.text;
    // this.myAddress.country = countryValue;
    // this.myVideo.state = countryValue;
    BlocProvider.of<FormBloc>(context).add(
      CreateButtonPressed(
        object: myVideo.toJson(),
        url: '/video-posts',
      ),
    );
  }

  void editVideo(String value, String property) {
    setState(() {
      // this.myVideo.property
    });
  }
}
