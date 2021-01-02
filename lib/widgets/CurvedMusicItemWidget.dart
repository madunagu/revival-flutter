import 'dart:convert';

import 'package:devotion/PlayerScreen.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/models/Event.dart';
import 'package:devotion/models/index.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/ImageAvatarListWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

class CurvedMusicItemWidget extends StatelessWidget {
  final String title;
  final String time;
  final String people;
  final IconData icon;
  final Function onTap;
  final Color color;
  final int audioId;

  CurvedMusicItemWidget(
      {this.title,
      this.audioId,
      this.time,
      this.color,
      this.icon,
      this.people,
      this.onTap});

  factory CurvedMusicItemWidget.fromAudio(AudioPost music,Color color) {
    return CurvedMusicItemWidget(
      title: music.name,
      time: music.length.toString(),
      color: color,
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PlayerScreen(),
          ),
        );
      },
      child: CurvedCornerWidget(
        padding: EdgeInsets.only(top: 70,left: 32),
        height: 270,
        color: this.color,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          overflow: Overflow.clip,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 32,
                  ),
                  Text(
                    time,
                    style: TextStyle(
                      color: Color(0x70ffffff),
                      fontSize: 11,
                      letterSpacing: -0.22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    text: TextSpan(
                      text: title,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: -0.39,
                        height: 1.25,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ImageAvatarListWidget(
                        images: [
                          'images/avatar1.jpg',
                          'images/avatar1.jpg',
                        ],
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Join Marie, John and 10 others',
                        style: TextStyle(
                          color: Color(0x70ffffff),
                          letterSpacing: -0.24,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                ]),
            Positioned(
              right: 40,
              bottom: 50,
              child: Icon(
                Icons.headset,
                size: 70,
                color: Color.fromARGB(50, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
