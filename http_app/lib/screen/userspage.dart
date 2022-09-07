import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as client;
import 'package:http_app/model/user.dart';

class UsersPage extends StatefulWidget {
  const UsersPage({Key? key}) : super(key: key);

  @override
  State<UsersPage> createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<User> users = [];
  @override
  void initState() {
    super.initState();
  }

  getUsers() async {
    try {
      final endpoint = "https://jsonplaceholder.typicode.com/users";
      final response = await client.get(Uri.parse(endpoint));

      final List decoded = json.decode(response.body);

      final user1 = decoded[0];
      User.convertToUser(user1);

      users = decoded
          .map<User>((listItem) => User.convertToUser(listItem))
          .toList();
      setState(() {});
    } catch (e, s) {
      print(e);
      print(s);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          final user = users[index];

          return Text(user.address.city);
        },
      ),
    );
  }
}
