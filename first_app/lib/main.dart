// import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/cubit/auth/auth_cubit.dart';
import 'package:first_app/cubit/theme/theme_cubit.dart';
import 'package:first_app/util/multi_bloc_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation/custom_route_generator.dart';
import 'navigation/routes.dart';
import 'util/custom_theme.dart';

// import 'package:first_app/screen/homepage.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(new OurApp());
}

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, state) {
          return MaterialApp(
            title: "Our app",
            theme: CustomTheme.lightTheme,
            darkTheme: CustomTheme.darkTheme,

            // ThemeData(
            //   primarySwatch: Colors.red,
            //   fontFamily: "Oswald",
            // ),

            themeMode: state,
            onGenerateRoute: customRouteGenerator,
            // home: NotesScreen(),
            initialRoute: Routes.login,
          );
        },
      ),
    );
  }
}



/// Special widgets:
/// 1. MaterialApp/CupertinoApp


/// Most Common:
/// 1. Scaffold 

/// Shape:
/// 1. Container 