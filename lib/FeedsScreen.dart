import 'package:devotion/widgets/DefaultAppBarWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/SingleScaffoldWidget.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleScaffoldWidget(
      title: DefaultAppBarWidget(
        color: Colors.white,
        title: 'Feeds',
        rightIcon: Icons.filter,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FeedItem(),
              FeedItem(),
              FeedItem(),
              FeedItem(),
              FeedItem(),
              FeedItem(),
              FeedItem(),
              FeedItem(),
            ],
          ),
        ),
      ),
    );
  }
}

class FeedItem extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 72,
            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
            width: MediaQuery.of(context).size.width,
            child: Row(children: <Widget>[
              ImageAvatarWidget(imageURL: 'images/avatar1.jpg'),
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
                      style: mediumTextStyle,
                    ),
                    Text(
                      '8 Nov',
                      style: smallTextStyle,
                    ),
                  ]),
            ]),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: 210,
            child: Stack(
              children: <Widget>[
                Positioned(
                  top: 0,
                  left: 0,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(60),
                        bottomRight: Radius.circular(60)),
                    child: Container(
                      height: 210,
                      width: (MediaQuery.of(context).size.width - 24),
                      child: Image.asset(
                        'images/avatar1.jpg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  left: 0,
                  width: MediaQuery.of(context).size.width,
                  height: 105,
                  child: Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.5),
                        ],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: 15,
                  left: 0,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 32,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        InteractionButtonWidget(),
                        SizedBox(
                          width: 22,
                        ),
                        InteractionButtonWidget(),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 210 / 2 - 50 / 2,
                  left: (MediaQuery.of(context).size.width / 2) - 50 / 2,
                  width: 50,
                  height: 50,
                  child: Icon(
                    Icons.play_circle_filled,
                    size: 50,
                    color: Colors.white,
                  ),
                ),
                Positioned(
                  left: 0,
                  bottom: 40,
                  child: Container(
                    padding: EdgeInsets.all(8),
                    child: Text('this is a caption for the image', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class InteractionButtonWidget extends StatelessWidget {
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
          Icon(Icons.favorite, color: Colors.white, size: 17),
        ],
      ),
    );
  }
}
