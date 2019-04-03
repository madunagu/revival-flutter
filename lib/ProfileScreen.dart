import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
          Image.asset(
            'images/avatar1.jpg',
            fit: BoxFit.cover,
            height: 385,
            width: MediaQuery.of(context).size.width,
          ),
          Positioned(
            top: 0,
            left: 0,
            child: Container(
              height: 385,
              padding: const EdgeInsets.symmetric(horizontal: 28),
              child: Row(
                mainAxisSize: MainAxisSize.max,
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
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(topLeft: Radius.circular(80)),
              color: Color(0xFFF1F0F2),
            ),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        children: <Widget>[
                          Text(
                            'Maria Snow',
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
                      InkWell(
                        child: Container(
                          padding: EdgeInsets.only(
                              top: 13, left: 24, bottom: 13, right: 20),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(30),
                                bottomLeft: Radius.circular(30)),
                            color: Color(0xFF8A56AC),
                          ),
                          child: Text(
                            'FOLLOW',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 11),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(left: 24, right: 24),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(
                      Radius.circular(40),
                    ),
                    color: Color(0xFFFFFFFF),
                  ),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(Icons.chat),
                              Text('Chat'),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(Icons.chat),
                              Text('Chat'),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(Icons.chat),
                              Text('Chat'),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(Icons.chat),
                              Text('Chat'),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(Icons.chat),
                              Text('Chat'),
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              Icon(Icons.chat),
                              Text('Chat'),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container()
              ],
            ),
          ),
        ],
      ),
    );
  }
}
