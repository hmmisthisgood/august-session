import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_app/bloc/video/vodeo_cubit.dart';
import 'package:http_app/screen/adv/futuer_b_screen.dart';
import 'package:http_app/screen/adv/value_l_screen.dart';

// import 'screen/homepage.dart';
import 'package:http_app/screen/video_fetch_with_bloc.dart';
import 'package:http_app/utils/env.dart';
import 'package:http_app/utils/string_constants.dart';

import 'screen/adv/stream_b_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final videCubit = VideoCubit();

  @override
  Widget build(BuildContext context) {
    return Env(
      baseUrl: Str.baseUrl,
      apiKey: Str.apiKey,
      env: "prod",
      child: MultiBlocProvider(
        providers: [
          BlocProvider<VideoCubit>(create: (ctx) {
            return videCubit;
          }),
        ],
        child: MaterialApp(home: StreamBScreen()),
      ),
    );
  }
}
