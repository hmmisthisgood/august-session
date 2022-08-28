import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class DashboardScreen extends StatefulWidget {
  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int activeIndex = 0;

  Widget buildBottomNavigationBar() {
    return BottomNavigationBar(
      currentIndex: activeIndex,
      selectedItemColor: Colors.green,
      unselectedItemColor: Colors.black,
      onTap: (index) {
        activeIndex = index;

        print("value of activeIndex: $index");
        setState(() {});
      },
      items: [
        BottomNavigationBarItem(
          label: "Home",
          icon: Icon(Icons.home),
        ),
        BottomNavigationBarItem(
          label: "Search",
          icon: Icon(Icons.search),
        ),
        BottomNavigationBarItem(
          label: "Profile",
          icon: Icon(Icons.person),
        ),
      ],
    );
  }

  @override
  Widget build(Object context) {
    print("build called");
    return Scaffold(
        bottomNavigationBar: BottomAppBar(
      color: Colors.green,
      child: Container(height: 50),
    )

        //  buildBottomNavigationBar(),
        );
  }
}

/// BottomNavigationBar
/// BottomAppBar
///
///

class SomeWidget extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SomeWidgetState();
}

class _SomeWidgetState extends State {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
