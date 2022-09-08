class VideoSizes {
  final Resolution large, medium, small, tiny;

  VideoSizes(
      {required this.large,
      required this.medium,
      required this.small,
      required this.tiny});

  static VideoSizes fromJson(Map json) {
    return VideoSizes(
      large: Resolution.fromJson(json['large']),
      medium: Resolution.fromJson(json['medium']),
      small: Resolution.fromJson(json['small']),
      tiny: Resolution.fromJson(json['tiny']),
    );
  }
}

//              {
//     "url":"https://cdn.pixabay.com/vimeo/304735769/Street%20-%2019627.mp4?width=2560&hash=1da9a00279830822c5b8b9e7ff45b0f25094075d",
//     "width":2560,
//     "height":1440,
//     "size":16028004
// }

class Resolution {
  final int width, height, size;

  final String url;

  Resolution(
      {required this.width,
      required this.height,
      required this.size,
      required this.url});

  static Resolution fromJson(Map json) {
    final resolution = Resolution(
      width: json['width'],
      height: json['height'],
      size: json['size'],
      url: json['url'],
    );
    return resolution;
  }
}
