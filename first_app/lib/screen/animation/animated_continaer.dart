import 'dart:math';

import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

class AnimContainerScreen extends StatefulWidget {
  const AnimContainerScreen({Key? key}) : super(key: key);

  @override
  State<AnimContainerScreen> createState() => _AnimContainerScreenState();
}

class _AnimContainerScreenState extends State<AnimContainerScreen> {
  double _height = 100;
  double _width = 100;

  Color _color = Colors.yellow;
  double _radius = 20;
  double top = 200;
  double left = 150;
  double opacity = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        child: Stack(children: [
          SizedBox(height: 20),
          InkWell(
            onTap: () {
              _height = 40 + Random().nextDouble() * 200;
              _width = 40 + Random().nextDouble() * 200;
              _color = Color.fromRGBO(
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextInt(255),
                  Random().nextDouble());
              _radius = Random().nextDouble() * 50;
              setState(() {});
            },
            child: AnimatedContainer(
              height: _height,
              width: _width,
              duration: Duration(milliseconds: 900),
              decoration: BoxDecoration(
                color: _color,
                borderRadius: BorderRadius.circular(_radius),
              ),
            ),
          ),
          AnimatedPositioned(
            left: left,
            top: top,
            child: InkWell(
              onTap: () {
                top = 100.0 + Random().nextInt(200);
                left = 100.0 + Random().nextInt(200);

                setState(() {});
              },
              child: Icon(
                Icons.home,
                size: 40,
              ),
            ),
            duration: Duration(milliseconds: 300),
          ),
          Center(
            child: AnimatedOpacity(
              opacity: opacity,
              duration: Duration(milliseconds: 4000),
              child: InkWell(
                onTap: () {
                  if (opacity == 1)
                    opacity = 0;
                  else
                    opacity = 1;
                  setState(() {});
                },
                child: Icon(
                  Icons.abc_sharp,
                  size: 40,
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }
}
