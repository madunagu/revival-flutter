import 'dart:developer';

import 'package:devotion/bloc/blocs/form.bloc.dart';
import 'package:devotion/bloc/events/FormEvent.dart';
import 'package:devotion/bloc/states/FormSheetState.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/widgets/FABWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HierarchySheet extends StatefulWidget {
  HierarchySheet({Key key}) : super(key: key);
  @override
  _HierarchySheetState createState() => _HierarchySheetState();
}

class _HierarchySheetState extends State<HierarchySheet> {
  // final Address myAddress = Hierarchy();
  final NetworkingClass myNetwork = NetworkingClass();
  final _formKey = GlobalKey<FormState>();
  List<String> hierarchyNames = [
    'General Overseer',
    'Choir Leader',
    'Prayer Leader',
    'Steward',
  ];
  List<TextEditingController> hierarchyControllers = [TextEditingController()];
  List<Hierarchy> hierarchies = [Hierarchy()];
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

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    for (var c in hierarchyControllers) c.dispose();
  }

  void submitButtonPressed() {
    List<Map<String, dynamic>> res = [];
    for (int i = 0; i < hierarchies.length; i++) {
      hierarchies[i].positionName = hierarchyControllers[i].value.text;
      res.add(hierarchies[i].toJson());
    }
    BlocProvider.of<FormBloc>(context).add(
      CreateButtonPressed(
        // object: res,
        url: '/addresses',
      ),
    );
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
                    // Navigator.of(context)
                    //     .pop(Address.fromJson(state.object['data']));
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
                          'Create Hierarchy',
                          style: TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          height: 21,
                        ),
                        for (int i = 0; i < hierarchies.length; i++)
                          Container(
                            margin: EdgeInsets.only(bottom: 21),
                            decoration: BoxDecoration(
                              // color: Color(0xff352641),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(52),
                              border: Border.all(
                                color: Color(0xff261835),
                              ),
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 20,
                                    vertical: 16,
                                  ),
                                  child: DropdownButton<String>(
                                    value: hierarchies[i].positionName,
                                    hint: Text('Position', style: inputStyle),
                                    elevation: 16,
                                    style: inputStyle.copyWith(
                                      color: Colors.white,
                                    ),
                                    underline: Container(
                                      height: 1,
                                      color: Color(0xffdddddd),
                                    ),
                                    onChanged: (String newValue) {
                                      setState(() {
                                        hierarchies[i].positionName = newValue;
                                      });
                                    },
                                    items: hierarchyNames
                                        .map<DropdownMenuItem<String>>(
                                            (String value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(value),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 16),
                                  child: TextFormField(
                                    controller: hierarchyControllers[i],
                                    style: inputStyle.copyWith(
                                        color: Color(0xff241332)),
                                    decoration: inputDecoration.copyWith(
                                        errorText: validationMessage(
                                            state, 'address1'),
                                        hintText: 'Name Of Person',
                                        hintStyle: inputStyle),
                                  ),
                                ),
                              ],
                            ),
                          ),
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
                hierarchies.add(Hierarchy());
                hierarchyControllers.add(TextEditingController());
                setState(() {});
              },
            ),
          ],
        );
      },
    );
  }
}
