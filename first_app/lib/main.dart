// import 'package:flutter/material.dart';

import 'package:first_app/screen/page_view_screen.dart';
import 'package:first_app/screen/tiktok_skeleton.dart';
import 'package:flutter/material.dart';

import 'screen/stack_screen.dart';

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
      ),
      home: TikTokSkeleton(),
    );
  }
}



/// Special widgets:
/// 1. MaterialApp/CupertinoApp


/// Most Common:
/// 1. Scaffold 

/// Shape:
/// 1. Container 