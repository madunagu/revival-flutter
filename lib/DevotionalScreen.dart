import 'dart:developer';

import 'package:devotion/SingleEventScreen.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/models/Devotional.dart';
import 'package:devotion/util/NetworkingClass.dart';
import 'package:devotion/util/TimeHandler.dart';
import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/ImageAvatarListWidget.dart';
import 'package:flutter/material.dart';

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

class DevotionalScreen extends StatefulWidget {
  final Devotional devotional;
  const DevotionalScreen({this.devotional});
  @override
  _DevotionalScreenState createState() => _DevotionalScreenState();
}

class _DevotionalScreenState extends State<DevotionalScreen> {
  Devotional devotional;

  @override
  void initState() {
    devotional = widget.devotional;
    getDevotional();
    super.initState();
  }

  Future<void> getDevotional() async {
    try {
      Map<String, dynamic> res = await NetworkingClass()
          .get('/devotionals/' + widget.devotional.id.toString());
      devotional = Devotional.fromJson(res);
    } catch (_) {
      log(_.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: EventAppBarWidget.fromDevotional(
        devotional: devotional,
        isLoading: false,
      ),
      paddingTop: 55,
      body: DevotionalWidget(devotional: devotional),
    );
  }
}

class DevotionalWidget extends StatelessWidget {
  final Devotional devotional;
  DevotionalWidget({
    this.devotional,
  });

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
                            devotional.poster.images != null
                                ? devotional.poster.images[0].medium
                                : 'images/avatar1.jpg',
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
                                devotional.poster.name,
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.14,
                                ),
                              ),
                              Text(
                                devotional.posterType.toUpperCase(),
                                style: TextStyle(
                                  color: Color(0x7A403249),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.19,
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    AreYouGoing(
                        isDevoted: devotional.devoted == 1,
                        devotional: devotional),
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
                          getRelativeTime(devotional.day),
                          style: largeWhiteTextStyle,
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'DAILY DEVOTIONAL',
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
                      Icons.clean_hands,
                      color: Color(0xff757575),
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Memory Verse',
                      style: largeWhiteTextStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  devotional.openingPrayer != null
                      ? devotional.openingPrayer
                      : '',
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
                      Icons.clean_hands,
                      color: Color(0xff757575),
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Memory Verse',
                      style: largeWhiteTextStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  devotional.memoryVerse != null ? devotional.memoryVerse : '',
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
                      Icons.clean_hands,
                      color: Color(0xff757575),
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Body',
                      style: largeWhiteTextStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  devotional.body != null ? devotional.body : '',
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
                      Icons.clean_hands,
                      color: Color(0xff757575),
                      size: 20,
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Text(
                      'Closing Prayer',
                      style: largeWhiteTextStyle,
                    )
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  devotional.closingPrayer != null
                      ? devotional.closingPrayer
                      : '',
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
                          devotional.devoteesCount > 0
                              ? Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 30,
//                                    width: 200,
                                        child: ImageAvatarListWidget(
                                          images: devotional.devotees
                                              .getRange(0, 7)
                                              .map((e) => e.avatar),
                                          size: 30,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                      flex: 1,
                                      child: Text(
                                        devotional.devoteesCount > 7
                                            ? '& ${devotional.devoteesCount} others'
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
                              : Container(child: Text('be the first to start')),
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
  final bool isDevoted;
  final Devotional devotional;
  const AreYouGoing({Key key, this.isDevoted, @required this.devotional})
      : super(key: key);

  @override
  _AreYouGoingState createState() => _AreYouGoingState();
}

class _AreYouGoingState extends State<AreYouGoing> {
  bool isDevoted;
  devote() async {
    setState(() {
      this.isDevoted = true;
    });
    Map<String, dynamic> liked = await NetworkingClass()
        .post('/devotionals/' + widget.devotional.id.toString(), {'val': true});
    var res = liked['data'];
    if (res == true) {
      //already set
    } else {
      setState(() {
        this.isDevoted = false;
      });
      //handle liking error

    }
  }

  unDevote() async {
    setState(() {
      this.isDevoted = false;
    });
    Map<String, dynamic> liked = await NetworkingClass().post(
        '/devotionals/' + widget.devotional.id.toString(), {'value': false});
    var res = liked['data'];
    if (res == true) {
      //already done
    } else {
      setState(() {
        this.isDevoted = true;
      });
    }
  }

  @override
  initState() {
    isDevoted = widget.isDevoted;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 27, top: 14, right: 5, bottom: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(50),
        border: isDevoted ? null : Border.all(color: Color(0xffE7E4E9)),
        color: isDevoted ? Color(0xff352641) : Colors.white,
      ),
      child: Row(
        children: <Widget>[
          InkWell(
            child: Icon(
              Icons.open_in_browser,
              size: 24,
              color: isDevoted ? Color(0xff998fa2) : Color(0xff757575),
            ),
          ),
          SizedBox(
            width: 16,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                isDevoted ? 'You are going' : 'Are you going?',
                style: TextStyle(
                  color: isDevoted ? Colors.white : Colors.black,
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
          isDevoted
              ? GestureDetector(
                  onTap: unDevote,
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
            onTap: devote,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 6),
              width: 40,
              height: 40,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: isDevoted ? Color(0xff594f62) : Color(0xff58B2BE),
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
