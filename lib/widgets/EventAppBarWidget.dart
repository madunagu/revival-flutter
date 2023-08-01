import 'package:devotion/ChurchScreen.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/models/user.dart';
import 'package:devotion/util/Constants.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/ImageAvatarListWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/LinearProgressWidget.dart';
import 'package:flutter/material.dart';

import '../models/church.dart';
import '../models/devotional.dart';
import '../models/event.dart';

class EventAppBarWidget extends StatelessWidget {
  const EventAppBarWidget({
    Key? key,
    required this.event,
    required this.isLoading,
  }) : super(key: key);

  final Event event;
  final bool isLoading;

  factory EventAppBarWidget.fromDevotional(
      {required Devotional devotional, bool isLoading=true}) {
    Event event = Event(
      name: devotional.title,
      attendees: devotional.devotees,
      attendeesCount: devotional.devoteesCount,
    );
    return EventAppBarWidget(event: event, isLoading: isLoading);
  }

  factory EventAppBarWidget.fromChurch({required Church church, bool isLoading=true}) {
    Event event = Event(
      name: church.name,
      attendeesCount: church.likesCount,
    );
    //TODO: add list of users who liked church to server and model
    // event.attendees = church.;


    return EventAppBarWidget(event: event, isLoading: isLoading);
  }

  @override
  Widget build(BuildContext context) {
    return CurvedCornerWidget(
      height: 248,
      color: trendingColors[0],
      padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          isLoading ? LinearProgressWidget() : Container(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            mainAxisSize: MainAxisSize.max,
            children: <Widget>[
              InkWell(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
              ),
              InkWell(
                onTap: () {},
                child: Icon(
                  Icons.file_upload,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0, left: 56, right: 4),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (event.name != null) ? event.name : '',
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.39,
                  ),
                ),
                SizedBox(height: 21),
                event.attendees != null && event.attendees.isNotEmpty
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          ImageAvatarListWidget(
                            images: event.attendees
                                .take(7)
                                .map((User e) => e.avatar)
                                .toList(),
                            size: 24,
                          ),
                          SizedBox(width: 10),
                          Flexible(
                            child: event.attending == 1
                                ? Text(
                                    'You Are Going',
                                    style: italicStyle,
                                  )
                                : Text(
                                    event.attendeesCount > 1
                                        ? 'Join ${event.attendees.take(2).map((e) => e.name).join(", ")} and ${event.attendeesCount - 1} others'
                                        : 'Join ${event.attendees.take(2).map((e) => e.name).join(", ")}',
                                    style: italicStyle,
                                  ),
                          ),
                        ],
                      )
                    : Row(
                        children: [
                          ImageAvatarWidget(
                            imageURL: event.user?.avatar ?? AVATAR_URL,
                            size: 24,
                          ),
                          SizedBox(width: 10),
                          Text(
                            '...Be the first to join?',
                            style: italicStyle,
                          ),
                        ],
                      ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
