// import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

class Homepage extends StatelessWidget {
  final image =
      "https://cdn.pixabay.com/photo/2022/07/24/05/43/lilies-7341051_960_720.jpg";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(),
      bottomNavigationBar: Container(height: 50, color: Colors.red),
      floatingActionButton: FloatingActionButton(onPressed: () {
        print("I am pressed");
      }),
      body:
          // Image.network(image)

          Container(
              // color: Colors.black,
              child: Center(
        child: Container(
          height: 100,
          width: 200,
          alignment: Alignment.topLeft,

          decoration: BoxDecoration(
            color: Colors.green.withOpacity(0.3),
            borderRadius: BorderRadius.circular(15),
            // shape: BoxShape.circle,
            // gradient: ,
            border: Border.all(width: 0.5, color: Colors.pink),
          ),

          // Color.fromRGBO(135, 134, 0, 0.2)
          // Color(0xff000ee00),
          child: Container(
            // height: 30,
            width: 100,
            padding: EdgeInsets.all(20),
            margin: EdgeInsets.all(10),
            color: Colors.orange,
            child: Text("Test"),

            //  Text("Finnaly done"),
          ),
        ),
      )),
    );
  }
}

/// Scaffold : creates a new screen 
/// AppBar 
/// Text

/// Container = box  : Imp
/// Icon 
/// Image

/// Layout 
/// 1. Row , Column   : Imp
/// 2. Stack 
/// 3. Align
/// 4. Center 

/// 5.Padding
/// 6. SizedBox 

/// Scroll:
/// ListView
/// GridView
/// SingelChildScrollView
/// TabView

