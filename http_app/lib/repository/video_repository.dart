import 'package:dio/dio.dart';
import 'package:http_app/model/video.dart';

import '../utils/string_constants.dart';

class VideoRepository {
  final Dio dio = Dio(BaseOptions(receiveDataWhenStatusError: true));

  Future<List<Video>> fetchVideos(
      {int currentPage = 1, int perPage = 5, String query = "cars"}) async {
    try {
      final endpoint = Str.baseUrl;

      final response = await dio.get(endpoint, queryParameters: {
        "key": Str.apiKey,
        "q": "cars",
        "page": currentPage,
        "per_page": 5,
      });

      final Map body = response.data;
      print(response.statusCode);

      // final Map data = json.decode(body); // already json data is decoded in by Dio

      final List hits = body['hits'];

      final List<Video> videos = hits.map<Video>((item) {
        return Video.fromJson(item);
      }).toList();
      return videos;
    } catch (e, s) {
      throw e;
    }
  }
}
