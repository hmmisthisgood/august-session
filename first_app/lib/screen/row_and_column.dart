import 'package:flutter/material.dart';

class RowAndColumn extends StatelessWidget {
  const RowAndColumn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(height: 100, width: 100, color: Colors.red),
                Container(height: 100, width: 100, color: Colors.green),
                Container(height: 100, width: 100, color: Colors.black),
              ],
            ),
            SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.max,
              children: [
                Container(height: 100, width: 100, color: Colors.orange),
                Container(height: 100, width: 100, color: Colors.green),
                Container(height: 100, width: 100, color: Colors.pink),
              ],
            ),
            SizedBox(height: 50),
            Text("IAmCool"),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.favorite_border),
                Text("Like"),
                Icon(Icons.comment),
                Text("comment "),
                Text("Subscribe"),
                // Text('loooooooooooooooooooooooong')
              ],
            ),
            // Container(height: 700, color: Colors.purple)

            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Container(
                      color: Colors.yellow,
                      child: Text("Not big"),
                    )
                    // Container(color: Colors.red, height: 70),
                    ),
                Expanded(
                  flex: 3,
                  child: Container(color: Colors.black, height: 70),
                ),
              ],
            ),
            Container(
              color: Colors.grey,
              height: 700,
            )
          ],
        ));
  }
}

// main axis:
// cross axis:  

/// Row = horizontal
/// Column = vertical


/// Can be placed only inside row or column:
// Expanded 
// Flexible