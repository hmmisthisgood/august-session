import 'package:flutter/material.dart';

import '../util/constants.dart';

class StackScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final theme = Theme.of(context);

    return Scaffold(
      body: Stack(
        children: [
          ///
          Container(
            child: Image.network(
              Constants.image1,
              fit: BoxFit.cover,
              height: height,
            ),
          ),

          Container(color: Colors.white.withOpacity(0.5)),

          ///
          Positioned(
            bottom: 100,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(80),
                child: Image.network(
                  Constants.image1,
                  height: 140,
                  width: 140,
                  fit: BoxFit.cover,
                )
                // Icon(
                //   Icons.person,
                //   size: 100,
                //   color: Colors.white,
                // ),
                ),
          ),
          Positioned(
            bottom: 100,
            left: 100,
            // left: 0,
            // right: 0,
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.blue,
                  shape: BoxShape.circle,
                  border: Border.all(width: 4, color: Colors.white)),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 40,
              ),
            ),
          )

          ///
        ],
      ),
    );
  }
}

// Align 
// Positioned 
// CirclAvtar