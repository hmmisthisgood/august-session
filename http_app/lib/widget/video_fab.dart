import 'package:flutter/material.dart';
import 'package:http_app/bloc/video/vodeo_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VideoFAB extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.read<VideoCubit>().fetchVideos();
      },
    );
  }
}
