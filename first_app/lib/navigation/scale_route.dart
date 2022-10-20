import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ScaleRoute extends PageRoute {
  final Widget target;

  ScaleRoute({required this.target});

  @override
  Color? get barrierColor => Colors.transparent;

  @override
  String? get barrierLabel => "";

  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return target;
  }

  @override
  bool get maintainState => true;

  @override
  Duration get transitionDuration => Duration(milliseconds: 400);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    print(animation.value);
    final scaleTween = Tween<double>(begin: 0.3, end: 1);

    return ScaleTransition(
      scale: animation.drive(scaleTween),
      child: target,
    );
  }
}

/// SlideTransition
/// 
/// android defualt: fade trasition (materialpageroute)
/// ios default: slide transition(right to left) (cupertinopageroute)