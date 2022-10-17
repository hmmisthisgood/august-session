import 'package:first_app/cubit/auth/auth_cubit.dart';
import 'package:first_app/cubit/theme/theme_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MultiProvider extends StatelessWidget {
  const MultiProvider({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AuthCubit()),
        BlocProvider(create: (context) => ThemeCubit()..getInitialTheme()),
      ],
      child: child,
    );
  }
}
