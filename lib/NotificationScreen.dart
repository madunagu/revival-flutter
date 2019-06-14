import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/DefaultAppBarWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';
import 'package:devotion/widgets/SingleScaffoldWidget.dart';

class NotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleScaffoldWidget(
      bodyColor: Colors.white,
      titleColor: Colors.white,
      title: DefaultAppBarWidget(
        color: Colors.white,
        title: 'Notifications',
      ),
      body: Column(
        children: <Widget>[
          NotificationItem(
              title:
                  'Everyday English, French, Spanish: Conversation with Joel',
              image: Image.asset('images/avatar1.jpg'),
              timeAgo: '8hrs',
              isSeen: false),
          NotificationItem(
              title:
                  'Everyday English, French, Spanish: Conversation with Joel',
              image: Image.asset('images/avatar1.jpg'),
              timeAgo: '8hrs',
              isSeen: false),
          NotificationItem(
              title:
                  'Everyday English, French, Spanish: Conversation with Joel',
              image: Image.asset('images/avatar1.jpg'),
              timeAgo: '8hrs',
              isSeen: false),
          NotificationItem(
              title:
                  'Everyday English, French, Spanish: Conversation with Joel',
              image: Image.asset('images/avatar1.jpg'),
              timeAgo: '8hrs',
              isSeen: false),
          NotificationItem(
              title:
                  'Everyday English, French, Spanish: Conversation with Joel',
              image: Image.asset('images/avatar1.jpg'),
              timeAgo: '8hrs',
              isSeen: false),
          NotificationItem(
              title:
                  'Everyday English, French, Spanish: Conversation with Joel',
              image: Image.asset('images/avatar1.jpg'),
              timeAgo: '8hrs',
              isSeen: false),
        ],
      ),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final Image image;
  final timeAgo;
  final bool isSeen;

  NotificationItem({Key key, this.title, this.image, this.timeAgo, this.isSeen})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedCornerWidget(
      color: Colors.white,
      child: Container(
        decoration: BoxDecoration(
          // borderRadius: BorderRadius.only(
          //   bottomLeft: Radius.circular(80),
          // ),
          border: BorderDirectional(
            end: BorderSide(
              color: Color.fromARGB(255, 231, 228, 233),
            ),
            bottom: BorderSide(
              color: Color.fromARGB(255, 231, 228, 233),
            ),
          ),
        ),
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 32, top: 30, right: 12, bottom: 13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageAvatarWidget(imageURL: 'images/avatar1.jpg'),
            SizedBox(
              width: 24,
            ),
            Expanded(
              flex: 5,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                        // color: Colors.white,
                        fontSize: 14,
                        //     fontWeight: FontWeight.w700,
                        height: 1.42,
                        letterSpacing: -0.14),
                  ),
                  Opacity(
                    opacity: 0.5,
                    child: Text(
                      timeAgo,
                      style: TextStyle(
                          fontSize: 12, letterSpacing: -0.19, height: 1.5),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
