import 'dart:convert';

import 'package:devotion/PlayerScreen.dart';
import 'package:devotion/models/Event.dart';
import 'package:devotion/models/VideoPost.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/util/TimeHandler.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/InteractionButtonWidget.dart';
import 'package:flutter/material.dart';

class CurvedVideoItemWidget extends StatelessWidget {
//  final String title;
//  final String time;
//  final String people;
//  final IconData icon;
//  final Function onTap;
//  final int videoId;
  final VideoPost video;

  CurvedVideoItemWidget({
    this.video,
  });

  factory CurvedVideoItemWidget.fromVideo(VideoPost video) {
    return CurvedVideoItemWidget(
      video: video,
    );
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayerScreen(playable: video),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: video.images != null
                  ? NetworkImage(video.images[0].mediumUrl)
                  : AssetImage('images/photo.png'),
              fit: BoxFit.cover),
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(70),
          ),
        ),
        height: 270,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          overflow: Overflow.clip,
          children: [
            Positioned(
              top: 110,
              child: Container(
                height: 36,
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.of(context).size.width,
                child: Row(children: <Widget>[
                  ImageAvatarWidget(
                    imageURL: video.user.avatar,
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
                          video.user.name,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 19 / 16),
                        ),
                        Text(
                          getRelativeTime(video.createdAt),
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0x90ffffff),
                              height: 15 / 12),
                        ),
                      ]),
                ]),
              ),
            ),
            Positioned(
              bottom: 33,
              left: 0,
              width: size.width,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    InteractionButtonWidget(
                      icon: Icons.favorite,
                      count: video.likesCount,
                      active: video.liked == 1,
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    InteractionButtonWidget(
                      icon: Icons.message,
                      count: video.commentsCount,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 65,
              left: (size.width / 2) - 50 / 2,
              width: 50,
              height: 50,
              child: Icon(
                Icons.play_circle_filled,
                size: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
