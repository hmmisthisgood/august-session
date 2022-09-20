import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_app/model/video.dart';
import 'package:dio/dio.dart';
import 'package:http_app/repository/video_repository.dart';
import 'package:http_app/utils/string_constants.dart';
import 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  final Dio dio = Dio(BaseOptions(receiveDataWhenStatusError: true));
  final VideoRepository _videoRepository = VideoRepository();

  int _currentPage = 1;
  List<Video> _allVideos = [];

  fetchVideos() async {
    try {
      _currentPage = 1;
      _allVideos.clear();

      emit(VideoFetchLoading());
      final videos =
          await _videoRepository.fetchVideos(perPage: 10, query: "bikes");

      _allVideos.addAll(videos);

      emit(VideoFetchSuccess(data: videos));
      print(videos.length);
    } catch (e, s) {
      print(e);
      print(s);

      emit(VideoFetchError(errorMessage: "An error occurred"));
    }
  }

  refreshVideos() async {
    try {
      _currentPage = 1;

      emit(VideoRefreshingState(data: _allVideos));

      final refreshVideos =
          await _videoRepository.fetchVideos(perPage: 5, query: "bikes");
      _allVideos.clear();

      _allVideos.addAll(refreshVideos);

      emit(VideoRefreshSuccess(data: refreshVideos));
    } catch (e, s) {
      print(e);
      print(s);

      emit(VideoRefreshingError(
          errorMessage: "An error occurred", data: _allVideos));
    }
  }

  fetchMoreVideos() async {
    _currentPage = _currentPage + 1;

    try {
      emit(VideoLoadingMoreData(data: _allVideos));

      final loadMoreVideos = await _videoRepository.fetchVideos(
          currentPage: _currentPage, perPage: 5);

      _allVideos.addAll(loadMoreVideos);

      emit(VideoFetchSuccess(data: _allVideos));
    } catch (e, s) {
      print(e);
      print(s);

      emit(VideoLoadMoreError(
          errorMessage: "An error occurred", data: _allVideos));
    }
  }
}

// Cubit
// Bloc
// State
// emit
