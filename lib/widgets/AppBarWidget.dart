import 'package:flutter/material.dart';

import 'package:devotion/widgets/CurvedCornerWidget.dart';

class AppBarWidget extends StatefulWidget {
  final Color color;
  final String title;
  final IconData rightIcon;
  final Color borderColor;
  final Color titleColor;

  AppBarWidget({
    Key key,
    this.color = const Color(0xffffffff),
    this.title,
    this.rightIcon,
    this.borderColor = const Color(0xffE7E4E9),
    this.titleColor = const Color(0xff000000),
  }) : super(key: key);

  @override
  _AppBarWidgetState createState() => _AppBarWidgetState();
}

class _AppBarWidgetState extends State<AppBarWidget>
    with SingleTickerProviderStateMixin {
  TabController _tabController;
  @override
  void initState() {
    this._tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return CurvedCornerWidget(
      color: widget.color,
      borderColor: this.widget.borderColor,
      child: Container(
        height: 156,
        padding: EdgeInsets.only(left: 30, top: 44, right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    height: 44,
                    child: Icon(
                      Icons.arrow_back,
                      color: Color.fromARGB(255, 117, 117, 117),
                    ),
                  ),
                ),
                Spacer(),
                Container(
                  height: 44,
                  child: Icon(
                    widget.rightIcon,
                    color: Color.fromARGB(255, 117, 117, 117),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(
                left: 66,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.title,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: FontWeight.w700,
                      height: 1.15,
                      color: this.widget.titleColor,
                      letterSpacing: -0.42,
                    ),
                  ),
                  //  Container(
                  //   padding: EdgeInsets.only(top: 8),
                  //   child: Text(
                  //     'Find people and do your thing',
                  //     style: TextStyle(
                  //       fontSize: 12,
                  //       fontStyle: FontStyle.italic,
                  //       color: Color(0x7a403249),
                  //       fontWeight: FontWeight.w500,
                  //     ),
                  //   ),
                  // ),
                  // Container(
                  //   height: 48,
                  //   child: TabBar(
                  //     labelPadding: EdgeInsets.all(10),
                  //     controller: _tabController,
                  //     tabs: [
                  //       ButtonWidget(
                  //         text: 'TODAY',
                  //         active: true,
                  //       ),
                  //       ButtonWidget(
                  //         text: 'WEEK',
                  //       ),
                  //       ButtonWidget(
                  //         text: 'MONTH',
                  //       ),
                  //     ],
                  //   ),
                  // )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Function onTap;
  final bool active;
  ButtonWidget({this.text, this.color, this.onTap, this.active = false});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 32,
      width: 81,
      padding: EdgeInsets.symmetric(horizontal: 22, vertical: 8),
      decoration: BoxDecoration(
        color: Color(0xff8A56AC),
        borderRadius: BorderRadius.circular(30),
      ),
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: 12,
          fontWeight: FontWeight.w500,
          // height: 26 / 12,
        ),
      ),
    );
  }
}
