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

          Padding(
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

          /// actual post image
          ///
          Image.network(image),
          //// like comment share buttons

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.favorite_border_rounded,
                      size: 30,
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.comment,
                      size: 30,
                    ),
                    SizedBox(width: 15),
                    Icon(
                      Icons.send,
                      size: 30,
                    ),
                  ],
                ),
                Icon(
                  Icons.bookmark,
                  size: 30,
                ),
              ],
            ),
          ),

          /// caption

          Row(
            children: [
              Text("Liked By"),
              Text(" arjun and others",
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
          Text("18 Aug", style: TextStyle(color: Colors.grey))
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