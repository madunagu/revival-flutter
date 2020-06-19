import 'dart:developer';

import 'package:devotion/models/Address.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class AddressSheet extends StatefulWidget {
  AddressSheet({Key key}) : super(key: key);
  final EdgeInsetsGeometry inputPadding = EdgeInsets.all(8);

  @override
  _AddressSheetState createState() => _AddressSheetState();
}

class _AddressSheetState extends State<AddressSheet> {
  final Address myAddress = Address();
  final NetworkingClass myNetwork = NetworkingClass();
  String countryValue = 'Nigeria';
  bool isLoading = false;

  TextEditingController line1Controller;
  TextEditingController line2Controller;
  TextEditingController cityController;
  TextEditingController nameController;
  TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 44,
            ),
            Text(
              'Create Address',
              style: TextStyle(fontSize: 32, fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 21,
            ),
            TextField(
              controller: line1Controller,
              decoration: InputDecoration(
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
            TextField(
              controller: line2Controller,
              decoration: InputDecoration(
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
            TextField(
              controller: cityController,
              obscureText: true,
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
            Switch(
                value: false,
                onChanged: (value) {
                  this.myAddress.defaultAddress = value;
                }),
            GestureDetector(
              onTap: isLoading ? null : submitButtonPressed,
              child: Container(
                height: 52,
                width: double.infinity,
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(82),
                  color: isLoading?Colors.grey :Color(0xff8a56ac),
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
  }

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController();
    _passwordController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    nameController.dispose();
  }

  Future<void> submitButtonPressed() async {
    setState(() {
      isLoading = true;
    });

    try {
      var response = await this.myNetwork.post('/address', this.myAddress);
      Address address = Address.fromJson(response);
    } catch (e) {
      log('heere');
      setState(() {
        isLoading = false;
      });
    }
    setState(() {
      isLoading = false;
    });
    //TODO: here return back the adress
  }
}
