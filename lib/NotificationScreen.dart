import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  Widget organiseStack({List<NotificationItem> children, double height}) {
    List<Widget> output = [];
    for (var i = 0; i < children.length; i++) {
      output.insert(
        0,
        Positioned(
          top: i * height,
          child: children[i],
        ),
      );
    }
    return Container(
      height: children.length * height + children[0].radius,
      child: Stack(
        children: output,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      bodyColor: Colors.white,
      appBar: AppBarWidget(
        color: Colors.white,
        title: 'Notifications',
      ),
      body: this.organiseStack(children: <NotificationItem>[
        NotificationItem(
          title: 'Everyday English, French, Spanish: Conversation with Joel',
          image: Image.asset('images/avatar1.jpg'),
          timeAgo: '8hrs',
          isSeen: false,
        ),
        NotificationItem(
          title: 'Everyday English, French, Spanish: Conversation with Joel',
          image: Image.asset('images/avatar1.jpg'),
          timeAgo: '8hrs',
          isSeen: false,
        ),
        NotificationItem(
          title: 'Everyday English, French, Spanish: Conversation with Joel',
          image: Image.asset('images/avatar1.jpg'),
          timeAgo: '8hrs',
        ),
        NotificationItem(
          title: 'Everyday English, French, Spanish: Conversation with Joel',
          image: Image.asset('images/avatar1.jpg'),
          timeAgo: '8hrs',
        ),
      ], height: 100),
    );
  }
}

class NotificationItem extends StatelessWidget {
  final String title;
  final Image image;
  final timeAgo;
  final double radius = 50;
  final bool isSeen;

  NotificationItem({
    Key key,
    this.title,
    this.image,
    this.timeAgo,
    this.isSeen = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedCornerWidget(
      padding: EdgeInsets.only(top: this.radius),
      radius: this.radius,
      color: isSeen ? Colors.white : Color(0xffd47fa6),
      borderColor: isSeen ? Color(0xffe7e4e9) : Color(0xffc67097),
      child: Container(
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
                        color: isSeen ? Colors.black : Colors.white,
                        fontSize: 14,
                        fontWeight: isSeen ? FontWeight.w500 : FontWeight.w700,
                        height: 1.42,
                        letterSpacing: -0.14),
                  ),
                  Text(
                    timeAgo,
                    style: TextStyle(
                        color: isSeen ? Color(0xff998fa2) : Color(0x88ffffff),
                        fontSize: 12,
                        fontWeight: FontWeight.w500,
                        letterSpacing: -0.19,
                        height: 1.5),
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
