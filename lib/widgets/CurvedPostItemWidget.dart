import 'dart:convert';

import 'package:devotion/PlayerScreen.dart';
import 'package:devotion/models/event.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/InteractionButtonWidget.dart';
import 'package:flutter/material.dart';

class CurvedPostItemWidget extends StatelessWidget {
  final String title;
  final String? time;
  final String? people;
  final IconData? icon;
  final Function()? onTap;
  final int? videoId;
  final VideoPost? video;

  CurvedPostItemWidget({
    required this.title,
    this.time,
    this.icon,
    this.people,
    this.onTap,
    this.video,
    this.videoId,
  });

  factory CurvedPostItemWidget.fromPost(Post video) {
    return CurvedPostItemWidget(
      title: video.name,
//      time: video.length.toString(),
//      video: video,
    );
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
//        Navigator.push(
//          context,
//          MaterialPageRoute(
//            builder: (context) => PlayerScreen(isVideo: true, playable: video),
//          ),
//        );
      },
      child: CurvedCornerWidget(
        padding: EdgeInsets.only(top: 70),
        borderColor: Color(0xffE7E4E9),
        color: Colors.white,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 40),
          height: 200,
          width: MediaQuery.of(context).size.width,
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: 36,
                child: Row(children: <Widget>[
                  ImageAvatarWidget(
                    imageURL: 'images/avatar1.jpg',
                    size: 36,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'John Brown',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
//                              color: Colors.white,
                              height: 19 / 16),
                        ),
                        Text(
                          '8 Nov',
                          style: TextStyle(
                              fontSize: 12,
//                              color: Color(0x90ffffff),
                              height: 15 / 12),
                        ),
                      ]),
                ]),
              ),
              SizedBox(height: 20),
              Text(
                'When one door of happiness closes, another opens, but often we look so long at the closed door that we do not see the one that has been opened for us. ',
                style: TextStyle(fontSize: 13, color: Color(0xff817889)),
              ),
              SizedBox(height: 20),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    InteractionButtonWidget(
                      icon: Icons.favorite,
                      active: false,
                      color: Color(0xff757575),
                      count: 1,
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    InteractionButtonWidget(
                      icon: Icons.message,
                      count: 0,
                      active: false,
                      color: Color(0xff757575),
                    ),
                    SizedBox(
                      width: 40,
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
