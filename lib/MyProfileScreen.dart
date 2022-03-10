import 'package:devotion/MessagesScreen.dart';
import 'package:devotion/NotificationScreen.dart';
import 'package:devotion/repositories/UserRepository.dart';
import 'package:devotion/sheets/ImageSheet.dart';
import 'package:devotion/util/Constants.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/models/User.dart';
import 'package:devotion/widgets/LinearProgressWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyProfileScreen extends StatefulWidget {
  MyProfileScreen({this.user});
  final User user;
  @override
  _MyProfileScreenState createState() => _MyProfileScreenState();
}

class _MyProfileScreenState extends State<MyProfileScreen> {
  User user;
  bool isLoading = false;

  void getUser() async {
    isLoading = true;
    var res = await NetworkingClass().get('/user');
    user = User.fromJson(res);
    isLoading = false;
  }

  @override
  void initState() {
    user = widget.user;
    getUser();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      color: Color(0xff241332),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: <Widget>[
          Container(
            width: size.width,
            margin: EdgeInsets.only(top: 83),
            height: 287,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(80),
              ),
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    width: size.width,
                    height: 287,
                    child: Container(
                      height: 287,
                      width: size.width,
                      child: Image.network(
                        user.images != null && user.images.isNotEmpty
                            ? user.images[0].medium
                            : AVATAR_URL,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Positioned(
                    child: isLoading ? LinearProgressWidget() : Container(),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    width: size.width,
                    height: 87,
                    child: Container(
                      width: size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x00241332),
                            Color(0xB2241332),
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 30,
                    left: 0,
                    child: Container(
                      width: size.width,
                      padding: const EdgeInsets.only(left: 52.0, right: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '145 meetups',
                            style: TextStyle(
                              color: Color(0xA0FFFFFF),
                              fontSize: 13,
                              letterSpacing: -0.26,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          SizedBox(
                            height: 7,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              user != null
                                  ? Text(
                                      user.name ?? '',
                                      style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.w700,
                                        letterSpacing: -0.39,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Container(),
                              InkWell(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => ImageSheet(),
                                  ),
                                ),
                                child: Container(
                                  width: 32,
                                  height: 32,
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(50),
                                    color: Color(0xff352641),
                                  ),
                                  child: Icon(
                                    Icons.edit,
                                    color: Colors.white,
                                    size: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          CurvedCornerWidget(
            borderColor: Color(0xff423050),
            child: Container(
              height: 125,
              padding: EdgeInsets.symmetric(vertical: 24),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MessagesScreen()),
                          ),
                          child: Container(
                            width: 55,
                            height: 50,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Positioned(
                                  top: 10,
                                  child: Icon(
                                    Icons.email,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    width: 27,
                                    height: 27,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xff8a56ac),
                                    ),
                                    child: Text(
                                      '7',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Messages',
                          style: TextStyle(
                            color: Color(0xff998fa2),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 1,
                    color: Color(0xff817889),
                  ),
                  Expanded(
                    flex: 1,
                    child: Column(
                      children: [
                        InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => NotificationScreen(),
                            ),
                          ),
                          child: Container(
                            width: 55,
                            height: 50,
                            child: Stack(
                              alignment: Alignment.topCenter,
                              children: [
                                Positioned(
                                  top: 10,
                                  child: Icon(
                                    Icons.notifications_none,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                                Positioned(
                                  right: 0,
                                  top: 0,
                                  child: Container(
                                    width: 27,
                                    height: 27,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(50),
                                      color: Color(0xffd47fa6),
                                    ),
                                    child: Text(
                                      '7',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 12,
                        ),
                        Text(
                          'Notifications',
                          style: TextStyle(
                            color: Color(0xff998fa2),
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          CurvedCornerWidget(
            borderColor: Color(0xff423050),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 48, vertical: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'About Me',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'When I was 5 years old, my mother always told me that happiness was the key to life. When I went to school, they asked me what I wanted to be when I grew up. ',
                    style: TextStyle(
                      color: Color(0xff998fa2),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          CurvedCornerWidget(
            borderColor: Color(0xff423050),
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 48, vertical: 40),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Timeline',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'You may need to create an account to use some of our Services. You are responsible for safeguarding your account, so use a strong password and limit its use to this account. We cannot and will not be liable for any loss or damage arising from your failure to comply with the above.',
                    style: TextStyle(
                      color: Color(0xff998fa2),
                      fontWeight: FontWeight.w500,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}
