import 'package:devotion/widgets/AppBarWidget.dart';
import 'package:devotion/widgets/AppScaffoldWidget.dart';
import 'package:flutter/material.dart';

class FlightsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppScaffoldWidget(
      appBar: AppBarWidget(
        title: 'Flights',
      ),
      paddingTop: 173,
      bodyColor: Color(0xff241332),
      body: Container(
        child: Column(
          children: [
            Container(
              color: Color(0xff241332),
              padding:
                  EdgeInsets.only(top: 25, left: 16, right: 16, bottom: 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff352641),
                      borderRadius: BorderRadius.circular(52),
                      border: Border.all(
                        color: Color(0xff261835),
                      ),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SearchDetail(icon: Icons.location_on, text: 'Montreal'),
                        SearchDetail(icon: Icons.location_on, text: 'New York'),
                      ],
                    ),
                  ),
                  SizedBox(height: 12),
                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xff352641),
                      borderRadius: BorderRadius.circular(52),
                      border: Border.all(
                        color: Color(0xff261835),
                      ),
                    ),
                    child: Row(
                      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SearchDetail(
                          icon: Icons.calendar_today,
                          text: 'Sun, Jan 14',
                        ),
                        SearchDetail(
                          icon: Icons.calendar_today,
                          text: 'Sun, Jan 14',
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 31),
                ],
              ),
            ),
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: 24, vertical: 30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'DEPARTING FLIGHTS',
                    style: TextStyle(
                      color: Color(0xff998FA2),
                      fontSize: 12,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(height: 22),
                  FlightDetail(
                    image: 'images/avatar1.jpg',
                    title: 'I surrender',
                    subTitle: 'Hillsong United',
                    amount: '4:30',
                  ),
                  FlightDetail(
                    image: 'images/avatar1.jpg',
                    title: 'I surrender',
                    subTitle: 'Hillsong United',
                    amount: '4:30',
                  ),
                  FlightDetail(
                    image: 'images/avatar1.jpg',
                    title: 'I surrender',
                    subTitle: 'Hillsong United',
                    amount: '4:30',
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

class SearchDetail extends StatelessWidget {
  final IconData icon;
  final String text;
  const SearchDetail({
    Key key,
    this.icon,
    this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
      child: Row(
        children: [
          Icon(
            icon,
            color: Color(0x88ffffff),
          ),
          SizedBox(width: 12),
          Text(
            text,
            style: TextStyle(
              color: Colors.white,
              fontSize: 13,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}

class FlightDetail extends StatelessWidget {
  final String image;
  final String title;
  final String subTitle;
  final String amount;

  FlightDetail({
    this.amount,
    this.image,
    this.subTitle,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 24),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(
              image,
              width: 40,
              height: 40,
            ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    height: 19 / 16,
                  ),
                ),
                SizedBox(height: 4),
                Text(
                  subTitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: Color(0xff998FA2),
                    height: 15 / 12,
                  ),
                ),
                // SizedBox(height: 4),
                // Text(
                //   'States Airlines',
                //   style: TextStyle(
                //     fontSize: 12,
                //     color: Color(0xff998FA2),
                //     height: 15 / 12,
                //   ),
                // ),
              ],
            ),
            Spacer(),
            Text(
              amount,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                height: 19 / 16,
              ),
            ),
          ],
        ),
        SizedBox(height: 24),
        Container(height: 1, color: Color(0x0D352641)),
      ],
    );
  }
}
