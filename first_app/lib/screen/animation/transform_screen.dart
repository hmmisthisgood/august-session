import 'dart:math';

/// Transform
/// Transform.scale
/// Transform.rotate
/// Transform.translate

import 'package:flutter/material.dart';

class TransformSCreen extends StatelessWidget {
  const TransformSCreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final txt = theme.textTheme;

    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        SizedBox(height: 40),
        Transform.rotate(
          angle: -pi / 2,
          child: Text("Random text", style: txt.headline3),
        ),
        SizedBox(height: 100),
        Transform.scale(
          scale: 3,
          child: Icon(Icons.home),
        ),
        Transform.translate(
          offset: Offset(100, 400),
          child: Icon(Icons.ac_unit),
        )
      ]),
    );
  }
}
