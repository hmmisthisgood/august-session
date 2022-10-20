import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomToTop extends PageRoute {
  final Widget target;

  BottomToTop({required this.target});

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
    final bottomToTop = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0));
    final topToBottom = Tween<Offset>(begin: Offset(0, -1), end: Offset(0, 0));
    final rightToLeft = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
    final leftToRight = Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0));

    return SlideTransition(
      position: animation.drive(leftToRight),
      child: target,
    );
  }
}

leftToRight({required Widget target}) {
  return PageRouteBuilder(
    pageBuilder: ((context, animation, secondaryAnimation) => target),
    transitionDuration: Duration(milliseconds: 600),
    barrierColor: Colors.transparent,
    barrierDismissible: false,
    transitionsBuilder: ((context, animation, secondaryAnimation, child) {
      final leftToRight =
          Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0));
      return SlideTransition(position: animation.drive(leftToRight));
    }),
  );
}

class CustomRoute {
  static leftToRight({required Widget target}) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => target,
      transitionDuration: Duration(milliseconds: 600),
      barrierColor: Colors.transparent,
      barrierDismissible: false,
      transitionsBuilder: ((context, animation, secondaryAnimation, child) {
        final leftToRight =
            Tween<Offset>(begin: Offset(-1, 0), end: Offset(0, 0));
        return SlideTransition(
          position: animation.drive(leftToRight),
          child: target,
        );
      }),
    );
  }
}
/// SlideTransition