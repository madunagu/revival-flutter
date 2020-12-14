import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/BottomSheetLine.dart';
import 'package:devotion/widgets/DottedTabBarWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/SmallItemWidget.dart';
import 'package:flutter/material.dart';

class Profile2 extends StatelessWidget {
  double screenHeight = 130;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return AppScaffoldWidget(
      paddingTop: 0,
      body: Container(
        width: size.width,
        height: size.height,
        child: Stack(
          children: [
            Image.asset(
              'images/photo.png',
              width: size.width,
              height: 430,
              fit: BoxFit.cover,
            ),
            Positioned(
              top: 56,
              child: Container(
                width: size.width,
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                    ),
                    Icon(
                      Icons.filter,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 200,
              child: Container(
                width: size.width,
                child: Column(
                  children: [
                    ImageAvatarWidget(
                      imageURL: 'images/avatar2.jpg',
                      size: 48,
                      borderColor: Colors.transparent,
                    ),
                    SizedBox(height: 13),
                    Text(
                      'Alexio Morales',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    Text(
                      '128k followers',
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: screenHeight,
              // height: size.height - 340,
              // width: size.width,
              child: Container(
                padding: EdgeInsets.only(top: 12),
                width: size.width,
                height: size.height - screenHeight,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Column(
                  children: [
                    BottomSheetLine(),
                    SizedBox(height: 12),
                    DottedTabBarWidget(count: 5, active: 1),
                    SizedBox(height: 20),
                    Container(
                      width: size.width - 48,
                      height: size.height - screenHeight - 58,
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SmallItemWidget(
                              image: 'images/avatar1.jpg',
                              title: 'I surrender',
                              subTitle: 'Hillsong United',
                              amount: '4:30',
                            ),
                            SmallItemWidget(
                              isActive: true,
                              image: 'images/avatar1.jpg',
                              title: 'I surrender',
                              subTitle: 'Hillsong United',
                              amount: '4:30',
                            ),
                            SmallItemWidget(
                              image: 'images/avatar1.jpg',
                              title: 'I surrender',
                              subTitle: 'Hillsong United',
                              amount: '4:30',
                            ),
                            SmallItemWidget(
                              image: 'images/avatar1.jpg',
                              title: 'I surrender',
                              subTitle: 'Hillsong United',
                              amount: '4:30',
                            ),
                            SmallItemWidget(
                              image: 'images/avatar1.jpg',
                              title: 'I surrender',
                              subTitle: 'Hillsong United',
                              amount: '4:30',
                            ),
                            SmallItemWidget(
                              image: 'images/avatar1.jpg',
                              title: 'I surrender',
                              subTitle: 'Hillsong United',
                              amount: '4:30',
                            ),
                            SmallItemWidget(
                              image: 'images/avatar1.jpg',
                              title: 'I surrender',
                              subTitle: 'Hillsong United',
                              amount: '4:30',
                            ),
                            SmallItemWidget(
                              image: 'images/avatar1.jpg',
                              title: 'I surrender',
                              subTitle: 'Hillsong United',
                              amount: '4:30',
                            ),
                            SmallItemWidget(
                              image: 'images/avatar1.jpg',
                              title: 'I surrender',
                              subTitle: 'Hillsong United',
                              amount: '4:30',
                            ),
                            SmallItemWidget(
                              image: 'images/avatar1.jpg',
                              title: 'I surrender',
                              subTitle: 'Hillsong United',
                              amount: '4:30',
                            ),
                            SmallItemWidget(
                              image: 'images/avatar1.jpg',
                              title: 'I surrender',
                              subTitle: 'Hillsong United',
                              amount: '4:30',
                            ),
                            SmallItemWidget(
                              image: 'images/avatar1.jpg',
                              title: 'I surrender',
                              subTitle: 'Hillsong United',
                              amount: '4:30',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
