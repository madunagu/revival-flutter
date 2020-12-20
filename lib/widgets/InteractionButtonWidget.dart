import 'package:flutter/material.dart';

class InteractionButtonWidget extends StatelessWidget {
  final IconData icon;
  final int count;
  final bool active;
  final Function onTap;
  InteractionButtonWidget(
      {this.icon, this.count, this.onTap, this.active = false});
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
          Icon(
            icon,
            color: active ? Colors.red : Colors.white,
            size: 17,
          ),
        ],
      ),
    );
  }
}
