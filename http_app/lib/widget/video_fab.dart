import 'package:flutter/material.dart';
import 'package:http_app/bloc/video/vodeo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../utils/env.dart';

class VideoFAB extends StatelessWidget {
  const VideoFAB({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    return MyButton(text: text);
  }
}

class MyButton extends StatelessWidget {
  const MyButton({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  Widget build(BuildContext context) {
    final envText = Env.of(context).env;

    final width = MediaQuery.of(context).size.width;
    final theme = Theme.of(context);
    final videoCubit = BlocProvider.of<VideoCubit>(context);

    print("env at My button Fab is: $envText");

    return FloatingActionButton(
      onPressed: () {
        Navigator.of(context).pop();

        context.read<VideoCubit>().fetchVideos();
      },
      child: Text(envText),
    );
  }
}
