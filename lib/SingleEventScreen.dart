import 'package:devotion/CurvedCornerWidget.dart';
import 'package:devotion/ScaffoldDesignWidget.dart';
import 'package:devotion/main.dart';
import 'package:flutter/material.dart';

var smallTextSyle = TextStyle(color: Colors.grey, fontSize: 12);
var largeWhiteTextStyle = TextStyle(color: Colors.white, fontSize: 14);
var smallWhiteTextStyle = TextStyle(color: Colors.grey, fontSize: 12);

class SingleEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            CurvedCornerWidget(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 32, horizontal: 16),
                color: themeColors[0],
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
                      padding: const EdgeInsets.symmetric(
                          vertical: 8.0, horizontal: 26),
                      child: Text(
                        'Yoga and Meditation for Beginners',
                        style: TextStyle(color: Colors.white, fontSize: 24),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              color: themeColors[2],
              child: CurvedCornerWidget(
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              'assets/images/avatar1.jpg',
                              height: 40,
                              width: 40,
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text('Easy and Gentle Yoga'),
                              Text(
                                'Montreal, QC Private Group',
                                style:
                                    TextStyle(color: Colors.grey, fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Row(
                          children: <Widget>[
                            InkWell(
                              child: Icon(Icons.open_in_browser),
                            ),
                            SizedBox(
                              width: 16,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text('Are you going?'),
                                Text(
                                  'Edit',
                                  style: smallTextSyle,
                                )
                              ],
                            ),
                            Spacer(),
                            InkWell(
                              child: Icon(Icons.check),
                            ),
                          ],
                        ),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey)),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: themeColors[2],
              child: CurvedCornerWidget(
                color: themeColors[2],
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
                  color: themeColors[2],
                  child: Row(
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
                          Text(
                            '5:30 - 8:30',
                            style: smallWhiteTextStyle,
                          ),
                          Text(
                            'EVERY WEEK ON MONDAY',
                            style: smallWhiteTextStyle,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              color: themeColors[2],
              child: CurvedCornerWidget(
                color: themeColors[2],
                child: Container(
                  padding: EdgeInsets.only(left: 32, top: 20),
                  color: themeColors[2],
                  child: Row(
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
                            Text(
                              '585 Saint Catherine Street West, Montreal Quebec Canada',
                              style: smallWhiteTextStyle,
                            ),
                            Text(
                              'EVERY WEEK ON MONDAY',
                              style: smallWhiteTextStyle,
                            ),
                            Container(
                              padding: EdgeInsets.all(16),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                child: Container(
                                  height: 100,
                                  width: 200,
                                  child: Image.asset(
                                    'assets/images/avatar1.jpg',
                                    width: 200,
                                    height: 100,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
