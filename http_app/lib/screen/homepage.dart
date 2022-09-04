import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as api;

import '../model/post.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String data = "hawa kura";

  List<Post> posts = [];

  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  get() {}
  fetchDataFromServer() async {
    print("data fetch sarted");
    final endpoint = "https://jsonplaceholder.typicode.com/posts";

    final Uri url = Uri.parse(endpoint);

    try {
      final response = await api.get(url);

      print("the status code is : ${response.statusCode}");

      print("the body is :");
      // print(response.body);
      data = response.body;
      setState(() {});
      final List decodedBody = json.decode(response.body);
      // posts = decodedBody;

      // posts = decodedBody
      //     .map<Post>(
      //       (e) => Post.convertJsontoPost(e),
      //     )
      //     .toList();

      posts = decodedBody.map<Post>(
        (e) {
          final converted = Post.toPost(e);
          print("Item converting");
          return converted;
        },
      ).toList();
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    // print("build called");
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          final post = posts[index];

          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${index + 1}. ${post.title}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(post.body),
              ],
            ),
          );
        },
      ),
      // Center(child: Text(data)),
    );
  }
}
