import 'package:first_app/navigation/scale_route.dart';
import 'package:first_app/navigation/vertical_route.dart';
import 'package:first_app/screen/animation/lottie_screen.dart';
import 'package:first_app/screen/animation/transform_screen.dart';
import 'package:flutter/material.dart';

import '../../navigation/fade_route.dart';
import 'animated_builder_screen.dart';
import 'animated_continaer.dart';
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
    },
    {
      "title": "Animation Container",
      "widget": AnimContainerScreen(),
    },
    {
      "title": "Transform Screen",
      "widget": TransformSCreen(),
    },
    {
      "title": "Animated Builder & Transform Screen",
      "widget": ABuilderScreen(),
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
              // Navigator.push(
              //     context, MaterialPageRoute(builder: (_) => screen['widget']));
              // Navigator.push(
              //     context, CustomRoute.leftToRight(target: screen['widget']));
              Navigator.push(context, leftToRight(target: screen['widget']));
              Navigator.push(context, ScaleRoute(target: screen['widget']));
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


/// Animations: 
/// - Implicit 
/// - Explicit

/// Implicit:(Mostly animated versions of widgets)
/// - AnimatedContainer
/// - AnimatedIcon
/// - AnimatedPositioned
/// - AnimatedOpacity
/// - AnimatedSwitcher
/// - AnimatedAlign
/// - AnimatedScale


/// - Transform

/// AnimatedWidget 
/// AnimatedBuilder

/// SlideTransition
/// FadeTransition
/// ScaleTransition


/// AnimationContoller
/// Tween 
/// Curves
/// Duration

