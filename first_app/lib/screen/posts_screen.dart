import 'package:first_app/widget/ig_post.dart';
import 'package:flutter/material.dart';

class PostsScreen extends StatelessWidget {
  static final image1 =
      "https://cdn.pixabay.com/photo/2022/07/30/03/13/eibsee-7352987_960_720.jpg";

  static final image2 =
      "https://cdn.pixabay.com/photo/2022/06/18/12/40/muenster-7269726_960_720.jpg";

  List<Map<String, dynamic>> postsList = [
    {
      "id": 12312,
      "username": "IamRamesh",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamBijay",
      "profilePicture": image2,
      "postImageUrl": image1,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamArjun",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamJaisi",
      "profilePicture": image2,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamLok",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamSandip",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamRamesh",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamRamesh",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamRamesh",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamRamesh",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamRamesh",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamRamesh",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamRamesh",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamRamesh",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamRamesh",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamRamesh",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
    {
      "id": 12312,
      "username": "IamRamesh",
      "profilePicture": image1,
      "postImageUrl": image2,
      "datePosted": "Aug 21"
    },
  ];

  Widget buildWithNormalListView() {
    return ListView(
      children: [
        Text("Random stuff"),
        Container(height: 150, color: Colors.green),
        IgPost(
          postData: {
            "id": 12312,
            "username": "IamRamesh",
            "profilePicture": image1,
            "postImageUrl": image2,
            "datePosted": "Aug 21"
          },
        ),
      ],
    );
  }

  Widget buildWithListViewBuilder() {
    return ListView.builder(
      itemCount: postsList.length,
      scrollDirection: Axis.vertical,
      itemBuilder: (context, index) {
        // 0, 1, 2, 3-----
        final post = postsList[index];
        // post['username'] = post["username"].toString().toUpperCase();
        // print(post['username']);

        return IgPost(postData: post);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(),
      body: SafeArea(
        child: buildWithListViewBuilder(),
      ),
    );
  }
}

/// ListView 
/// ListView.builder 
/// 
/// SafeArea