import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpClient;

import '../model/video.dart';

class VideoFetchScreen extends StatefulWidget {
  const VideoFetchScreen({Key? key}) : super(key: key);

  @override
  State<VideoFetchScreen> createState() => _VideoFetchScreenState();
}

class _VideoFetchScreenState extends State<VideoFetchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchVideos();
  }

  fetchVideos() async {
    // var data = "waeffawg";

    // var date = '2022-09-08';
    // int.tryParse(data);
    // double.parse(data);
    // DateTime.parse(date);

    try {
      final endpoint =
          "https://pixabay.com/api/videos/?key=24747090-95c20607d87e00f7bea20cb40&q=cars&pretty=true";

      final response = await httpClient.get(Uri.parse(endpoint));
      final body = response.body;
      print(response.statusCode);

      final Map data = json.decode(body);

      final totalItems = data["total"];

      final List hits = data['hits'];

      final List<Video> videos = hits.map<Video>((item) {
        return Video.fromJson(item);
      }).toList();

      print(videos.length);
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
