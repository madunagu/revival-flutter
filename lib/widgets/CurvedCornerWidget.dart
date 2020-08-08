import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CurvedCornerWidget extends StatelessWidget {
  final Widget child;
  final Color color;
  final double radius;
  final Color borderColor;
  final EdgeInsetsGeometry padding;
  final DecorationImage decorationImage;

  CurvedCornerWidget(
      {Key key,
      this.child,
      this.color = const Color(0x00fff),
      this.radius = 80,
      this.decorationImage = null,
      this.padding = const EdgeInsets.only(),
      this.borderColor = const Color(0xff000)})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      foregroundPainter: BorderPainter(
        radius: this.radius,
        width: 1,
        borderColor: this.borderColor,
      ),
      child: Container(
        padding: this.padding,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(radius),
          ),
          color: color,
          image: this.decorationImage,
        ),
        child: child,
      ),
    );
  }
}

class BorderPainter extends CustomPainter {
  final Color borderColor;
  final double radius;
  final double width;
  BorderPainter({this.borderColor, this.radius, this.width});
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = this.borderColor;
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = this.width;

    var startPoint = Offset(0, size.height - radius);
    var controlPoint = Offset(radius, size.height);
    var endPoint = Offset(size.width, size.height);

    var path = Path();
    path.moveTo(startPoint.dx, startPoint.dy);
    path.arcToPoint(
      controlPoint,
      clockwise: false,
      radius: Radius.circular(this.radius),
    );
    path.lineTo(endPoint.dx, endPoint.dy);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
