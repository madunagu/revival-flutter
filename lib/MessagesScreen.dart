import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/MessageItemWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MessagesScreen extends StatelessWidget {
  Widget organiseStack({required List<MessageItem> children, required double height}) {
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
      paddingTop: 93,
      appBar: AppBarWidget(
        color: Colors.white,
        borderColor: Colors.transparent,
        title: 'Messages',
      ),
      body: this.organiseStack(
        children: <MessageItem>[
          MessageItem(
            message: 'Welcome to yoga meetup',
            image: Image.asset('images/avatar1.jpg'),
            timeAgo: '9hrs',
            isSeen: false,
            name: 'Dinar Meyer',
          ),
          MessageItem(
            message: 'Hi everyone',
            image: Image.asset('images/avatar1.jpg'),
            timeAgo: '9hrs',
            isSeen: false,
            name: 'Dinar Meyer',
          ),
          MessageItem(
            message: 'Check out this meetup with',
            image: Image.asset('images/avatar1.jpg'),
            timeAgo: 'Aug 19',
            name: 'Stephen Moreau',
          ),
          MessageItem(
            message: 'Welcome to Kizomba meetup',
            image: Image.asset('images/avatar1.jpg'),
            timeAgo: 'Jun 21',
            name: 'Andy Lane',
          ),
          MessageItem(
            message: 'Feb 13',
            image: Image.asset('images/avatar1.jpg'),
            timeAgo: '8hrs',
            name: 'Anson Buck',
          ),
          MessageItem(
            message: 'Bonjour',
            image: Image.asset('images/avatar1.jpg'),
            timeAgo: 'Sep 18, 2017',
            name: 'Dinar Meyer',
          ),
        ],
        height: 90,
      ),
    );
  }
}
