import 'dart:math';

import 'package:first_app/screen/dashboard_screen.dart';
import 'package:first_app/screen/gridview_screen.dart';
import 'package:first_app/screen/homepage.dart';
import 'package:first_app/screen/page_view_screen.dart';
import 'package:first_app/screen/posts_screen.dart';
import 'package:first_app/screen/row_and_column.dart';
import 'package:first_app/screen/stful/counter_screen.dart';
import 'package:first_app/screen/stful/login_form_screen.dart';
import 'package:first_app/screen/tabview_screen.dart';
import 'package:first_app/screen/tiktok_skeleton.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/material.dart';

import '../navigation/routes.dart';
import 'insta_post.dart';

class NavigationScreen extends StatelessWidget {
  NavigationScreen({Key? key}) : super(key: key);

  final List<Map> screens = [
    {
      "name": "Login Screen",
      "routeName": Routes.login,
      "widget": LoginScreen()
    },
    {
      "name": "Counter Screen",
      "routeName": Routes.login,
      "widget": CounterScreen()
    },
    {
      "name": "Dashboaord Screen",
      "routeName": Routes.login,
      "widget": DashboardScreen()
    },
    {
      "name": "Gridview Screen",
      "routeName": Routes.login,
      "widget": GridViewScreen()
    },
    {
      "name": "Homepage Screen",
      "routeName": Routes.login,
      "widget": Homepage()
    },
    {
      "name": "Insa post Screen",
      "routeName": Routes.instaHome,
      "widget": IgHomePage()
    },
    {
      "name": "PageView  Screen",
      "routeName": Routes.pageview,
      "widget": PageViewScreen()
    },
    {
      "name": "PostScreen Screen",
      "routeName": Routes.login,
      "widget": PostsScreen()
    },
    {
      "name": "Row And column Screen",
      "routeName": Routes.login,
      "widget": RowAndColumn()
    },
    {
      "name": "tabview Screen",
      "routeName": Routes.login,
      "widget": TabScreen()
    },
    {
      "name": "Tiktok Screen",
      "routeName": Routes.login,
      "widget": TikTokSkeleton()
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Navigator")),
      body: ListView.builder(
        itemCount: screens.length,
        itemBuilder: (context, index) {
          final screen = screens[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: MaterialButton(
              color: Color.fromRGBO(Random().nextInt(240),
                  Random().nextInt(240), Random().nextInt(240), 1),
              onPressed: () {
                final route =
                    MaterialPageRoute(builder: (_) => screen['widget']);
                // Navigator.push(context, route);
                Navigator.pushNamed(context, screen['routeName']);

                // Navigator.pushReplacement(context, route);

                // Navigator.pushAndRemoveUntil(
                //   context,
                //   route,
                //   (route) => false,
                // );
              },
              child: Text(
                screen['name'],
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          );
        },
      ),
    );
  }
}

/// Navigator 
/// |--- push : go to new screen
/// |---- pop : go back

/// Named navigation:
/// |------: pushNamed
/// |-------: pushReplacemntNamed 


/// Route:
/// |----- MaterialPageRoute :
/// |----- CupertinoPageRoute
/// 

/// WillPopScope: detects the press of back button