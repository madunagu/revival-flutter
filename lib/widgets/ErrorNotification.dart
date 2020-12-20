import 'package:devotion/widgets/AppButtonWidget.dart';
import 'package:flutter/material.dart';

class ErrorNotification extends StatelessWidget {
  final String okText;
  final String bodyText;
  final String titleText;
  final Function okTap;
  final Function backTap;
  final String backText;
  const ErrorNotification({
    Key key,
    this.okText = 'Ok',
    this.bodyText='',
    this.titleText,
    this.okTap,
    this.backTap,
    this.backText = 'Back',
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 24),
      height: 226,
      padding: EdgeInsets.only(
        left: 32,
        right: 24,
        top: 24,
        bottom: 24,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(80),
          bottomLeft: Radius.circular(80),
        ),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            titleText,
            style: TextStyle(
              fontSize: 26,
              height: 30 / 26,
              letterSpacing: -16 / 26,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 10),
          Text(
            bodyText,
            style: TextStyle(
              color: Color(0xff998FA2),
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: 26),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: backTap,
                child: AppButtonWidget(text: backText),
              ),
              SizedBox(width: 8),
              GestureDetector(
                onTap: okTap,
                child: AppButtonWidget(
                  text: okText,
                  color: Color(0xff8A56AC),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
