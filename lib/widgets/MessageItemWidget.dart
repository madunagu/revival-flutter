import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';


class MessageItem extends StatelessWidget {
  final String message;
  final Image image;
  final timeAgo;
  final String name;
  final double radius = 60;
  final bool isSeen;

  MessageItem({
    Key key,
    this.message,
    this.image,
    this.timeAgo,
    this.name,
    this.isSeen = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CurvedCornerWidget(
      padding: EdgeInsets.only(top: this.radius),
      radius: this.radius,
      color: isSeen ? Color(0xff241332) : Color(0xff8A56AC),
      borderColor: isSeen ? Color(0xff352641) : Color(0x3d352641),
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 32, top: 30, right: 12, bottom: 13),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ImageAvatarWidget(
              imageURL: 'images/avatar1.jpg',
              borderWidth: isSeen ? 0 : 2,
            ),
            SizedBox(
              width: 24,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      color: isSeen ? Color(0xff998FA2) : Color(0xb2ffffff),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.16,
                      height: 1.125,
                    ),
                  ),
                  SizedBox(height: 6),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    text: TextSpan(
                      text: message,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontFamily: 'Montserrat',
                        fontWeight: isSeen ? FontWeight.w500 : FontWeight.w700,
                        height: 1.42,
                        letterSpacing: -0.14,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: 69,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    timeAgo,
                    style: TextStyle(
                      color: isSeen ? Color(0xff998FA2) : Color(0xb2ffffff),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                      letterSpacing: -0.16,
                      height: 1.125,
                    ),
                  ),
                  SizedBox(height: 6),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(30),
                    ),
                    // padding: EdgeInsets.all(4),
                    alignment: Alignment.center,
                    height: 22,
                    width: 22,
                    child: Text('4'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
