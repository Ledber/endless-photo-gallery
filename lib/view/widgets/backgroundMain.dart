import 'package:flutter/material.dart';

class Background extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var sw = size.width;
    var sh = size.height;
    var paint = Paint();

    Path mainBackground = Path();
    mainBackground.addRect(Rect.fromLTRB(0, 0, sw, sh));
    paint.color = Colors.orange.shade300;
    canvas.drawPath(mainBackground, paint);

    // Gray
    Path greyPath = Path();
    greyPath.lineTo(sw, 0);
    greyPath.lineTo(sw, sh * 0.65);
    greyPath.cubicTo(sw * 0.8, sh * 0.8, sw * 0.5, sh * 0.8, sw * 0.45, sh);
    greyPath.lineTo(0, sh);
    greyPath.close();
    paint.color = Colors.grey.shade800;
    canvas.drawPath(greyPath, paint);

    // Blue
    Path bluePath = Path();
    bluePath.lineTo(sw, 0);
    bluePath.lineTo(sw, sh * 0.3);
    bluePath.cubicTo(sw * 0.65, sh * 0.45, sw * 0.25, sh * 0.35, 0, sh * 0.5);
    bluePath.close();
    paint.color = Colors.lightBlue.shade300;
    canvas.drawPath(bluePath, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}