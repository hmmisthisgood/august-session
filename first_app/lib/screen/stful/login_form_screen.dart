// sign up = register :you create account for the first time
// login = sign in : you already have account

import 'package:first_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../widget/common_textfield_widget.dart';

class LoginScreen extends StatefulWidget {
  @override
  State createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State {
  bool hidePassword = true;
  int count = 11;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final emailController = TextEditingController(text: "test@test.com");
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(title: Text("login")),
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            TextFormField(
              controller: emailController,
              // enabled: false,

              keyboardType: TextInputType.emailAddress,

              onFieldSubmitted: (data) {
                print("-------on submitted called-------");
                print(data);
              },
              onChanged: (val) {
                // print(val);
              },

              validator: (val) {
                if (val == null) {
                  return "Email is required";
                }

                if (val.contains("@") == false) {
                  return "Email must be valid";
                }
              },

              // autofocus: true,
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                hintText: "Enter you email",
                labelText: "Email",
                prefixIcon: Icon(Icons.email),
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(30)),
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
              controller: passwordController,
              obscureText: hidePassword,
              validator: (val) {
                if (val == null) {
                  return "Password is required";
                }

                if (val.length < 5) {
                  return "Password must be more than 5 characters";
                }
              },
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
            CommonTextField(
              controller: emailController,
              label: "Email",
            ),
            CommonTextField(controller: emailController),
            SizedBox(height: 20),
            MaterialButton(
              onPressed: () async {
                if (formKey.currentState != null) {
                  formKey.currentState!.save();

                  bool isValid = formKey.currentState!.validate();

                  final _email = emailController.text;
                  final _paass = passwordController.text;
                  print(_email);
                  print(_paass);

                  // emailController.clear();
                  emailController.text = "I am setting custom text";
                  passwordController.clear();

                  if (isValid) {
                    /// send data to server for chekcing

                    // if login successful

                    SharedPref.setUserLoggedIn(true);
                    // instance.setString("somedata", "");

                    // Navigator.push(context, route)
                  }

                  // final isLoggedIn = instance.getBool("isLoggedIn");
                  // print("is user logged in: $isLoggedIn");
                }
              },
              color: Colors.blue,
              child: Text(
                "SIGN IN",
                style: TextStyle(color: Colors.white, letterSpacing: 2),
              ),
            )
          ],
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
