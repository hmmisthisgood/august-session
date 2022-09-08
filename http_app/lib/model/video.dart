// {
//             "id":19627,
//             "pageURL":"https://pixabay.com/videos/id-19627/",
//             "type":"film",
//             "tags":"street, traffic, cars",
//             "duration":17,
//             "picture_id":"744034014-81fd7fd828ec99c50f3f8cf006a942bc3bd1586e9b4770939bf55dac76f69ef5-d",
//
//
//  "videos":{
//                 "large":{
//                     "url":"https://cdn.pixabay.com/vimeo/304735769/Street%20-%2019627.mp4?width=3840&hash=9b83be2ba8c2d9c689900f33b16b1f45cc64d53d",
//                     "width":3840,
//                     "height":2160,
//                     "size":34933926
//                 },
//                 "medium":{
//                     "url":"https://cdn.pixabay.com/vimeo/304735769/Street%20-%2019627.mp4?width=2560&hash=1da9a00279830822c5b8b9e7ff45b0f25094075d",
//                     "width":2560,
//                     "height":1440,
//                     "size":16028004
//                 },
//                 "small":{
//                     "url":"https://cdn.pixabay.com/vimeo/304735769/Street%20-%2019627.mp4?width=1920&hash=c12e09615eb52f89049f94ca1b5a8db97089695c",
//                     "width":1920,
//                     "height":1080,
//                     "size":9911185
//                 },
//                 "tiny":{
//                     "url":"https://cdn.pixabay.com/vimeo/304735769/Street%20-%2019627.mp4?width=1280&hash=991bfae1d7086518f329cd70edb9fb308bd66930",
//                     "width":1280,
//                     "height":720,
//                     "size":4684024
//                 }
//             },
//
//              "views":354142,
//             "downloads":169757,
//             "likes":754,
//             "comments":228,
//             "user_id":10829809,
//             "user":"JoteF",
//             "userImageURL":"https://cdn.pixabay.com/user/2018/11/28/11-24-12-474_250x250.jpg"
//         },

import 'dart:convert';

import 'package:http_app/model/video_sizes.dart';

class Video {
  final id, duration, views, downloads, likes, comments, userId;

  final String pageUrl, type, tags, pictureId, user, userImageUrl;
  final VideoSizes videoSizes;

  Video(
      {required this.id,
      required this.duration,
      required this.views,
      required this.downloads,
      required this.likes,
      required this.comments,
      required this.userId,
      required this.pageUrl,
      required this.type,
      required this.tags,
      required this.pictureId,
      required this.user,
      required this.userImageUrl,
      required this.videoSizes});

  static Video fromJson(Map json) {
    return Video(
      id: json['id'],
      duration: json['duration'],
      views: json['views'],
      downloads: json['downloads'],
      likes: json['likes'],
      comments: json['comments'],
      userId: json['userId'],
      pageUrl: json['pageURL'],
      type: json['type'],
      tags: json['tags'],
      pictureId: json['picture_id'],
      user: json['user'],
      userImageUrl: json['userImageURL'],
      videoSizes: VideoSizes.fromJson(json['videos']),
    );
  }
}
