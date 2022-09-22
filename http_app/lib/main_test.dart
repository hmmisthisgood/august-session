import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_app/bloc/video/vodeo_cubit.dart';

// import 'screen/homepage.dart';
import 'package:http_app/screen/video_fetch_with_bloc.dart';
import 'package:http_app/utils/env.dart';
import 'package:http_app/utils/string_constants.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final videCubit = VideoCubit();

  @override
  Widget build(BuildContext context) {
    return Env(
      baseUrl: "https://dev.pixabay.com/api/videos",
      apiKey: "test-api-key",
      env: "test",
      child: MultiBlocProvider(
        providers: [
          BlocProvider<VideoCubit>(create: (ctx) {
            return videCubit;
          }),
        ],
        child: MaterialApp(
          home: VideoFetchWithBloc(
            text: "press",
          ),
        ),
      ),
    );
  }
}
