import 'package:flutter/material.dart';

// import 'screen/homepage.dart';
import 'package:http_app/screen/video_fetch_with_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: VideoFetchWithBloc(),
    );
  }
}
