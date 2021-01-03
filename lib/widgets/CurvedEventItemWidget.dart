import 'dart:convert';

import 'package:devotion/SingleEventScreen.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/models/Event.dart';
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
    this.event,
    this.color,
  });

  factory CurvedEventItemWidget.fromEvent(Event event, Color color) {
    return CurvedEventItemWidget(
      event: event,
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
              builder: (context) => SingleEventScreen(this.event)),
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
          child: Column(
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
                            images: event.attendees
                                .getRange(0, 7)
                                .map((e) => e.avatar),
                            size: 24,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            'Join ${event.attendees.getRange(0, 2).map((e) => e.name).join(", ")} and ${event.attendeesCount} others',
                            style: TextStyle(
                              color: Color(0x70ffffff),
                              letterSpacing: -0.24,
                              fontSize: 12,
                              fontWeight: FontWeight.w500,
                              fontStyle: FontStyle.italic,
                            ),
                          ),
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 40,
                ),
              ]),
        ),
      ),
    );
  }
}
