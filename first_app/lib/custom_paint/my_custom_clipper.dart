import 'package:flutter/material.dart';

/// Clip widget in wave shape
class WaveClipperTwo extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    final w = size.width; // 200
    final h = size.height; // 200

    var firstControlPoint = Offset(size.width / 4, size.height); // (50, 200)

    var firstEndPoint =
        Offset(size.width / 2, size.height - 30.0); // (100, 170)

    var secondControlPoint =
        Offset(size.width - (size.width / 3.25), size.height - 65);

    var secondEndPoint = Offset(size.width, size.height - 40);

    /// starting point of path= (0,0)

    path.lineTo(0.0, size.height - 20); // (0.0, 180)

// offset = x,y

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    path.lineTo(size.width, size.height - 40); // (200, 160)
    path.lineTo(size.width, 0.0); // (200, 0)
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
