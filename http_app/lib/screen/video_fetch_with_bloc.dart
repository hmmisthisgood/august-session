import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_app/bloc/video/video_state.dart';
import 'package:http_app/bloc/video/vodeo_cubit.dart';
import 'package:http_app/utils/env.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../widget/video_fab.dart';

class VideoFetchWithBloc extends StatefulWidget {
  const VideoFetchWithBloc({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  State<VideoFetchWithBloc> createState() => _VideoFetchWithBlocState();
}

class _VideoFetchWithBlocState extends State<VideoFetchWithBloc> {
  final ScrollController controller = ScrollController();
  final RefreshController refreshController = RefreshController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<VideoCubit>(context).fetchVideos();
    // context.read<VideoCubit>().fetchVideos(); // same thing as above
    controller.addListener(listner);
  }

  listner() {
    final ScrollPosition position = controller.position;

    final double currentPixel = position.pixels;
    print("current Pixel:$currentPixel");
    final bool atEdge = position.atEdge;

    /// max
    final max = position.maxScrollExtent;

    print("Max extent: $max");

    /// min

    final min = position.minScrollExtent;

    if (currentPixel >= max && atEdge) {
      print("I am at the end of scroll");
      context.read<VideoCubit>().fetchMoreVideos();
    }

    if (currentPixel <= min || atEdge) {
      print("I am at the begining of scroll");
    }
  }

  onRefresh() {
    context.read<VideoCubit>().refreshVideos();
  }

  @override
  Widget build(BuildContext context) {
    final envText = Env.of(context).env;

    return Env(
      baseUrl: "",
      env: "hawa",
      apiKey: "",
      child: Scaffold(
          // floatingActionButton: FloatingActionButton(
          //   onPressed: () {
          //     // controller.animateTo(
          //     //   0,
          //     //   duration: Duration(milliseconds: 800),
          //     //   curve: Curves.ease,
          //     // );
          //     controller.jumpTo(0);
          //   },
          // ),
          floatingActionButton: VideoFAB(
            text: widget.text,
          ),
          body: Center(
            child: BlocConsumer<VideoCubit, VideoState>(
              listener: (context, state) {
                if (state is VideoFetchSuccess) {
                  Fluttertoast.showToast(msg: "Videos fetched succss");

                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (_) => Scaffold(
                  //               appBar: AppBar(),
                  //             )));
                }

                if (state is VideoRefreshingError) {
                  Fluttertoast.showToast(msg: state.errorMessage);
                  refreshController.refreshFailed();
                }
                if (state is VideoRefreshSuccess) {
                  refreshController.refreshCompleted();
                }
              },
              builder: (context, state) {
                print(state);
                if (state is VideoFetchLoading || state is VideoInitial) {
                  return CircularProgressIndicator();
                }

                if (state is VideoFetchError) {
                  return Text(state.errorMessage);
                }

                if (state is VideoFetchSuccess ||
                    state is VideoLoadingMoreData ||
                    state is VideoRefreshingState ||
                    state is VideoRefreshingError ||
                    state is VideoRefreshSuccess) {
                  return Column(
                    children: [
                      Expanded(
                        child: SmartRefresher(
                          controller: refreshController,
                          onRefresh: onRefresh,
                          child: ListView.builder(
                            controller: controller,
                            physics: BouncingScrollPhysics(),
                            itemCount: state.data.length,
                            itemBuilder: (context, index) {
                              final item = state.data[index];
                              return Column(
                                children: [
                                  Image.network(item.userImageUrl),
                                ],
                              );
                            },
                          ),
                        ),
                      ),
                      if (state is VideoLoadingMoreData)
                        CircularProgressIndicator()
                    ],
                  );
                }

                return Text("unknown strate");
              },
            ),
          )),
    );
  }
}

/// BlocBuilder = used for just building UI
/// BlocListener = used for side effects
/// BlocConsumer = builder + listener
/// BlocProvider = provides / ditribute bloc/cubit
/// MultiBlocProvider
/// MultiBlocListener
/// RepositoryProvider
/// "is" = to check the data type of variable/object
