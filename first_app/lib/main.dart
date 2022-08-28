// import 'package:flutter/material.dart';

import 'package:first_app/screen/stful/counter_screen.dart';
import 'package:flutter/material.dart';

import 'screen/dashboard_screen.dart';

// import 'package:first_app/screen/homepage.dart';

main() {
  runApp(new OurApp());
}

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Our app",
      theme: ThemeData(
        primarySwatch: Colors.purple,
        fontFamily: "Oswald",
      ),
      home: CounterScreen(),
    );
  }
}



/// Special widgets:
/// 1. MaterialApp/CupertinoApp


/// Most Common:
/// 1. Scaffold 

/// Shape:
/// 1. Container 