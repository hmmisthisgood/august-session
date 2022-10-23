import 'package:flutter/material.dart';

import '../../custom_paint/my_custom_clipper.dart';

class CustomClipScreen extends StatelessWidget {
  const CustomClipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Clipper "),
      ),
      body: Column(
        children: [
          ClipPath(
            clipper: WaveClipperTwo(),
            child: Container(
              height: 200,
              width: 200,
              color: Colors.green,
            ),
          ),
        ],
      ),
    );
  }
}


/// ClipPath = Widget
/// clipper = CustomClipper