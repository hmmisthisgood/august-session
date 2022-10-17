import 'package:first_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system);

  setLightTheme() {
    emit(ThemeMode.light);
    ////
    SharedPref.setIsDarkTheme(false);
  }

  setDarkTheme() {
    emit(ThemeMode.dark);
    SharedPref.setIsDarkTheme(true);
  }

  toggleTheme(bool isDarkMode) {
    if (isDarkMode == true) {
      setLightTheme();
    } else {
      setDarkTheme();
    }
  }

  getInitialTheme() async {
    bool isDarktheme = await SharedPref.getIsDarkTheme();

    if (isDarktheme) {
      setDarkTheme();
    } else {
      setLightTheme();
    }
  }
}
