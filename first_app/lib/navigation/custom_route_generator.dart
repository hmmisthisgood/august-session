import 'package:first_app/screen/insta_post.dart';
import 'package:first_app/screen/navigation_screen.dart';
import 'package:first_app/screen/page_view_screen.dart';
import 'package:first_app/screen/stful/login_form_screen.dart';
import 'package:first_app/screen/stful/splash_screen.dart';
import 'package:flutter/material.dart';

import 'routes.dart';

Route customRouteGenerator(RouteSettings settings) {
  final routeName = settings.name;

  switch (routeName) {
    case Routes.splash:
      return MaterialPageRoute(builder: (_) => SplashScreen());

    case Routes.login:
      return MaterialPageRoute(builder: (_) => LoginScreen());

    case Routes.instaHome:
      return MaterialPageRoute(builder: (_) => IgHomePage());
    case Routes.pageview:
      return MaterialPageRoute(builder: (_) => PageViewScreen());
    case Routes.nav:
      return MaterialPageRoute(builder: (_) => NavigationScreen());
    default:
      return MaterialPageRoute(builder: (_) => LoginScreen());
  }
}
