// sign up = register :you create account for the first time
// login = sign in : you already have account

import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State {
  bool hidePassword = true;
  int count = 11;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login")),
      body: Form(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextField(
                enabled: false,
                decoration: InputDecoration(
                  hintText: "Enter you email",
                  labelText: "Email",
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.green, width: 1)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red, width: 1)),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  enabledBorder: OutlineInputBorder(),
                  disabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow)),
                ),
              ),
              TextFormField(
                obscureText: hidePassword,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: InkWell(
                      onTap: () {
                        hidePassword = !hidePassword;
                        print(hidePassword);
                        setState(() {});
                      },
                      child: Icon(
                        hidePassword == true
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// condition? fist: second

/// widgets:
/// Form 
/// TextField 
/// TextFormField

// InputDecoration

/// GlobalKey

