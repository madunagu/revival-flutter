import 'package:devotion/models/Church.dart';
import 'package:devotion/widgets/MapWidget.dart';
import 'package:flutter/material.dart';

var largeWhiteTextStyle = TextStyle(
  color: Colors.white,
  fontSize: 14,
  fontWeight: FontWeight.bold,
  letterSpacing: -0.14,
);

var smallWhiteTextStyle = TextStyle(
  color: Color(0xff998fa2),
  fontSize: 12,
  fontWeight: FontWeight.w500,
  letterSpacing: -0.19,
);

class ChurchWidget extends StatelessWidget {
  ChurchWidget({this.church});
  final Church church;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Icon(
            Icons.commute,
            color: Colors.white,
            size: 20,
          ),
          SizedBox(
            width: 20,
          ),
          Flexible(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  church.name,
                  style: largeWhiteTextStyle,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  church.alternateName,
                  style: smallWhiteTextStyle,
                ),
                SizedBox(
                  height: 18,
                ),
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(60),
                    bottomLeft: Radius.circular(60),
                  ),
                  child: church.images != null && church.images.isNotEmpty
                      ? Image.network(church.images[0].medium,
                          fit: BoxFit.cover)
                      : Image.asset('images/church.jpg', fit: BoxFit.cover),
                ),
                SizedBox(height: 29),
              ],
            ),
          )
        ],
      ),
    );
  }
}
