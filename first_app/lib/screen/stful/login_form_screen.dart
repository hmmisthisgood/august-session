// sign up = register :you create account for the first time
// login = sign in : you already have account

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screen/stful/signup_screen.dart';
import 'package:first_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

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

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  login() async {
    try {
      final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: emailController.text, password: passwordController.text);

      print(credential.toString());

      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null && currentUser.emailVerified == false) {
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      }

      Fluttertoast.showToast(msg: "Sign in successful");

      SharedPref.setUserLoggedIn(true);

      // FirebaseAuth.instance.signOut();

    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);

      Fluttertoast.showToast(msg: e.message ?? "An error occurred");
    } catch (e, s) {
      print(e);
      print(s);
    }
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
            CommonTextField(
              controller: emailController,
              label: "Email",
              validator: EmailValidator(errorText: "Email must be valid"),
            ),
            CommonTextField(
              controller: passwordController,
              label: "Password",
              hintText: "Enter your password",
              obscureText: true,
              validator: MultiValidator([
                RequiredValidator(errorText: 'password is required'),
                MinLengthValidator(8,
                    errorText: 'password must be at least 6 digits long'),
              ]),
            ),
            Text("Forgot Password"),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                minWidth: double.infinity,
                onPressed: () async {
                  if (formKey.currentState != null) {
                    formKey.currentState!.save();

                    bool isValid = formKey.currentState!.validate();

                    if (isValid) {
                      login();
                    }
                  }
                },
                color: Colors.blue,
                child: Text(
                  "SIGN IN",
                  style: TextStyle(color: Colors.white, letterSpacing: 2),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (_) => SignupScreen()));
                },
                child: Text("New Here? Sign Up"))
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
