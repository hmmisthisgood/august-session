// import 'package:flutter/material.dart';

import 'package:first_app/screen/navigation_screen.dart';
import 'package:first_app/screen/stful/notes_screen.dart';
import 'package:first_app/screen/stful/splash_screen.dart';
import 'package:flutter/material.dart';

import 'navigation/custom_route_generator.dart';

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
      onGenerateRoute: customRouteGenerator,
      home: NotesScreen(),
      // initialRoute: Routes.splash,
    );
  }
}



/// Special widgets:
/// 1. MaterialApp/CupertinoApp


/// Most Common:
/// 1. Scaffold 

/// Shape:
/// 1. Container 