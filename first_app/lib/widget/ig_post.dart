import 'package:flutter/material.dart';

// final post = {
//   "id": 12312,
//   "username": "IamBijay",
//   "profilePicture": "https://example.jpg",
//   "postImageUrl": "https://image.jpg",
//   "datePosted": "May 10"
// };

class IgPost extends StatelessWidget {
  final Map<String, dynamic> postData;

  IgPost({required this.postData});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final screenHHeight = MediaQuery.of(context).size.height;

    print("Ig post build");
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
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
                        postData['profilePicture'],
                        height: 40,
                        width: 40,
                        fit: BoxFit.cover,
                      )),
                  SizedBox(width: 15),
                  Text(postData['username'].toString().toUpperCase()),
                ],
              ),
              Icon(Icons.more_horiz)
            ],
          ),
        ),

        /// actual post image
        ///
        Image.network(
          postData["postImageUrl"],
          width: screenWidth,
          height: screenHHeight * 0.4,
          fit: BoxFit.cover,
        ),
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

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Row(
            children: [
              Text("Liked By"),
              Text(" arjun and others",
                  style: TextStyle(fontWeight: FontWeight.bold))
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(postData['datePosted'],
              style: TextStyle(color: Colors.grey)),
        ),

        Container(height: 50),
      ],
    );
  }
}
