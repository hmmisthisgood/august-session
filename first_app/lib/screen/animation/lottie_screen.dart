import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LottieScreen extends StatelessWidget {
  const LottieScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(children: [
        Lottie.asset("assets/animations/car.json"),
        Lottie.asset("assets/animations/data.json", height: 200),
      ]),
    );
  }
}
