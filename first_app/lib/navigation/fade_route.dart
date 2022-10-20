import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FadeRoute extends PageRoute {
  final Widget target;

  FadeRoute({required this.target});

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
  Duration get transitionDuration => Duration(milliseconds: 2000);

  @override
  Widget buildTransitions(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation, Widget child) {
    print(animation.value);
    return FadeTransition(
      opacity: animation,
      child: target,
    );
  }
}

/// SlideTransition