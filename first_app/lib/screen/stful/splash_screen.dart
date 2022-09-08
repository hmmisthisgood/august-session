import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../navigation/routes.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    checkUserLoggedInStatus();
  }

  checkUserLoggedInStatus() async {
    final instance = await SharedPreferences.getInstance();

    bool isLoggedIn = instance.getBool("isLoggedIn") ?? false;

    if (isLoggedIn == true) {
      Navigator.pushNamed(context, Routes.instaHome);
    } else {
      Navigator.pushNamed(context, Routes.login);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
