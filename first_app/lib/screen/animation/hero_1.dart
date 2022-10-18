import 'package:first_app/util/constants.dart';
import 'package:flutter/material.dart';

import 'hero_2.dart';

class Hero1 extends StatelessWidget {
  const Hero1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) => Hero2()));
        },
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
