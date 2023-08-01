import 'dart:convert';

import 'package:devotion/MusicPlayerScreen.dart';
import 'package:devotion/PlayerScreen.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/models/event.dart';
import 'package:devotion/util/TimeHandler.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/ImageAvatarListWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

import '../models/audio_post.dart';

class CurvedMusicItemWidget extends StatelessWidget {
  final AudioPost audio;
  final Color color;

  CurvedMusicItemWidget({required this.audio,required this.color});
  TextStyle italicStyle = const TextStyle(
    color: Color(0x70000000),
    letterSpacing: -0.24,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );
  double radius = 100;
  double disc = 100;
  double knot = 20;
  factory CurvedMusicItemWidget.fromAudio(AudioPost music, Color color) {
    return CurvedMusicItemWidget(
      audio: music,
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
            builder: (context) => MusicPlayerScreen(playable: audio),
          ),
        );
      },
      child: CurvedCornerWidget(
        padding: EdgeInsets.only(top: 70),
        color: Colors.white,
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            left: 32,
          ),
          child: Stack(
            children: [
              Positioned(
                right: 20,
                bottom: 40,
                child: Stack(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(radius),
                      child: Image.asset(
                        'images/avatar1.jpg',
                        width: disc,
                        height: disc,
                      ),
                    ),
                    Container(
                      width: disc,
                      height: disc,
                      alignment: Alignment.center,
                      child: Container(
                        width: knot,
                        height: knot,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            border: Border.all(color: color, width: 4)),
                      ),
                    )
                  ],
                ),
              ),
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      getRelativeTime(audio.createdAt),
                      style: TextStyle(
                        color: Color(0x70000000),
                        fontSize: 11,
                        letterSpacing: -0.22,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    RichText(
                      overflow: TextOverflow.ellipsis,
                      maxLines: 2,
                      text: TextSpan(
                        text: audio.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 24,
                          letterSpacing: -0.39,
                          height: 1.25,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Text(
                      '4:30',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 17,
                      ),
                    ),
                    Spacer(),
                    Row(
                      children: [
                        ImageAvatarWidget(
                            borderWidth: 0,
                            imageURL: audio.user.avatar,
                            size: 24),
                        SizedBox(width: 10),
                        Text(
                          audio.user.name,
                          style: italicStyle,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}

//
