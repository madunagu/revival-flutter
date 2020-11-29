import 'package:devotion/VideoPlayerScreen.dart';
import 'package:devotion/models/Event.dart';
import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

class CurvedVideoItemWidget extends StatelessWidget {
  final String title;
  final String time;
  final String people;
  final IconData icon;
  final Function onTap;
  final int videoId;

  CurvedVideoItemWidget(
      {this.title, this.time, this.icon, this.people, this.onTap,this.videoId});

  factory CurvedVideoItemWidget.fromEvent(Event serverEvent) {
    return CurvedVideoItemWidget(
      title: serverEvent.name,
      time: serverEvent.startingAt.toString(),
    );
  }
  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => VideoPlayerScreen(this.videoId)),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/avatar1.jpg'), fit: BoxFit.cover),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(70)),
        ),
        height: 270,
        width: MediaQuery.of(context).size.width,
        child: Stack(
          overflow: Overflow.clip,
          children: [
            Positioned(
              top: 110,
              child: Container(
                height: 36,
                padding: EdgeInsets.symmetric(horizontal: 40),
                width: MediaQuery.of(context).size.width,
                child: Row(children: <Widget>[
                  ImageAvatarWidget(
                    imageURL: 'images/avatar1.jpg',
                    size: 36,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'John Brown',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              height: 19 / 16),
                        ),
                        Text(
                          '8 Nov',
                          style: TextStyle(
                              fontSize: 12,
                              color: Color(0x90ffffff),
                              height: 15 / 12),
                        ),
                      ]),
                ]),
              ),
            ),
            Positioned(
              bottom: 33,
              left: 0,
              width: size.width,
              child: Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    InteractionButtonWidget(
                      icon: Icons.favorite,
                      isSelected: false,
                    ),
                    SizedBox(
                      width: 22,
                    ),
                    InteractionButtonWidget(
                      icon: Icons.message,
                      isSelected: false,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              bottom: 65,
              left: (size.width / 2) - 50 / 2,
              width: 50,
              height: 50,
              child: Icon(
                Icons.play_circle_filled,
                size: 50,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class InteractionButtonWidget extends StatelessWidget {
  final IconData icon;
  final bool isSelected;
  InteractionButtonWidget({this.icon, this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            '256',
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w700, fontSize: 12),
          ),
          SizedBox(
            width: 6,
          ),
          Icon(this.icon,
              color: isSelected ? Colors.red : Colors.white, size: 17),
        ],
      ),
    );
  }
}
