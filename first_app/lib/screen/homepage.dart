// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(child: Text("Yay our first app")),
      drawer: Drawer(),
      bottomNavigationBar: Container(height: 50, color: Colors.red),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          print("I am pressed");
        },
      ),
    );
  }
}

/// Scaffold : creates a new screen 
/// AppBar 
/// Text
/// Container