import 'package:devotion/widgets/DefaultAppBarWidget.dart';
import 'package:devotion/widgets/ScaffoldDesignWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CreateEventScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScaffoldDesignWidget(
      customAppBar: DefaultAppBarWidget(
        title: 'Create Event',
        color: Colors.white,
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.only(top: 100, left: 24, right: 24),
        color: Color(0xff241332),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Give your group a name. Describe who should join and what you’ll do.',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                letterSpacing: -0.14,
                color: Color(0xff998fa2),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'Group name',
              style: TextStyle(
                letterSpacing: -0.22,
                fontWeight: FontWeight.w600,
                fontSize: 11,
                color: Color(0x99ffffff),
              ),
            ),
            TextField(
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Colors.white),
              decoration: InputDecoration(),
            ),
            TextField(),
            Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Icon(
                  Icons.location_on,
                  color: Color(0xff757575),
                  size: 36,
                ),
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Location',
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                letterSpacing: -0.14),
                          ),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Color(0xffffffff),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        'Montreal, QC',
                        style: TextStyle(
                          letterSpacing: -0.19,
                          color: Color(0xff8c8195),
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      SizedBox(
                        height: 17,
                      ),
                      Container(
                        width: double.infinity,
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(70),
                            bottomLeft: Radius.circular(70),
                          ),
                          child: Image.asset(
                            'images/avatar1.jpg',
                            height: 116,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            Row(),
          ],
        ),
      ),
    );
  }
}
