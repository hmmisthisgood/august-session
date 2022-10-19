import 'dart:math';

import 'package:flutter/material.dart';

class ABuilderScreen extends StatefulWidget {
  const ABuilderScreen({super.key});

  @override
  State<ABuilderScreen> createState() => ABuilderScreenState();
}

/// Ticker Provider

class ABuilderScreenState extends State<ABuilderScreen>
    with TickerProviderStateMixin {
  late AnimationController spinnerController;

  @override
  void initState() {
    super.initState();

    spinnerController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 5000),
      reverseDuration: Duration(milliseconds: 3000),
    );

// 0, 0.01, 0.02, .....0.09. 0.1,...., 1
    spinnerController.forward();

    spinnerController.addListener(() {
      if (spinnerController.isCompleted) {
        // spinnerController.forward();
        spinnerController.repeat();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(),
      floatingActionButton: FloatingActionButton(onPressed: () {
        // spinnerController.forward();
        spinnerController.reverse();
      }),
      body: Column(children: [
        AnimatedIcon(
          icon: AnimatedIcons.close_menu,
          progress: spinnerController,
        ),
        SizedBox(height: 30),
        AnimatedBuilder(
          animation: spinnerController,
          builder: (context, child) {
            print(spinnerController.value);

            return Column(
              children: [
                Transform.translate(
                  offset: Offset(spinnerController.value * width * 0.5,
                      spinnerController.value * height - 100),
                  // 0,-300
                  child: Transform.scale(
                    scale: 1 + 2 * spinnerController.value,
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(), shape: BoxShape.circle),
                      child: Transform.rotate(
                          angle: 2 * pi * spinnerController.value,
                          child: Icon(Icons.home)),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: spinnerController.value * 2 * pi,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                        border: Border.all(), shape: BoxShape.circle),
                    child: Text(
                      "Rotate",
                      style: theme.textTheme.headline4,
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ]),
    );
  }
}
