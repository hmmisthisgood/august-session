import 'package:flutter/material.dart';

class InstaPost extends StatelessWidget {
  const InstaPost({Key? key}) : super(key: key);
  final image =
      "https://cdn.pixabay.com/photo/2022/07/24/05/43/lilies-7341051_960_720.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          /// username and profile picture

          /// actual post image
          ///
          Image.network(image)
          //// like comment share buttons

          /// caption
        ],
      ),
    );
  }
}
