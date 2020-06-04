import 'package:devotion/widgets/CurvedCornerWidget.dart';
import 'package:devotion/main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

var smallTextSyle = TextStyle(color: Colors.grey, fontSize: 12);
var largeWhiteTextStyle = TextStyle(
    color: Colors.white,
    fontSize: 14,
    fontWeight: FontWeight.bold,
    letterSpacing: -0.14);
var smallWhiteTextStyle = TextStyle(
    color: Color(0xff998fa2),
    fontSize: 12,
    fontWeight: FontWeight.w500,
    letterSpacing: -0.19);

class SingleEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            CurvedCornerWidget(
              color: themeColors[0],
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
//                color: themeColors[0],
                child: Column(
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Icon(
                            Icons.file_upload,
                            color: Colors.white,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 8.0, left: 56, right: 24),
                      child: Text(
                        'Yoga and Meditation for Beginners',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.39,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: Colors.white,
              child: CurvedCornerWidget(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 40, vertical: 22),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          SizedBox(width: 15),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'images/avatar1.jpg',
                              height: 32,
                              width: 32,
                            ),
                          ),
                          SizedBox(
                            width: 16,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                'Easy and Gentle Yoga',
                                style: TextStyle(
                                  fontWeight: FontWeight.w700,
                                  letterSpacing: -0.14,
                                ),
                              ),
                              Text(
                                'Montreal, QC Private Group',
                                style: TextStyle(
                                  color: Color(0x7A403249),
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: -0.19,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        padding: EdgeInsets.only(
                            left: 20, top: 16, right: 14, bottom: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
//                          border: Border.all(color: Colors.grey),
                          color: Color(0xff352641),
                        ),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              child: Icon(
                                Icons.open_in_browser,
                                color: Color(0xff998fa2),
                              ),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  'Are you going?',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: -0.14,
                                  ),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  'Edit',
                                  style: smallTextSyle,
                                )
                              ],
                            ),
                            Spacer(),
                            Container(
                              width: 40,
                              height: 40,
                              margin: EdgeInsets.symmetric(horizontal: 6),
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xff594f62),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.cancel,
                                color: Colors.white,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 6),
                              width: 40,
                              height: 40,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xff594f62),
                                borderRadius: BorderRadius.circular(50),
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 23, top: 20, right: 40),
              color: themeColors[2],
              child: Column(
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
                        color: Colors.white,
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            'TODAY',
                            style: largeWhiteTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            '5:30 - 8:30',
                            style: smallWhiteTextStyle,
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'EVERY WEEK ON MONDAY',
                            style: smallWhiteTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.access_time,
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
                              'The Bay Department store',
                              style: largeWhiteTextStyle,
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text(
                              '585 Saint Catherine Street West, Montreal Quebec Canada',
                              style: smallWhiteTextStyle,
                            ),
                            SizedBox(
                              height: 18,
                            ),
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(40),
                                  bottomLeft: Radius.circular(40)),
                              child: Container(
                                height: 116,
                                width: double.infinity,
                                child: Image.asset(
                                  'images/avatar1.jpg',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.credit_card,
                        color: Color(0xff757575),
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Flexible(
                        child: Text(
                          '\$ 21.00',
                          style: largeWhiteTextStyle,
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 29,
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.person_outline,
                        color: Color(0xff757575),
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Hosted By Joe',
                        style: largeWhiteTextStyle,
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Text(
                    'New to Yoga, or looking to take your mat to practice in new places?',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff998fa2),
                      letterSpacing: -0.14,
                    ),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    'Get to know your local community and neighbours better by joining our Yoga family.',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff998fa2),
                      letterSpacing: -0.14,
                    ),
                  ),
                  SizedBox(height: 29,),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Icon(
                        Icons.chat_bubble_outline,
                        color: Color(0xff757575),
                        size: 20,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Text(
                        'Live Chats',
                        style: largeWhiteTextStyle,
                      )
                    ],
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
