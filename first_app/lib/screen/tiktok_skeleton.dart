import 'package:first_app/util/constants.dart';
import 'package:flutter/material.dart';

class TikTokSkeleton extends StatelessWidget {
  const TikTokSkeleton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        height: 50,
        color: Colors.orange,
      ),
      body: Stack(
        children: [
          /// background
          Image.network(
            Constants.image1,
            height: double.infinity,
            fit: BoxFit.cover,
          ),

          FadeInImage(
            placeholder: AssetImage("assets/images/pool.jpg"),
            image: NetworkImage(Constants.image1),
            height: double.infinity,
            width: double.infinity,
            fit: BoxFit.cover,
            alignment: Alignment.centerLeft,
          ),

          // Image.asset(
          //   "assets/images/pool.jpg",
          //   height: double.infinity,
          //   width: double.infinity,
          //   fit: BoxFit.cover,
          //   alignment: Alignment.centerLeft,
          // ),

          /// follow/following bar
          Positioned(
            top: 50,
            left: 100,
            child: Container(
              height: 60,
              width: 200,
              color: Colors.white,
            ),
          ),

          /// captions and username
          Positioned(
            bottom: 0,
            child: Container(
              height: 150,
              width: 200,
              color: Colors.purple,
            ),
          ),

          //// vertical controls
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: 90,
              height: 350,
              color: Colors.green,
            ),
          )
        ],
      ),
    );
  }
}

// Image providers: 
// AssetImage 
// NetworkImage
// FileImage