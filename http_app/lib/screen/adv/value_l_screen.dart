import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// ValutListanableBuilder
/// StreamBuilder
/// FutureBuilder

class ValueLScreen extends StatelessWidget {
  ValueLScreen({Key? key}) : super(key: key);

  ValueNotifier<int> count = ValueNotifier(0);

  ValueNotifier<int> reverCounter = ValueNotifier(20);

  final image =
      "https://cdn.pixabay.com/photo/2016/01/31/19/41/apple-1172060_1280.jpg";
  @override
  Widget build(BuildContext context) {
    print("build");
    return Scaffold(
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton(
            onPressed: () {
              count.value = count.value + 1;
            },
            child: Text("+++"),
          ),
          FloatingActionButton(
            onPressed: () {
              reverCounter.value = reverCounter.value - 1;
            },
            child: Text("---"),
          ),
        ],
      ),
      body: Center(
        child: ValueListenableBuilder<int>(
          valueListenable: count,
          child: Image.network(
            image,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          builder: (context, value, child) {
            return Stack(
              children: [
                if (child != null) child,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      value.toString(),
                      style: TextStyle(fontSize: 30, color: Colors.white),
                    ),
                    ValueListenableBuilder<int>(
                        valueListenable: reverCounter,
                        builder: (context, reverse, child) {
                          return Text(
                            reverse.toString(),
                            style: TextStyle(fontSize: 30, color: Colors.white),
                          );
                        })
                  ],
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}


/// ValueListanableBuilder: widget
/// ValueNotifier : Data type