import 'dart:math';

import 'package:flutter/material.dart';

class AppIcon {
  final name;
  final icon;
  AppIcon(this.icon, this.name);
}

class GridViewScreen extends StatelessWidget {
  List icons = [];
  List names = [];

  List<Map> apps = [
    {"icon": Icons.camera_alt, "color": Colors.green, "name": "Camera"}, // Map
    {"icon": Icons.calculate, "color": Colors.red, "name": "calculator"},
    {"icon": Icons.video_call, "color": Colors.purple, "name": "Video"},
    {"icon": Icons.email, "color": Colors.orange, "name": "Gmail"},
    {"icon": Icons.phone, "color": Colors.yellow, "name": "Phone"},
    {"icon": Icons.camera_alt, "color": Colors.brown, "name": "Camera"},
    {"icon": Icons.calculate, "color": Colors.blue, "name": "calculator"},
    {
      "icon": Icons.video_call,
      "color": Colors.deepOrangeAccent,
      "name": "Video"
    },
    {"icon": Icons.email, "color": Colors.pink, "name": "Gmail"},
    {"icon": Icons.camera_alt, "color": Colors.green, "name": "Camera"}, // Map
    {"icon": Icons.calculate, "color": Colors.red, "name": "calculator"},
    {"icon": Icons.video_call, "color": Colors.purple, "name": "Video"},
    {"icon": Icons.email, "color": Colors.orange, "name": "Gmail"},
    {"icon": Icons.phone, "color": Colors.yellow, "name": "Phone"},
    {"icon": Icons.camera_alt, "color": Colors.brown, "name": "Camera"},
    {"icon": Icons.calculate, "color": Colors.blue, "name": "calculator"},
    {
      "icon": Icons.video_call,
      "color": Colors.deepOrangeAccent,
      "name": "Video"
    },
    {"icon": Icons.email, "color": Colors.pink, "name": "Gmail"},
    {"icon": Icons.camera_alt, "color": Colors.green, "name": "Camera"}, // Map
    {"icon": Icons.calculate, "color": Colors.red, "name": "calculator"},
    {"icon": Icons.video_call, "color": Colors.purple, "name": "Video"},
    {"icon": Icons.email, "color": Colors.orange, "name": "Gmail"},
    {"icon": Icons.phone, "color": Colors.yellow, "name": "Phone"},
    {"icon": Icons.camera_alt, "color": Colors.brown, "name": "Camera"},
    {"icon": Icons.calculate, "color": Colors.blue, "name": "calculator"},
    {
      "icon": Icons.video_call,
      "color": Colors.deepOrangeAccent,
      "name": "Video"
    },
    {"icon": Icons.email, "color": Colors.pink, "name": "Gmail"},
    {"icon": Icons.camera_alt, "color": Colors.green, "name": "Camera"}, // Map
    {"icon": Icons.calculate, "color": Colors.red, "name": "calculator"},
    {"icon": Icons.video_call, "color": Colors.purple, "name": "Video"},
    {"icon": Icons.email, "color": Colors.orange, "name": "Gmail"},
    {"icon": Icons.phone, "color": Colors.yellow, "name": "Phone"},
    {"icon": Icons.camera_alt, "color": Colors.brown, "name": "Camera"},
    {"icon": Icons.calculate, "color": Colors.blue, "name": "calculator"},
    {
      "icon": Icons.video_call,
      "color": Colors.deepOrangeAccent,
      "name": "Video"
    },
    {"icon": Icons.email, "color": Colors.pink, "name": "Gmail"},
    {"icon": Icons.camera_alt, "color": Colors.green, "name": "Camera"}, // Map
    {"icon": Icons.calculate, "color": Colors.red, "name": "calculator"},
    {"icon": Icons.video_call, "color": Colors.purple, "name": "Video"},
    {"icon": Icons.email, "color": Colors.orange, "name": "Gmail"},
    {"icon": Icons.phone, "color": Colors.yellow, "name": "Phone"},
    {"icon": Icons.camera_alt, "color": Colors.brown, "name": "Camera"},
    {"icon": Icons.calculate, "color": Colors.blue, "name": "calculator"},
    {
      "icon": Icons.video_call,
      "color": Colors.deepOrangeAccent,
      "name": "Video"
    },
    {"icon": Icons.email, "color": Colors.pink, "name": "Gmail"},
    {"icon": Icons.camera_alt, "color": Colors.green, "name": "Camera"}, // Map
    {"icon": Icons.calculate, "color": Colors.red, "name": "calculator"},
    {"icon": Icons.video_call, "color": Colors.purple, "name": "Video"},
    {"icon": Icons.email, "color": Colors.orange, "name": "Gmail"},
    {"icon": Icons.phone, "color": Colors.yellow, "name": "Phone"},
    {"icon": Icons.camera_alt, "color": Colors.brown, "name": "Camera"},
    {"icon": Icons.calculate, "color": Colors.blue, "name": "calculator"},
    {
      "icon": Icons.video_call,
      "color": Colors.deepOrangeAccent,
      "name": "Video"
    },
    {"icon": Icons.email, "color": Colors.pink, "name": "Gmail"},
  ];

  final List<Widget> gridItems = List.generate(1000, (index) {
    return Container(
      height: 100,
      width: 100,
      color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
          Random().nextInt(255), 1),
    );
  });

  Widget buildNormalGridView() {
    return GridView(
      scrollDirection: Axis.vertical,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      children: [
        Container(height: 100, width: 150, color: Colors.green),
        Container(height: 100, width: 150, color: Colors.black),
        Container(height: 100, width: 150, color: Colors.blue),
        Container(height: 100, width: 150, color: Colors.orange),
        Icon(Icons.home),
        Text("this is text"),
        Icon(Icons.home),
        Icon(Icons.home),
        Row(
          children: [Text("text 1"), Icon(Icons.abc)],
        )
      ],
    );
  }

  Widget buildGVWithBuilder() {
    return GridView.builder(
      itemCount: 100,
      scrollDirection: Axis.horizontal,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 20,
        crossAxisSpacing: 20,
      ),
      itemBuilder: (context, index) {
        return Container(
          height: 100,
          width: 100,
          color: Color.fromRGBO(Random().nextInt(255), Random().nextInt(255),
              Random().nextInt(255), 1),
        );
      },
    );
  }

  Widget buildLauncher() {
    return GridView.builder(
      scrollDirection: Axis.vertical,
      itemCount: apps.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        mainAxisSpacing: 5,
        crossAxisSpacing: 5,
        childAspectRatio: 0.9,

        /// In Vertical scroll
        // width= height * aspectratio
        // height= width/aspectratio
      ),
      itemBuilder: (context, index) {
        print(index); // 0

        final app = apps[index];

        return Container(
          // color: Colors.green,
          child: Column(
            children: [
              Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  color: app['color'].withOpacity(0.8),
                  shape: BoxShape.circle,
                  // border: Border.all(color: Colors.grey.withOpacity(0.5)),
                ),
                child: Icon(app['icon'], size: 35, color: Colors.white),
              ),
              SizedBox(height: 5),
              Text(
                app["name"],
                style: TextStyle(fontWeight: FontWeight.w300),
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildLauncher(),
    );
  }
}
