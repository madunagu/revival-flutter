import 'package:devotion/ProfileScreen.dart';
import 'package:devotion/models/User.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

class UserInfoWidget extends StatelessWidget {
  final User user;
  UserInfoWidget({this.user});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ProfileScreen(user: user)),
        );
      },
      child: Container(
        child: Row(
          children: [
            ImageAvatarWidget(
              size: 36,
              imageURL: user.avatar,
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
                  '${user.followerCount} followers',
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0x90352641),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
