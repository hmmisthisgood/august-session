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

          Container(
            color: Colors.yellow,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(40),
                          child: Image.network(
                            image,
                            height: 40,
                            width: 40,
                            fit: BoxFit.cover,
                          )),
                      SizedBox(width: 15),
                      Text("IAmBijay"),
                    ],
                  ),
                  Icon(Icons.more_horiz)
                ],
              ),
            ),
          ),

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


/// Icon= Widget 
/// IconData : Name of the icon. Example: Icons.home, Icons.search
/// 
/// Align

/// To make things circular
/// ClipRRect