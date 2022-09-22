import 'package:flutter/cupertino.dart';

class Env extends InheritedWidget {
  final String baseUrl;
  final String env;
  final String apiKey;

  final Widget child;
  const Env(
      {required this.baseUrl,
      required this.env,
      required this.apiKey,
      required this.child})
      : super(child: child);

  @override
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static Env of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<Env>()!;
  }
}
