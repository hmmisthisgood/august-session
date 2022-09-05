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

  bool isLoading = false;
  bool hasErrorOccurred = false;
  String errorMessage = "";
//
  @override
  void initState() {
    super.initState();
    fetchDataFromServer();
  }

  fetchDataFromServer() async {
    print("data fetch sarted");
    final endpoint = "https://1w2435jsonplaceholder.typicode.com/posts";

    final Uri url = Uri.parse(endpoint);

    try {
      isLoading = true;

      setState(() {});

      final response = await api.get(url);

      print("the status code is : ${response.statusCode}");

      print("the body is :");
      // print(response.body);
      data = response.body;
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

      isLoading = false;
      setState(() {});
    } catch (e) {
      isLoading = false;
      hasErrorOccurred = true;
      errorMessage = e.toString();

      setState(() {});
      print(e);
    }
  }

  postDataToServer() async {
    final endpoint = "https://jsodddddddddddddnplaceholder.typicode.com/posts";

    final Uri url = Uri.parse(endpoint);

    try {
      final response = await api.put(
        url,
        body: {"name": "my name is", "age": "100", "title": "post title"},
        // headers: {
        //   "Content-Type": "application/json",
        // },
      );

      print(response.statusCode);

      print(response.body);
    } catch (e, stackTrace) {
      print(e);
      print(stackTrace);
    }
  }

  Widget buildBodyWidget() {
    if (isLoading == true) {
      return Center(child: CircularProgressIndicator());
    }

    if (hasErrorOccurred == true) {
      return Center(child: Text(errorMessage));
    }

// isloading=false, hasErrorOccurred=false

    return ListView.builder(
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
    );
  }

  @override
  Widget build(BuildContext context) {
    // print("build called");
    return Scaffold(
        appBar: AppBar(),
        bottomNavigationBar: MaterialButton(
          color: Colors.green,
          onPressed: () {
            postDataToServer();
          },
          child: Text("Create post"),
        ),
        body: buildBodyWidget());
  }
}

/// CircularProgressIndicator
/// LinearProgressIndicator
