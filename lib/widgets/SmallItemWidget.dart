import 'package:devotion/models/AudioPost.dart';
import 'package:flutter/material.dart';

class SmallItemWidget extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String amount;
  final bool isActive;
  final double textWidth;

  SmallItemWidget({
    this.amount,
    this.image,
    this.subTitle,
    this.title,
    this.textWidth,
    this.isActive = false,
  });

  factory SmallItemWidget.fromSong(AudioPost song) {
    return SmallItemWidget(
      title: song.name,
      amount: song.length.toString(),
      subTitle: song.author != null ? song.author.name : 'Unknown',
      image: song.images != null ? song.images[0].medium : 'images/avatar1.jpg',
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isActive ? Color(0xff5F4591) : Colors.white,
      padding: EdgeInsets.only(left: 24, right: 24),
      child: Column(
        children: [
          SizedBox(height: 24),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: Image.asset(
                  image,
                  width: 40,
                  height: 40,
                ),
              ),
              SizedBox(width: 16),
              Container(
                width: MediaQuery.of(context).size.width - 140,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        height: 19 / 16,
                        color: isActive ? Colors.white : Colors.black,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subTitle,
                      style: TextStyle(
                        fontSize: 12,
                        color: isActive ? Color(0xb3ffffff) : Color(0xff998FA2),
                        height: 15 / 12,
                      ),
                    ),
                  ],
                ),
              ),
              Spacer(),
              Text(
                amount,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  height: 19 / 16,
                  color: isActive ? Colors.white : Colors.black,
                ),
              ),
            ],
          ),
          SizedBox(height: 24),
          Container(height: 1, color: Color(0x0D352641)),
        ],
      ),
    );
  }
}
