// sign up = register :you create account for the first time
// login = sign in : you already have account

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/screen/stful/signup_screen.dart';
import 'package:first_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../widget/common_textfield_widget.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

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

  signInWithGoogle() async {
    try {
      await GoogleSignIn().signOut();

      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      if (googleUser != null) {
// Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        print(googleAuth.accessToken);
        print(googleAuth.idToken);

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        final creds =
            await FirebaseAuth.instance.signInWithCredential(credential);
        print(creds.toString());
      }
    } catch (e) {
      print(e);
    }
  }

  signInWithFacebook() async {
    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.cancelled) {
      Fluttertoast.showToast(msg: "Login Cancelled");
    }

    if (result.status == LoginStatus.failed) {
      Fluttertoast.showToast(msg: result.message ?? "An error occurred");
    }

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;

      final credential = FacebookAuthProvider.credential(accessToken.token);

      try {
        final res =
            await FirebaseAuth.instance.signInWithCredential(credential);
        print(res.toString());
      } catch (e) {
        print(e);
      }
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
                child: Text("New Here? Sign Up")),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MaterialButton(
                onPressed: signInWithGoogle,
                color: Colors.red,
                child: Row(children: [
                  SvgPicture.asset('assets/icons/google.svg',
                      height: 30, color: Colors.white),
                  SizedBox(width: 20),
                  Text(
                    "Sign in With Google",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ]),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: MaterialButton(
                onPressed: signInWithFacebook,
                color: Color(0xff4267B2),
                child: Row(children: [
                  Image.asset(
                    'assets/icons/facebook.png',
                    height: 30,
                    color: Colors.white,
                  ),
                  SizedBox(width: 20),
                  Text(
                    "Sign in With Favebook",
                    style: TextStyle(color: Colors.white, fontSize: 16),
                  )
                ]),
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
