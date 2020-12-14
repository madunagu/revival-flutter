import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/ImageAvatarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:devotion/misc/StyleConstants.dart';
import 'package:flutter/material.dart';

class FeedsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBarWidget(
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
                      bottomRight: Radius.circular(60),
                    ),
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
                  width: MediaQuery.of(context).size.width - 24,
                  height: 105,
                  child: ClipRRect(
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(60),
                    ),
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
                        InteractionButtonWidget(icon: Icons.favorite,count: 255),
                        SizedBox(
                          width: 22,
                        ),
                        InteractionButtonWidget(icon: Icons.favorite,count: 255),
                      ],
                    ),
                  ),
                ),
                Positioned(
                  bottom: 210 / 2, //- 50 / 2,
                  left: (MediaQuery.of(context).size.width / 2) - 12 - 50 / 2,
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
                  bottom: 50,
                  child: Container(
                    padding: EdgeInsets.only(left: 32, right: 56),
                    child: RichText(
                      maxLines: 2,
                      text: TextSpan(
                        text:
                            'This is a caption for the image whateer the title',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontFamily: 'Montserrat',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
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
  final IconData icon;
  final int count;
  final bool active;
  final Function onTap;
  InteractionButtonWidget({this.icon, this.count, this.onTap, this.active=false});
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Text(
            count.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Icon(icon, color: active ? Colors.red : Colors.white, size: 17),
        ],
      ),
    );
  }
}
