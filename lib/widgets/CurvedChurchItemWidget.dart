import 'package:devotion/ChurchListScreen.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:devotion/models/user.dart';
import 'package:devotion/models/church.dart';
import 'package:devotion/models/event.dart';
import 'package:devotion/widgets/ImageAvatarListWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

final TextStyle italicStyle = const TextStyle(
  color: Color(0x70ffffff),
  letterSpacing: -0.24,
  fontSize: 12,
  fontWeight: FontWeight.w500,
  fontStyle: FontStyle.italic,
);

class CurvedChurchItemWidget extends StatelessWidget {
  final Church church;
  final Color? color;
  CurvedChurchItemWidget({required this.church, this.color = Colors.red});

  factory CurvedChurchItemWidget.fromChurch(Church church, Color color) {
    return CurvedChurchItemWidget(
      church: church,
      color: color,
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 200,
        color: color,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(
          left: 32,
        ),
        child: Stack(
          // overflow: Overflow.clip,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(
                    height: 32,
                  ),
                  // Text(
                  //   time,
                  //   style: TextStyle(
                  //     color: Color(0x70ffffff),
                  //     fontSize: 11,
                  //     letterSpacing: -0.22,
                  //     fontWeight: FontWeight.w600,
                  //   ),
                  // ),
                  RichText(
                    overflow: TextOverflow.ellipsis,
                    maxLines: 2,
                    text: TextSpan(
                      text: church.name,
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
                  church.likesCount > 0
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            ImageAvatarListWidget(
                              images: church.likes != null
                                  ? church.likes
                                      .take(7)
                                      .map((User e) => e.avatar)
                                      .toList()
                                  : [],
                              size: 24,
                            ),
                            SizedBox(width: 10),
                            Flexible(
                              child: Text(
                                church.likes != null
                                    ? 'Join ${church.likes.take(2).map((e) => e.name).join(", ")} and ${church.likesCount} others'
                                    : '..Be the first to join',
                                style: italicStyle,
                              ),
                            ),
                          ],
                        )
                      : Row(
                          children: [
                            ImageAvatarWidget(
                                imageURL: church.user.avatar, size: 24),
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
                Icons.house,
                size: 70,
                color: Color.fromARGB(50, 255, 255, 255),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
