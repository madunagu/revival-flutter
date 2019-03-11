import 'package:flutter/material.dart';

class OnBoardingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OnboardingContents(),
    );
  }
}

class OnboardingContents extends StatefulWidget {
  @override
  _OnboardingContentsState createState() => _OnboardingContentsState();
}

class _OnboardingContentsState extends State<OnboardingContents> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100)),
              child: Container(
                height: 400,
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  'assets/images/santorini.jpg',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
              child: Column(
                children: <Widget>[
                  Text(
                    'DEVOTION',
                    style: TextStyle(color: Colors.black54, fontSize: 12),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Welcome',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                  ),
                  Text(
                    'this is a paragraph of what i want to say which is welcome to you sir ok',
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(
                    height: 200,
                  ),
                  RaisedButton(
                    onPressed: null,
                    color: Colors.purple,
                    child: Text(
                      'Next',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
