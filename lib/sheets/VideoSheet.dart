import 'dart:convert';
import 'dart:developer';

import 'package:devotion/bloc/blocs/form.bloc.dart';
import 'package:devotion/bloc/events/FormEvent.dart';
import 'package:devotion/bloc/states/FormSheetState.dart';
import 'package:devotion/models/VideoPost.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/widgets/MapWidget.dart';
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
  String countryValue;
  String stateValue;
  List<String> countries = ['Nigeria', 'Ghana', 'Kenya', 'Uganda'];
  List<String> states = ['Imo', 'Enugu', 'Anambara', 'Lagos'];
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
              // condition: (state, state2) {
              //   if (state is FormSuccess) {
              //     return true;
              //   } n
              //   return false;
              // },
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
                        hintText: 'Address line 2',
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
//                    Text(
//                      'Country',
//                      style: TextStyle(
//                        letterSpacing: -0.22,
//                        fontWeight: FontWeight.w600,
//                        fontSize: 11,
//                      ),
//                    ),
                    Container(
                      width: double.infinity,
                      child: DropdownButton<String>(
                        value: countryValue,
                        hint: Text('Country', style: inputStyle),
                        elevation: 16,
                        style: inputStyle.copyWith(color: Color(0xff241332)),
                        underline: Container(
                          padding: EdgeInsets.only(top: 8),
                          height: 1,
                          color: Color(0xffdddddd),
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            countryValue = newValue;
                          });
                        },
                        items: countries
                            .map((String value) => DropdownMenuItem(
                                  value: value,
                                  child: Text(value),
                                ))
                            .toList(),
                      ),
                    ),
                    SizedBox(
                      height: 18,
                    ),

                    Container(
                      width: double.infinity,
                      child: DropdownButton<String>(
                        value: stateValue,
                        hint: Text('State', style: inputStyle),
                        elevation: 16,
                        style: inputStyle.copyWith(color: Color(0xff241332)),
                        underline: Container(
                          height: 1,
                          color: Color(0xffdddddd),
                        ),
                        onChanged: (String newValue) {
                          setState(() {
                            stateValue = newValue;
                          });
                        },
                        items: states
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                    ),
                    SizedBox(
                      height: 21,
                    ),
                    MapWidget(),
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
        url: '/videos',
      ),
    );
  }

  void editVideo(String value, String property) {
    setState(() {
      // this.myVideo.property
    });
  }
}

class AttachFile extends StatelessWidget {
  final String fileType;
  final IconData fileIcon;
  const AttachFile({this.fileType= 'File', this.fileIcon=Icons.attach_file });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children:[
        Icon(fileIcon),
        Spacer(),
        Text('attach a $fileType'),
      ]),
    );
  }
}
