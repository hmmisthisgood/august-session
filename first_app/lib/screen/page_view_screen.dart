import 'dart:math';

import 'package:first_app/screen/stack_screen.dart';
import 'package:flutter/material.dart';

class PageViewScreen extends StatelessWidget {
  Widget buildNormalPageView() {
    return PageView(
      scrollDirection: Axis.vertical,
      onPageChanged: (index) {
        print("current page is : $index");
      },
      children: [
        StackScreen(),
        StackScreen(),
        StackScreen(),
        StackScreen(),
        StackScreen(),
        StackScreen(),
        Container(color: Colors.red),
        Container(color: Colors.blue),
        Container(color: Colors.purple),
        Container(color: Colors.black),
      ],
    );
  }

  Widget buildpageViewWithBuilder() {
    return PageView.builder(
      itemCount: 50,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        return Container(
          color: Color.fromRGBO(
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextInt(255),
            Random().nextDouble(),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: buildpageViewWithBuilder());
  }
}

// PageView 
// PageView.builder