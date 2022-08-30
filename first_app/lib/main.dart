// import 'package:flutter/material.dart';

import 'package:first_app/navigation/routes.dart';
import 'package:first_app/screen/navigation_screen.dart';
import 'package:flutter/material.dart';

import 'navigation/custom_route_generator.dart';
import 'screen/stful/login_form_screen.dart';

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
      // home: NavigationScreen(),
      initialRoute: Routes.nav,
    );
  }
}



/// Special widgets:
/// 1. MaterialApp/CupertinoApp


/// Most Common:
/// 1. Scaffold 

/// Shape:
/// 1. Container 