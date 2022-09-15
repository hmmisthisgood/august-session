import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_app/bloc/video/video_state.dart';
import 'package:http_app/bloc/video/vodeo_cubit.dart';

class VideoFetchWithBloc extends StatefulWidget {
  const VideoFetchWithBloc({Key? key}) : super(key: key);

  @override
  State<VideoFetchWithBloc> createState() => _VideoFetchWithBlocState();
}

class _VideoFetchWithBlocState extends State<VideoFetchWithBloc> {
  VideoCubit videoBloc = VideoCubit();

  @override
  void initState() {
    super.initState();
    videoBloc.fetchVideos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: BlocConsumer(
        bloc: videoBloc,
        listener: (context, state) {
          if (state is VideoFetchSuccess) {
            Fluttertoast.showToast(msg: "Videos fetched succss");

            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (_) => Scaffold(
                          appBar: AppBar(),
                        )));
          }
        },
        builder: (context, state) {
          print(state);
          if (state is VideoFetchLoading) {
            return CircularProgressIndicator();
          }

          if (state is VideoFetchError) {
            return Text(state.errorMessage);
          }

          if (state is VideoFetchSuccess) {
            return ListView.builder(
              itemCount: state.data.length,
              itemBuilder: (context, index) {
                return Text("successdata ");
              },
            );
          }
          return Text("unknown strate");
        },
      ),
    ));
  }
}


/// BlocBuilder = used for just building UI
/// BlocListener = used for side effects
/// BlocConsumer = builder + listener
/// BlocProvider = provides / ditribute bloc/cubit
/// RepositoryProvider 
/// "is" = to check the data type of variable/object