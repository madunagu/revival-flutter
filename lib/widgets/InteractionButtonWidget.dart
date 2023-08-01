import 'package:flutter/material.dart';

class InteractionButtonWidget extends StatelessWidget {
  final IconData icon;
  final int count;
  final bool active;
  final Function()? onTap;
  final Color? color;
  InteractionButtonWidget(
      {required this.icon, required this.count, this.onTap,this.color =Colors.white, this.active = false});
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
              color: color,
              fontWeight: FontWeight.w700,
              fontSize: 12,
            ),
          ),
          SizedBox(
            width: 6,
          ),
          Icon(
            icon,
            color: active ? Colors.red : color,
            size: 17,
          ),
        ],
      ),
    );
  }
}
