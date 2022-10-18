import 'package:first_app/screen/animation/lottie_screen.dart';
import 'package:flutter/material.dart';

import 'hero_1.dart';

class AllAnimationsScreen extends StatelessWidget {
  AllAnimationsScreen({Key? key}) : super(key: key);

  final List screens = [
    {
      "title": "Hero Animation",
      "widget": Hero1(),
    },
    {
      "title": "Lottie Animation",
      "widget": LottieScreen(),
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: screens.length,
        itemBuilder: (context, index) {
          Map screen = screens[index];

          return MaterialButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (_) => screen['widget']));
            },
            color: Colors.red,
            child: Text(
              screen['title'],
              style: TextStyle(color: Colors.white),
            ),
          );
        },
      ),
    );
  }
}


/// Hero Animation

/// Lottie Animation : lottie package
