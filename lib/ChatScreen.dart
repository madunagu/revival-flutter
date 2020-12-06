import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBarWidget(
        title: 'Live Chat',
      ),
      // floatingButton: ,
      paddingTop: 183,
      body: Container(
        child: Column(
          children: [
            ChatItemWidget(
              message: 'what is the best time to visit Rio De Janero',
              name: 'Beatrice',
              image: 'images/avatar1.jpg',
              isSender: true,
            ),
            ChatItemWidget(
              message:
                  'March is one of the best months to visit Rio. You can enjoy the beach and many attractions',
              name: 'Ryan',
              image: 'images/avatar1.jpg',
            ),
            ChatItemWidget(
              message: 'And what about carnival time',
              name: 'Beatrice',
              image: 'images/avatar1.jpg',
              isSender: true,
            ),
            ChatItemWidget(
              message:
                  'Oh Sure, late February of the first days of March, a reason why accomodation fetches its highest prices',
              name: 'Ryan',
              image: 'images/avatar1.jpg',
            ),
            ChatItemWidget(
              message: 'But is it safe?',
              name: 'Beatrice',
              image: 'images/avatar1.jpg',
              isSender: true,
            ),
            ChatItemWidget(
              message:
                  'Of course it\’s safe to visit, but visitors just have to have street smarts and their wits about them more so than in almost any other major city in the world. ',
              name: 'Ryan',
              image: 'images/avatar1.jpg',
            ),
            
          ],
        ),
      ),
    );
  }
}

class ChatItemWidget extends StatelessWidget {
  final String message;
  final String name;
  final String image;
  final bool isSender;

  ChatItemWidget({
    this.message,
    this.name,
    this.image,
    this.isSender = false,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.only(
        bottom: 34,
      ),
      child: Column(
        crossAxisAlignment:
            isSender ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment:
                isSender ? MainAxisAlignment.end : MainAxisAlignment.start,
            children: isSender
                ? [
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                    SizedBox(width: 18),
                    ImageAvatarWidget(
                      imageURL: 'images/avatar1.jpg',
                      size: 22,
                      borderColor: Color(0xff817889),
                      borderWidth: 2,
                    ),
                    SizedBox(
                      width: 24,
                    ),
                  ]
                : [
                    SizedBox(
                      width: 24,
                    ),
                    ImageAvatarWidget(
                      imageURL: 'images/avatar1.jpg',
                      size: 22,
                      borderColor: Color(0xff817889),
                      borderWidth: 2,
                    ),
                    SizedBox(width: 18),
                    Text(
                      name,
                      style: TextStyle(
                        fontSize: 13,
                        fontWeight: FontWeight.bold,
                        height: 1.3,
                      ),
                    ),
                  ],
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            width: size.width - 25,
            padding: isSender
                ? EdgeInsets.only(left: 20, top: 16, bottom: 18, right: 24)
                : EdgeInsets.only(right: 20, top: 16, bottom: 18, left: 24),
            decoration: BoxDecoration(
              borderRadius: isSender
                  ? BorderRadius.only(
                      topLeft: Radius.circular(80),
                      bottomLeft: Radius.circular(80),
                    )
                  : BorderRadius.only(
                      topRight: Radius.circular(80),
                      bottomRight: Radius.circular(80),
                    ),
              color: isSender ? Color(0xff8A56AC) : Color(0xff9599B3),
            ),
            child: Text(
              message,
              style: TextStyle(
                color: Colors.white,
                letterSpacing: -0.3,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
