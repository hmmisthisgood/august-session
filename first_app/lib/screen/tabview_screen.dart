import 'package:first_app/screen/gridview_screen.dart';
import 'package:first_app/screen/posts_screen.dart';
import 'package:first_app/screen/stack_screen.dart';
import 'package:first_app/screen/tiktok_skeleton.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TabScreen extends StatelessWidget {
  PreferredSizeWidget buildTabBar() {
    return TabBar(
      isScrollable: true,
      onTap: (index) {},
      labelColor: Colors.green,
      labelStyle: GoogleFonts.pacifico(
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      unselectedLabelColor: Colors.black54,
      unselectedLabelStyle: GoogleFonts.pacifico(
        textStyle: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
      ),
      indicatorColor: Colors.green,
      indicatorSize: TabBarIndicatorSize.label,
      tabs: [
        Text("For You"),
        Text("Top Charts"),
        Text("Categorues"),
        Text("Editors choice")
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      initialIndex: 1,
      child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            // bottom: buildTabBar(),
          ),
          body: Column(
            children: [
              Container(height: 300, color: Colors.orange),
              buildTabBar(),
              Flexible(
                child: TabBarView(
                  physics: BouncingScrollPhysics(),
                  children: [
                    GridViewScreen(),
                    StackScreen(),
                    TikTokSkeleton(),
                    PostsScreen()
                  ],
                ),
              ),
            ],
          )),
    );
  }
}

/// TabBar
/// TabBarView
/// DefaultTabController
///
