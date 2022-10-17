import 'package:flutter/material.dart';

class CustomTheme {
  static final darkBg = Color(0xff282a36);
  static final darkThemeTextColor = Colors.white;
  static final lightThemeTextColor = Colors.black;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: darkBg,
    fontFamily: "Oswald",
    // iconTheme: IconThemeData(color: Colors.white),
    dividerColor: Colors.white,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 24, color: darkThemeTextColor, fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 22, color: darkThemeTextColor),
      headline3: TextStyle(fontSize: 20, color: darkThemeTextColor),
      headline4: TextStyle(fontSize: 18, color: darkThemeTextColor),
      headline5: TextStyle(fontSize: 16, color: darkThemeTextColor),
      headline6: TextStyle(fontSize: 14, color: darkThemeTextColor),
      bodyText1: TextStyle(fontSize: 12, color: darkThemeTextColor),
      bodyText2: TextStyle(fontSize: 10, color: darkThemeTextColor),
      subtitle1: TextStyle(fontSize: 8, color: darkThemeTextColor),
    ),
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    fontFamily: "Oswald",
    iconTheme: IconThemeData(color: Colors.red),
    dividerColor: Colors.black,
    textTheme: TextTheme(
      headline1: TextStyle(
          fontSize: 24,
          color: lightThemeTextColor,
          fontWeight: FontWeight.bold),
      headline2: TextStyle(fontSize: 22, color: lightThemeTextColor),
      headline3: TextStyle(fontSize: 20, color: lightThemeTextColor),
      headline4: TextStyle(fontSize: 18, color: lightThemeTextColor),
      headline5: TextStyle(fontSize: 16, color: lightThemeTextColor),
      headline6: TextStyle(fontSize: 14, color: lightThemeTextColor),
      bodyText1: TextStyle(fontSize: 12, color: lightThemeTextColor),
      bodyText2: TextStyle(fontSize: 10, color: lightThemeTextColor),
      subtitle1: TextStyle(fontSize: 8, color: lightThemeTextColor),
    ),
  );
}

// 8-10-12- 14-16-18-20-22-24
