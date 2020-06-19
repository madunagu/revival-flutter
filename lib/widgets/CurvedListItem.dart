import 'package:devotion/models/Event.dart';
import 'package:devotion/widgets/ImageAvatarListWidget.dart';
import 'package:flutter/material.dart';

class CurvedListItem extends StatelessWidget {
  final String title;
  final String time;
  final String people;
  final IconData icon;
  final Function onTap;

  CurvedListItem(
      {this.title,
      this.time,
      this.icon,
      this.people,
      this.onTap});

  factory CurvedListItem.fromEvent(Event serverEvent) {
    return CurvedListItem(
      title: serverEvent.name,
      time: serverEvent.startingAt.toString(),
    );
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 200,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(left: 32, top: 32),
        child: Stack(
          
          overflow: Overflow.clip,
          children: [
            Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    time,
                    style: TextStyle(
                      color: Color(0x70ffffff),
                      fontSize: 11,
                      letterSpacing: -0.22,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    title,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      letterSpacing: -0.39,
                      height: 1.25,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      ImageAvatarListWidget(
                        images: [
                          'images/avatar1.jpg',
                          'images/avatar1.jpg',
                        ],
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'Join Marie, John and 10 others',
                        style: TextStyle(
                          color: Color(0x70ffffff),
                          letterSpacing: -0.24,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                          fontStyle: FontStyle.italic,
                        ),
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
                icon,
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
