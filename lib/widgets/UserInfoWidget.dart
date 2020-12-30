import 'package:devotion/models/User.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final User user;
  UserInfoWidget({this.user});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          ImageAvatarWidget(
            size: 36,
            imageURL: 'images/avatar1.jpg',
          ),
          SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                user.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Color(0xff241332),
                ),
              ),
              Text(
                '20 followers',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0x90352641),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
