import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    const tabStyle = TextStyle(
        color: Colors.white, fontWeight: FontWeight.w600, fontSize: 12);
    const purpleColor = Color(0xff8a56ac);
    const inputPadding = EdgeInsets.only(left: 0, top: 35, bottom: 7, right: 0);
    return Scaffold(
      backgroundColor: Color(0xfff1f0f2),
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 700,
          child: Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                left: 0,
                width: MediaQuery.of(context).size.width,
                height: 269,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(80),),
                      color: purpleColor),
                ),
              ),
              Positioned(
                top: 60,
                left: 0,
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'SIGN IN',
                      style: tabStyle,
                    ),
                    SizedBox(
                      width: 57,
                    ),
                    Text(
                      'SIGN UP',
                      style: tabStyle,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 0,
                top: 91,
                width: MediaQuery.of(context).size.width,
                height: 400,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Container(
                        height: 271,
                        padding: EdgeInsets.symmetric(horizontal: 32),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(40),
                            color: Colors.white),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.max,
                          children: <Widget>[
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding: inputPadding,
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.red,
                                    ),
                                  ),
                                  hintText: 'Name'),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding: inputPadding,
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.red,
                                    ),
                                  ),
                                  hintText: 'Email'),
                            ),
                            TextField(
                              decoration: InputDecoration(
                                  contentPadding: inputPadding,
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                      style: BorderStyle.solid,
                                      color: Colors.red,
                                    ),
                                  ),
                                  hintText: 'Password'),
                            ),
                            SizedBox(
                              height: 54,
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 32,
                      ),
                      Container(
                        height: 52,
                        width: double.infinity,
                        padding: EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(82),
                          color: purpleColor,
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
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
