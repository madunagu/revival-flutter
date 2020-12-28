import 'dart:convert';
import 'dart:developer';

import 'package:devotion/blocs/form.bloc.dart';
import 'package:devotion/events/FormEvent.dart';
import 'package:devotion/states/FormSheetState.dart';
import 'package:devotion/models/Address.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddressSheet extends StatefulWidget {
  AddressSheet({Key key}) : super(key: key);
  final EdgeInsetsGeometry inputPadding = EdgeInsets.all(8);

  @override
  _AddressSheetState createState() => _AddressSheetState();
}

class _AddressSheetState extends State<AddressSheet> {
  final Address myAddress = Address();
  final NetworkingClass myNetwork = NetworkingClass();
  final _formKey = GlobalKey<FormState>();
  String countryValue = 'Nigeria';
  bool isLoading = false;

  TextEditingController line1Controller = TextEditingController();
  TextEditingController line2Controller = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<FormBloc, FormSheetState>(
        builder: (BuildContext context, FormSheetState state) {
          return Container(
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 32),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 44,
                  ),
                  Text(
                    'Create Church',
                    style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextFormField(
                    controller: line1Controller,
                    decoration: InputDecoration(
                        errorText: validationMessage(state, 'address1'),
                        contentPadding: widget.inputPadding,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.red,
                          ),
                        ),
                        hintText: 'Address line 1'),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  TextFormField(
                    controller: line2Controller,
                    decoration: InputDecoration(
                        errorText: validationMessage(state, 'address2'),
                        contentPadding: widget.inputPadding,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.red,
                          ),
                        ),
                        hintText: 'Address line 2'),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Text(
                    'Country',
                    style: TextStyle(
                      letterSpacing: -0.22,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: DropdownButton<String>(
                      value: countryValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 18,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          countryValue = newValue;
                        });
                      },
                      items: <String>['Nigeria', 'Ghana', 'Kenya', 'Uganda']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'State',
                    style: TextStyle(
                      letterSpacing: -0.22,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    child: DropdownButton<String>(
                      value: countryValue,
                      icon: Icon(Icons.arrow_downward),
                      iconSize: 18,
                      elevation: 16,
                      style: TextStyle(color: Colors.black),
                      underline: Container(
                        height: 1,
                        color: Colors.grey,
                      ),
                      onChanged: (String newValue) {
                        setState(() {
                          countryValue = newValue;
                        });
                      },
                      items: <String>['Nigeria', 'Ghana', 'Kenya', 'Uganda']
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
                  TextFormField(
                    controller: cityController,
                    decoration: InputDecoration(
                        contentPadding: widget.inputPadding,
                        border: UnderlineInputBorder(
                          borderSide: BorderSide(
                            style: BorderStyle.solid,
                            color: Colors.red,
                          ),
                        ),
                        hintText: 'City'),
                  ),
                  SizedBox(
                    height: 21,
                  ),
                  Text(
                    'Country',
                    style: TextStyle(
                      letterSpacing: -0.22,
                      fontWeight: FontWeight.w600,
                      fontSize: 11,
                    ),
                  ),
                  // Switch(
                  //   value: false,
                  //   onChanged: (value) {
                  //     this.myAddress.defaultAddress = value;
                  //   },
                  // ),
                  GestureDetector(
                    onTap: state is FormInProgress ? null : submitButtonPressed,
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
                ],
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
    line1Controller.dispose();
    line2Controller.dispose();
    cityController.dispose();
  }

  String myValidator(FormSheetState state, String inputName) {
    if (state is FormInvalidated) {
      if (state.errors.containsKey('address1')) {
        log(state.toString());
        return 'form is invalidated';
        // return state.errors['address1'].toString();

      }
    }
    return 'not';
  }

  void submitButtonPressed() {
    this.myAddress.address1 = line1Controller.value.text;
    this.myAddress.address2 = line2Controller.value.text;
    this.myAddress.city = cityController.value.text;
    this.myAddress.country = countryValue;
    this.myAddress.state = countryValue;
    BlocProvider.of<FormBloc>(context).add(
      CreateButtonPressed(
        object: myAddress.toJson(),
        url: '/addresses',
      ),
    );
  }

  void editAddress(String value, String property) {
    setState(() {
      // this.myAddress.property
    });
  }
}
