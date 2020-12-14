import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:flutter/material.dart';

class ActivitiesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBarWidget(
        title: 'Activities',
        // subTitle: 'Find your people and do your thing',
        // imageURL: 'images/avatar1.jpg',
      ),
      paddingTop: 207,
      bodyColor: Color(0xff241332),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HorizontalCardGroup(),
          HorizontalCardGroup(),
          HorizontalCardGroup(),
          HorizontalCardGroup(),
        ],
      ),
    );
  }
}

class HorizontalCardGroup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.only(left: 24),
          child: Text(
            'Cuts',
            style: TextStyle(color: Colors.white, fontSize: 18),
          ),
        ),
        HorizontalList(
          cards: [
            HorizontalListItem(),
            HorizontalListItem(),
            HorizontalListItem(),
            HorizontalListItem(),
            HorizontalListItem(),
            HorizontalListItem(),
            HorizontalListItem(),
          ],
        ),
        SizedBox(height: 51),
      ],
    );
  }
}

class HorizontalList extends StatelessWidget {
  final List<Widget> cards;
  final double width;
  HorizontalList({this.cards = const [], this.width = 219});
  @override
  Widget build(BuildContext context) {
    List<Widget> imageAvatars = [];
    for (var i = 0; i < this.cards.length; i++) {
      imageAvatars.add(
        Positioned(
          width: this.width,
          child: cards[i],
          left: this.width * 169 / 219 * i,
        ),
      );
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Container(
        padding: EdgeInsets.only(top: 16, left: 24),
        width: this.width * 169 / 219 * this.cards.length + 70,
        height: 188,
        child: Stack(
          overflow: Overflow.clip,
          children: imageAvatars,
        ),
      ),
    );
  }
}

class HorizontalListItem extends StatelessWidget {
  final String image;
  const HorizontalListItem({
    this.image = 'images/avatar1.jpg',
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(40),
          bottomLeft: Radius.circular(10),
        ),
        border: Border.all(color: Color(0xff241332), width: 1.5),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(38.5),
          bottomLeft: Radius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 217,
              height: 110,
              fit: BoxFit.cover,
            ),
            Container(
              width: 217,
              height: 62,
              padding: EdgeInsets.only(left: 20, top: 14),
              color: Color(0xff352641),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Relieve Stress',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      height: 19 / 14,
                    ),
                  ),
                  Text(
                    '1 hour',
                    style: TextStyle(
                        color: Colors.white, fontSize: 11, height: 15 / 11),
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
