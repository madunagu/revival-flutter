import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/widgets/ErrorNotification.dart';
import 'package:devotion/widgets/ImageAvatarListWidget.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:flutter/material.dart';

import 'models/Event.dart';

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
  final int eventId;
  SingleEventScreen(this.eventId);
  @override
  _SingleEventScreenState createState() => _SingleEventScreenState();
}

class _SingleEventScreenState extends State<SingleEventScreen> {
  Event event = Event();

  @override
  void initState() {
    super.initState();
  }

  Future<Map<ResponseKey, dynamic>> getEvent() {
    NetworkingClass server = NetworkingClass();
    return server.get('/events/' + widget.eventId.toString());
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<ResponseKey, dynamic>>(
        future: getEvent(),
        builder: (
          context,
          AsyncSnapshot<Map<ResponseKey, dynamic>> snapshot,
        ) {
          if (snapshot.hasData) {
            if (snapshot.data[ResponseKey.type] == ResponseType.data) {
              var res = snapshot.data[ResponseKey.data]['data'];
              event = Event.fromJson(snapshot.data[ResponseKey.data]['data']);
              return AppScaffoldWidget(
                paddingTop: 55,
                appBar: EventAppBarWidget(event: event),
                body: SingleEvent(event: event),
              );
            } else {
              //TODO: add logic for failed event get
              return AppScaffoldWidget(
                paddingTop: 155,
                appBar: EventAppBarWidget(event: event),
                body: Center(child: Text('Failed')),
                error: ErrorNotification(
                  titleText: 'Loading Failed',
                  okText: 'Reload',
                  okTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => SingleEventScreen(widget.eventId),
                      ),
                    );
                  },
                  backTap: () {
                    Navigator.of(context).pop();
                  },
                ),
              );
            }
          } else {
            return AppScaffoldWidget(
              paddingTop: 155,
              appBar: EventAppBarWidget(event: event),
              body: Center(child: Text('Failed')),
              error: CircularProgressIndicator(),
            );
          }
        });
  }
}

class SingleEvent extends StatelessWidget {
  final Event event;
  SingleEvent({
    this.event,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            color: trendingColors[2],
            child: CurvedCornerWidget(
              padding: EdgeInsets.only(top: 120),
              color: Colors.white,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 35, vertical: 22),
                child: Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        SizedBox(width: 15),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.asset(
                            'images/avatar1.jpg',
                            height: 32,
                            width: 32,
                          ),
                        ),
                        SizedBox(
                          width: 16,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              event.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.14,
                              ),
                            ),
                            Text(
                              'Montreal, QC Private Group',
                              style: TextStyle(
                                color: Color(0x7A403249),
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                letterSpacing: -0.19,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AreYouGoing(isGoing: false),
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
                          'TODAY',
                          style: largeWhiteTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          '5:30 - 8:30',
                          style: smallWhiteTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'EVERY WEEK ON MONDAY',
                          style: smallWhiteTextStyle,
                        ),
                      ],
                    )
                  ],
                ),
                SizedBox(
                  height: 29,
                ),
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
                            '585 Saint Catherine Street West, Montreal Quebec Canada',
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
                ),
                SizedBox(
                  height: 29,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Icon(
                      Icons.credit_card,
                      color: Color(0xff757575),
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Flexible(
                      child: Text(
                        '\$ 21.00',
                        style: largeWhiteTextStyle,
                      ),
                    )
                  ],
                ),
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
                      'Hosted By Joe',
                      style: largeWhiteTextStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'New to Yoga, or looking to take your mat to practice in new places?',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color(0xff998fa2),
                    letterSpacing: -0.14,
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  'Get to know your local community and neighbours better by joining our Yoga family.',
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Container(
                                  height: 30,
//                                    width: 200,
                                  child: ImageAvatarListWidget(
                                    images: [
                                      'images/avatar1.jpg',
                                      'images/avatar1.jpg',
                                      'images/avatar1.jpg',
                                      'images/avatar1.jpg',
                                      'images/avatar1.jpg',
                                    ],
                                    size: 30,
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 1,
                                child: Text(
                                  '& 12 others',
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
                          ),
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

class AreYouGoing extends StatelessWidget {
  final bool isGoing;
  const AreYouGoing({Key key, this.isGoing}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20, top: 14, right: 14, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: isGoing ? Border.all(color: Color(0xffE7E4E9)) : null,
        color: isGoing ? Colors.white : Color(0xff352641),
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            child: Icon(
              Icons.open_in_browser,
              color: isGoing ? Color(0xff757575) : Color(0xff998fa2),
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
                  color: isGoing ? Colors.black : Colors.white,
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
              ? Container()
              : Container(
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
          Container(
            margin: EdgeInsets.symmetric(horizontal: 6),
            width: 40,
            height: 40,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: isGoing ? Color(0xff58B2BE) : Color(0xff594f62),
              borderRadius: BorderRadius.circular(50),
            ),
            child: Icon(
              Icons.check,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}
