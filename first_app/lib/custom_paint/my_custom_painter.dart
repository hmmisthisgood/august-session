import 'package:flutter/material.dart';

class MyCustomPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final w = size.width;
    final h = size.height;
    Paint brush = Paint();

    Path outline = Path();

    brush.color = Colors.red;
    brush.strokeWidth = 10;
    brush.strokeCap = StrokeCap.round;

    outline.lineTo(w / 2, h / 2);
    outline.lineTo(0, h);
    outline.lineTo(0, 0);
    outline.close();

    canvas.drawPath(outline, brush);

    // canvas.drawCircle(Offset(100, 100), 100, brush);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}


/// Canvas = art board , we can paint anything
/// Paint = brush , brush has color, shape
/// Path = the lines i draw using Brush(Paint) on the art board (canvas)
