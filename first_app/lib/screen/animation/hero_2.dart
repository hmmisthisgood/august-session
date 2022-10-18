import 'package:first_app/util/constants.dart';
import 'package:flutter/material.dart';

class Hero2 extends StatelessWidget {
  const Hero2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Hero(
          tag: "hero",
          child: Image.network(
            Constants.image1,
            height: 200,
            width: double.infinity,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
