import 'package:http_app/model/video.dart';

abstract class VideoState {
  const VideoState();
}

class VideoInitial extends VideoState {}

class VideoFetchLoading extends VideoState {}

class VideoFetchError extends VideoState {
  final String errorMessage;
  const VideoFetchError({required this.errorMessage});
}

class VideoFetchSuccess extends VideoState {
  final List<Video> data;

  VideoFetchSuccess({required this.data});
}
