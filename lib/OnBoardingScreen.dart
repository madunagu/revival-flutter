import 'package:devotion/widgets/DottedTabBarWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

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

class _OnboardingContentsState extends State<OnboardingContents>
    with TickerProviderStateMixin {
  TabController _tabController;
  int activeSlide = 0;
  int sliderCount = 2;
  @override
  void initState() {
    // TODO: implement initState
    _tabController = TabController(vsync: this, length: 2);
    _tabController.addListener(() {
      int i = _tabController.index;
      setState(() {
        activeSlide = i;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final double deviceWidth = MediaQuery.of(context).size.width;
    final double deviceHeight = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
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
                      children: [
                        Image.asset(
                          'images/avatar2.jpg',
                          fit: BoxFit.cover,
                        ),
                        Image.asset(
                          'images/avatar1.jpg',
                          fit: BoxFit.cover,
                        ),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  child: DottedTabBarWidget(
                    count: sliderCount,
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
                    'Welcome',
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
                    'this is a paragraph of what i want to say which is welcome to you sir ok',
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
    );
  }
}
