import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_app/model/video.dart';
import 'package:dio/dio.dart';
import 'package:http_app/utils/string_constants.dart';
import 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  final Dio dio = Dio(BaseOptions(receiveDataWhenStatusError: true));

  fetchVideos() async {
    try {
      emit(VideoFetchLoading());

      final endpoint = "https://pixabay.com/api/videos";

      final response = await dio.get(endpoint, queryParameters: {
        "key": Str.apiKey,
        "q": "cars",
      });

      final Map body = response.data;
      print(response.statusCode);

      // final Map data = json.decode(body); // already json data is decoded in by Dio

      final int totalItems = body["total"];

      final List hits = body['hits'];

      final List<Video> videos = hits.map<Video>((item) {
        return Video.fromJson(item);
      }).toList();

      emit(VideoFetchSuccess(data: videos));
      print(videos.length);
    } catch (e, s) {
      print(e);
      print(s);

      emit(VideoFetchError(errorMessage: "An error occurred"));
    }
  }

  fetchMoreVideos() {}
}

// Cubit
// Bloc
// State
// emit
