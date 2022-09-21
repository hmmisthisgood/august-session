// import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:first_app/cubit/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation/custom_route_generator.dart';
import 'navigation/routes.dart';

// import 'package:first_app/screen/homepage.dart';

main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp();

  runApp(new OurApp());
}

class OurApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new BlocProvider(
      create: (context) => AuthCubit(),
      child: MaterialApp(
        title: "Our app",
        theme: ThemeData(
          primarySwatch: Colors.purple,
          fontFamily: "Oswald",
        ),
        onGenerateRoute: customRouteGenerator,
        // home: NotesScreen(),
        initialRoute: Routes.login,
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