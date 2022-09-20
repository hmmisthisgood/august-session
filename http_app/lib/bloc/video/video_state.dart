import 'package:http_app/model/video.dart';

abstract class VideoState {
  const VideoState({this.data = const []});

  final List<Video> data;
}

class VideoInitial extends VideoState {}

class VideoFetchLoading extends VideoState {}

class VideoFetchError extends VideoState {
  final String errorMessage;
  const VideoFetchError({required this.errorMessage});
}

class VideoFetchSuccess extends VideoState {
  final List<Video> data;

  VideoFetchSuccess({required this.data}) : super(data: data);
}

class VideoLoadingMoreData extends VideoState {
  final List<Video> data;

  VideoLoadingMoreData({required this.data}) : super(data: data);
}

class VideoLoadMoreError extends VideoState {
  final List<Video> data;
  final String errorMessage;

  VideoLoadMoreError({required this.data, required this.errorMessage});
}

class VideoRefreshingState extends VideoState {
  final List<Video> data;

  VideoRefreshingState({required this.data});
}

class VideoRefreshSuccess extends VideoState {
  final List<Video> data;

  VideoRefreshSuccess({required this.data});
}

class VideoRefreshingError extends VideoState {
  final List<Video> data;
  final String errorMessage;

  VideoRefreshingError({required this.data, required this.errorMessage})
      : super(data: data);
}
