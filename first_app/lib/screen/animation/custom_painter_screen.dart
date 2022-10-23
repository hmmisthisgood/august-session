import 'package:flutter/material.dart';
import '../../custom_paint/my_custom_painter.dart';

class CustomPaintScreen extends StatelessWidget {
  const CustomPaintScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Custom Paint")),
      body: Column(children: [
        CustomPaint(
          painter: MyCustomPainter(),
          child: Container(
            height: 200,
            width: 400,
          ),
        )
      ]),
    );
  }
}

/// CustomPaint= Widget
/// CustomPainter= Painter class