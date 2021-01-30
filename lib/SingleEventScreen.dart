import 'dart:developer';

import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/util/TimeHandler.dart';
import 'package:devotion/widgets/ErrorNotification.dart';
import 'package:devotion/widgets/ImageAvatarListWidget.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:flutter/material.dart';

import 'package:devotion/models/Event.dart';

var smallTextSyle = TextStyle(color: Colors.grey, fontSize: 12);
var largeWhiteTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.14);
var smallWhiteTextStyle = TextStyle(
    color: Color(0xff998fa2),
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.19);

class SingleEventScreen extends StatefulWidget {
  @required
  final Event event;
  SingleEventScreen(this.event);
  @override
  _SingleEventScreenState createState() => _SingleEventScreenState();
}

class _SingleEventScreenState extends State<SingleEventScreen> {
  Event event;

  @override
  void initState() {
    event = widget.event;
    super.initState();
  }

  Future<Map<ResponseKey, dynamic>> getEvent() {
    try {
      return NetworkingClass().get('/events/' + widget.event.id.toString());
    } catch (_) {
      log(_.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: EventAppBarWidget(event: event),
      paddingTop: 55,
      body: SingleEvent(event: event),
    );
  }
}

class SingleEvent extends StatelessWidget {
  final Event event;
  SingleEvent({
    this.event,
  });

  String getEventTimes() {
    String times = '';
    if (this.event.startingAt != null) {
      times += event.startingAt.hour.toString() +
          ':' +
          event.startingAt.minute.toString();
    }
    if (this.event.endingAt != null) {
      times += ' - ' +
          event.endingAt.hour.toString() +
          ':' +
          event.endingAt.minute.toString();
    }
    return times;
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: trendingColors[2],
            child: CurvedCornerWidget(
              padding: EdgeInsets.only(top: 214),
              color: Colors.white,
              child: Container(
                width: size.width,
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 22),
                child: Column(
                  children: <Widget>[
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(width: 18),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(
                            event.poster != null
                                ? event.poster.profileMedia != null
                                    ? event.poster.profileMedia.logoUrl
                                    : 'defaultlogo'
                                : event.user.avatar,
                            height: 35,
                            width: 35,
                          ),
                        ),
                        SizedBox(
                          width: 14,
                        ),
                        Container(
                          width: size.width - 70 - 67,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                event.poster != null
                                    ? event.poster.name
                                    : event.user.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.14,
                                ),
                              ),
                              event.poster != null
                                  ? Text(
                                      event.poster.addresses != null
                                          ? event.poster.addresses[0].city +
                                              event.poster.addresses[0].state +
                                              ' '
                                          : '' +
                                              'Montreal, QC' +
                                              event.posterType,
                                      style: TextStyle(
                                        color: Color(0x7A403249),
                                        fontSize: 12,
                                        fontWeight: FontWeight.w500,
                                        letterSpacing: -0.19,
                                      ),
                                    )
                                  : Container(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AreYouGoing(isGoing: event.attending == 1, event: event),
                  ],
                ),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.only(left: 23, top: 20, right: 40),
            color: trendingColors[2],
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.access_time,
                      color: Colors.white,
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          getRelativeTime(event.startingAt),
                          style: largeWhiteTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          getEventTimes(),
                          style: smallWhiteTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'SINGLE OCCURENCE EVENT',
                          style: smallWhiteTextStyle,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 29,
                ),
                (event.addresses != null)
                    ? Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Icon(
                            Icons.location_on,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Flexible(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  event.addresses[0].address1,
                                  style: largeWhiteTextStyle,
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  '${event.addresses[0].address2} ${event.addresses[0].city}, ${event.addresses[0].state} ${event.addresses[0].country}',
                                  style: smallWhiteTextStyle,
                                ),
                                SizedBox(
                                  height: 18,
                                ),
                                ClipRRect(
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(40),
                                      bottomLeft: Radius.circular(40)),
                                  child: Container(
                                    height: 116,
                                    width: double.infinity,
                                    child: Image.asset(
                                      'images/avatar1.jpg',
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )
                    : Container(),
                SizedBox(
                  height: 29,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.person_outline,
                      color: Color(0xff757575),
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Hosted By ${event.user.name}',
                      style: largeWhiteTextStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  event.description != null ? event.description : '',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff998fa2),
                    letterSpacing: -0.14,
                  ),
                ),
                SizedBox(
                  height: 29,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.chat_bubble_outline,
                      color: Color(0xff757575),
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Live Chats',
                            style: largeWhiteTextStyle,
                          ),
                          SizedBox(
                            height: 9,
                          ),
                          event.attendeesCount > 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 30,
//                                    width: 200,
                                        child: ImageAvatarListWidget(
                                          images: event.attendees
                                              .getRange(0, 7)
                                              .map((e) => e.avatar),
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        event.attendeesCount > 7
                                            ? '& ${event.attendeesCount} others'
                                            : ' Group chat',
                                        style: TextStyle(
                                          fontStyle: FontStyle.italic,
                                          fontWeight: FontWeight.w500,
                                          color: Color(0xB0ffffff),
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 18,
                                    ),
                                  ],
                                )
                              : Container(
                                  child: Text('be the first to attend')),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AreYouGoing extends StatefulWidget {
  final bool isGoing;
  final Event event;
  const AreYouGoing({Key key, this.isGoing, @required this.event})
      : super(key: key);

  @override
  _AreYouGoingState createState() => _AreYouGoingState();
}

class _AreYouGoingState extends State<AreYouGoing> {
  bool isGoing;
  attendEvent() async {
    setState(() {
      this.isGoing = true;
    });
    Map<ResponseKey, dynamic> liked = await NetworkingClass()
        .post('/events/' + widget.event.id.toString(), {'val': true});
    if (liked[ResponseKey.type] == ResponseType.data) {
      var res = liked[ResponseKey.data]['data'];
      if (res == true) {
        //already set
      } else {
        setState(() {
          this.isGoing = false;
        });
        //handle liking error
      }
    }
  }

