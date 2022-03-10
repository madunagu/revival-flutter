import 'dart:developer';

import 'package:devotion/models/Post.dart';
import 'package:devotion/models/ResizedImage.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/widgets/DottedTabBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class PostScreen extends StatefulWidget {
  PostScreen({this.post});
  final Post post;

  @override
  _PostScreenState createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  int activeSlide = 0;
  // int sliderCount = 2;
  Post post;
  bool isLoading = true;
  @override
  void initState() {
    post = widget.post;
    super.initState();
  }

  void initializeTabController() {
    _tabController = TabController(vsync: this, length: post.images.length);
    _tabController.addListener(() {
      int i = _tabController.index;
      setState(() {
        activeSlide = i;
      });
    });
  }

  @override
  void dispose() {
    if (_tabController != null) _tabController.dispose();
    super.dispose();
  }

  void getEvent() async {
    try {
      Map<String, dynamic> eventResponse =
          await NetworkingClass().get("/posts/${widget.post.id}");
      post = Post.fromJson(eventResponse['data']);
      initializeTabController();
      setState(() {
        isLoading = false;
      });
    } catch (_) {
      log(_.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          width: deviceWidth,
          child: Column(
            children: <Widget>[
              Stack(
                children: [
                  ClipRRect(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100)),
                    child: Container(
                      height: 573 / 812 * deviceHeight - 12,
                      width: deviceWidth,
                      child: TabBarView(
                        controller: _tabController,
                        children: post.images
                            .map((ResizedImage e) =>
                                Image.asset(e.large, fit: BoxFit.cover))
                            .toList(),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    child: DottedTabBarWidget(
                      count: post.images?.length ?? 0,
                      active: activeSlide,
                      activeColor: Color(0xffECF1F7),
                      color: Color(0x33BBD1EB),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.only(
                  top: 32,
                  left: 16,
                  right: 16,
                ),
                child: Column(
                  children: <Widget>[
                    Text(
                      post.name,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 32,
                        letterSpacing: -.5,
                        height: 1.25,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      post.body,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xff767676),
                        fontSize: 14,
                        height: 20 / 14,
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Container(
                width: deviceWidth,
                padding: EdgeInsets.symmetric(horizontal: 20),
                height: 84,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(42),
                  ),
                  color: Color(0xff241332),
                ),
                alignment: Alignment.center,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 2,
                      child: Container(),
                    ),
                    Expanded(
                      flex: 3,
                      child: Text(
                        'CONTINUE',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                      size: 22,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
