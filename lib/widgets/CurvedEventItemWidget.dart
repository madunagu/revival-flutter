import 'dart:convert';
import 'dart:math';

import 'package:devotion/SingleEventScreen.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/models/event.dart';
import 'package:devotion/models/user.dart';
import 'package:devotion/util/Constants.dart';
import 'package:devotion/util/TimeHandler.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/ImageAvatarListWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

class CurvedEventItemWidget extends StatelessWidget {
  final Event event;
  final Color color;
  CurvedEventItemWidget({
    required this.event,
    required this.color,
  });

  factory CurvedEventItemWidget.fromEvent(Event event, Color color) {
    return CurvedEventItemWidget(
      event: event,
      color: color,
    );
  }
  final TextStyle italicStyle = const TextStyle(
    color: Color(0x70ffffff),
    letterSpacing: -0.24,
    fontSize: 12,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.italic,
  );
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SingleEventScreen(this.event),
          ),
        );
      },
      child: CurvedCornerWidget(
        padding: EdgeInsets.only(top: 70),
        color: this.color,
        child: Container(
          height: 200,
          width: MediaQuery.of(context).size.width,
          padding: EdgeInsets.only(
            left: 32,
          ),
          child: Stack(
            children: [
              Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 32,
                    ),
                    Text(
                      getRelativeTime(event.startingAt),
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
                        text: event.name,
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
                    event.attendeesCount > 0
                        ? Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: <Widget>[
                              ImageAvatarListWidget(
                                images: event.attendees != null
                                    ? event.attendees
                                        .take(7)
                                        .map((User e) => e.avatar)
                                        .toList()
                                    : [],
                                size: 24,
                              ),
                              SizedBox(width: 10),
                              Flexible(
                                child: Text(
                                  event.attendees != null
                                      ? 'Join ${event.attendees.take(2).map((e) => e.name).join(", ")} and ${event.attendeesCount} others'
                                      : '..Be the first to join',
                                  style: italicStyle,
                                ),
                              ),
                            ],
                          )
                        : Row(
                            children: [
                              ImageAvatarWidget(
                                  imageURL: event.user.avatar, size: 24),
                              SizedBox(width: 10),
                              Text(
                                '...Be the first to join?',
                                style: italicStyle,
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
                  Icons.event,
                  size: 70,
                  color: Color.fromARGB(50, 255, 255, 255),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