  absentEvent() async {
    setState(() {
      this.isGoing = false;
    });
    Map<ResponseKey, dynamic> liked = await NetworkingClass()
        .post('/events/' + widget.event.id.toString(), {'value': false});
    if (liked[ResponseKey.type] == ResponseType.data) {
      var res = liked[ResponseKey.data]['data'];
      if (res == true) {
        //already done
      } else {
        setState(() {
          this.isGoing = true;
        });
      }
    }
  }

  @override
  initState() {
    isGoing = widget.isGoing;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 27, top: 14, right: 5, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: isGoing ? null : Border.all(color: Color(0xffE7E4E9)),
        color: isGoing ? Color(0xff352641) : Colors.white,
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            child: Icon(
              Icons.open_in_browser,
              size: 24,
              color: isGoing ? Color(0xff998fa2) : Color(0xff757575),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                isGoing ? 'You are going' : 'Are you going?',
                style: TextStyle(
                  color: isGoing ? Colors.white : Colors.black,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.14,
                ),
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                'Edit',
                style: smallTextSyle,
              )
            ],
          ),
          Spacer(),
          isGoing
              ? GestureDetector(
                  onTap: absentEvent,
                  child: Container(
                    width: 40,
                    height: 40,
                    margin: EdgeInsets.symmetric(horizontal: 6),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      color: Color(0xff594f62),
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: Icon(
                      Icons.cancel,
                      color: Colors.white,
                    ),
                  ),
                )
              : Container(),
          GestureDetector(
            onTap: attendEvent,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isGoing ? Color(0xff594f62) : Color(0xff58B2BE),
                borderRadius: BorderRadius.circular(50),
              ),
              child: Icon(
                Icons.check,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventAppBarWidget extends StatelessWidget {
  const EventAppBarWidget({
    Key key,
    @required this.event,
  }) : super(key: key);

  final Event event;

  @override
  Widget build(BuildContext context) {
    return CurvedCornerWidget(
      color: trendingColors[0],
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
        child: Column(
          children: <Widget>[
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
              child: Text(
                (event.name != null) ? event.name : '',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.39,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
