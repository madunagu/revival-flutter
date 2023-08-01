import 'package:devotion/repositories/EventRepository.dart';
import 'package:devotion/repositories/UserRepository.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:flutter/material.dart';

import 'models/user.dart';

class ProfileScreen extends StatelessWidget {
  final User user;
  ProfileScreen({required this.user});

  Future<User> getUser() {
    return UserRepository().getUser();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: Container(
        height: 0,
      ),
      paddingTop: 0,
      body: FutureBuilder<User>(
          future: getUser(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                height: 1000,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      top: 0,
                      left: 0,
                      height: 385,
                      width: MediaQuery.of(context).size.width,
                      child: Image.asset(
                        'images/avatar1.jpg',
                        fit: BoxFit.cover,
                        height: 385,
                        width: MediaQuery.of(context).size.width,
                      ),
                    ),
                    Positioned(
                      top: 61,
                      left: 0,
                      width: MediaQuery.of(context).size.width,
                      height: 43,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 28),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Icon(
                              Icons.arrow_back_ios,
                              color: Colors.white,
                            ),
                            Icon(
                              Icons.menu,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      top: 301,
                      left: 0,
                      width: MediaQuery.of(context).size.width,
                      height: 700,
                      child: Container(
                        height: 400,
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.symmetric(vertical: 38),
                        decoration: BoxDecoration(
                          borderRadius:
                              BorderRadius.only(topRight: Radius.circular(80)),
                          color: Color(0xFFF1F0F2),
                        ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 32),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Expanded(
                                    flex: 3,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.max,
                                      children: <Widget>[
                                        Text(
                                          user.name,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 28,
                                            color: Color(0xFF241332),
                                          ),
                                        ),
                                        Text(
                                          'San Fransico CA, 20 years',
                                          style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 14,
                                            color: Color(0xFF998FA2),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  FollowButtonWidget(user: user),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 24,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 32,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Column(
                                children: <Widget>[
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Icon(
                                              Icons.chat,
                                              color: Color(0xff9599b3),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              'Chat',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff78849e),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Icon(
                                              Icons.chat,
                                              color: Color(0xff9599b3),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              'Chat',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff78849e),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Icon(
                                              Icons.chat,
                                              color: Color(0xff9599b3),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              'Chat',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff78849e),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                    color: Color(0x23998fa2),
                                    height: 1,
                                    margin: EdgeInsets.symmetric(vertical: 32),
                                  ),
                                  Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: <Widget>[
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Icon(
                                              Icons.chat,
                                              color: Color(0xff9599b3),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              'Chat',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff78849e),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Icon(
                                              Icons.chat,
                                              color: Color(0xff9599b3),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              'Chat',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff78849e),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Icon(
                                              Icons.chat,
                                              color: Color(0xff9599b3),
                                            ),
                                            SizedBox(
                                              height: 12,
                                            ),
                                            Text(
                                              'Chat',
                                              style: TextStyle(
                                                fontSize: 13,
                                                color: Color(0xff78849e),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 16),
                              padding: EdgeInsets.symmetric(
                                horizontal: 24,
                                vertical: 32,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(
                                  Radius.circular(40),
                                ),
                                color: Color(0xFFFFFFFF),
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(50)),
                                        child: Image.asset(
                                          'images/avatar1.jpg',
                                          height: 36,
                                          width: 36,
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(),
                                  Icon(Icons.keyboard_arrow_down),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }
}

class FollowButtonWidget extends StatefulWidget {
  final User user;
  const FollowButtonWidget({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  _FollowButtonWidgetState createState() => _FollowButtonWidgetState();
}

class _FollowButtonWidgetState extends State<FollowButtonWidget> {
  bool isFollowing = false;

  follow() async {}
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: follow,
      child: Container(
        padding: EdgeInsets.only(
          top: 13,
          left: 24,
          bottom: 13,
          right: 20,
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(15),
            bottomLeft: Radius.circular(15),
          ),
          color: !isFollowing ? Color(0xFF8A56AC) : Color(0x33FF8A56AC),
        ),
        child: Text(
          !isFollowing ? 'FOLLOW' : 'UNFOLLOW',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
