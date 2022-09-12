import 'package:first_app/navigation/routes.dart';
import 'package:first_app/util/db_service.dart';
import 'package:first_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_vector_icons/flutter_vector_icons.dart';

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
    DbService.initOurCoolDatabase();
  }

  checkUserLoggedInStatus() async {
    bool isLoggedIn = await SharedPref.getIsUserLoggedIn();

    Future.delayed(Duration(seconds: 2), () {
      if (isLoggedIn == true) {
        Navigator.pushNamed(context, Routes.notesList);
      } else {
        Navigator.pushNamed(context, Routes.login);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Icon(FontAwesome.google),
      ),
    );
  }
}
