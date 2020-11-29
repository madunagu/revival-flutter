import 'package:devotion/widgets/DefaultAppBarWidget.dart';
import 'package:devotion/widgets/ScaffoldDesignWidget.dart';
import 'package:flutter/material.dart';

class VideoPlayerScreen extends StatefulWidget {
  final int id;
  VideoPlayerScreen(this.id);
  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  @override
  Widget build(BuildContext context) {
    return ScaffoldDesignWidget(
      customAppBar: DefaultAppBarWidget(
        color: Color(0xffffffff),
        title: 'Yoga Poses',
        borderColor: Color(0x00ffffff),
        titleColor: Color(0xff000000),
        
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
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
                      width: MediaQuery.of(context).size.width,
                      height: 287,
                      child: Container(
                        height: 287,
                        width: MediaQuery.of(context).size.width,
                        child: Image.asset(
                          'images/avatar1.jpg',
                          fit: BoxFit.cover,
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
                        width: MediaQuery.of(context).size.width,
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
            Container(
              height: 400,
              color: Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
