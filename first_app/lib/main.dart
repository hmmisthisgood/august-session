// import 'package:flutter/material.dart';

// Widget
// StatelessWidget
// StatefulWidget

import 'package:flutter/material.dart';

import 'screen/row_and_column.dart';

// import 'package:first_app/screen/homepage.dart';

main() {
  runApp(new OurApp());
}

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "Our app",
      home: RowAndColumn(),
    );
  }
}



/// Special widgets:
/// 1. MaterialApp/CupertinoApp


/// Most Common:
/// 1. Scaffold 

/// Shape:
/// 1. Container 