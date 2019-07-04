import 'package:devotion/ScaffoldDesignWidget.dart';
import 'package:devotion/widgets/MainNavigationBarWidget.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldDesignWidget(
      bodyColor: Colors.white,
      customAppBar: MainNavigationBarWidget(),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: 900,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: 287,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    top: 0,
                    left: 0,
                    width: MediaQuery.of(context).size.width,
                    height: 287,
                    child: ClipRRect(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(80)),
                      child: Container(
                        height: 287,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'images/avatar1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    left: 0,
                    width: MediaQuery.of(context).size.width,
                    height: 287,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: 287,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Color(0x00241332),
                            Color(0xff241332),
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
                    child: Padding(
                      padding: const EdgeInsets.only(left: 52.0, right: 16),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
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
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Fabiena Rhodes',
                                style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.39,
                                  color: Colors.white,
                                ),
                              ),
                              Container(
                                width: 32,
                                height: 32,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xff352641),
                                ),
                                child: Icon(Icons.edit),
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
            Padding(
              padding: EdgeInsets.symmetric(vertical: 17, horizontal: 66),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Stack(
                          children: <Widget>[
                            Icon(
                              Icons.message,
                              size: 32,
                              color: Colors.white,
                            ),
                            Positioned(
                              top: 0,
                              left: 0,
                              child: Container(
                                width: 27,
                                height: 27,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(50),
                                  color: Color(0xff352641),
                                ),
                                child: Text(
                                  '7',
                                  style: TextStyle(
                                      fontSize: 13,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Container(
                        height: double.infinity,
                        width: 1,
                        color: Colors.white,
                      ),
                      Stack(
                        children: <Widget>[
                          Icon(
                            Icons.message,
                            size: 32,
                            color: Colors.white,
                          ),
                          Positioned(
                            top: 0,
                            left: 0,
                            child: Container(
                              width: 27,
                              height: 27,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(50),
                                color: Color(0xff352641),
                              ),
                              child: Text(
                                '7',
                                style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
