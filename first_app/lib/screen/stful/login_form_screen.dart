// sign up = register :you create account for the first time
// login = sign in : you already have account

import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/cubit/auth/auth_cubit.dart';
import 'package:first_app/cubit/auth/auth_state.dart';
import 'package:first_app/cubit/theme/theme_cubit.dart';
import 'package:first_app/screen/dashboard_screen.dart';
import 'package:first_app/screen/insta_post.dart';
import 'package:first_app/screen/stful/signup_screen.dart';
import 'package:first_app/util/functions.dart';
import 'package:first_app/util/shared_pref.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../widget/common_textfield_widget.dart';
import "package:flutter_svg/flutter_svg.dart";
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    final currentTheme = Theme.of(context);
    bool isDarkMode = UtilFunction.isDarkMode(currentTheme);

    context.read<ThemeCubit>().toggleTheme(isDarkMode);

    if (formKey.currentState != null) {
      formKey.currentState!.save();

      bool isValid = formKey.currentState!.validate();

      if (isValid) {
        FocusScope.of(context).unfocus();
        context
            .read<AuthCubit>()
            .login(emailController.text, passwordController.text);
      }
    }
  }

  signInWithGoogle() async {
    context.read<AuthCubit>().signInWithGoogle();
  }

  signInWithFacebook() async {
    context.read<AuthCubit>().signInWithFacebook();
  }

  @override
  Widget build(BuildContext context) {
    final currentTheme = Theme.of(context);

    return Scaffold(
      // backgroundColor: Colors.black,
      appBar: AppBar(title: Text("login")),
      body: SingleChildScrollView(
        child: Form(
          key: formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => IgHomePage()));
              }
            },
            builder: (context, state) {
              print(state);
              return Stack(
                children: [
                  Column(
                    children: [
                      CommonTextField(
                        controller: emailController,
                        label: "Email",
                        validator:
                            EmailValidator(errorText: "Email must be valid"),
                      ),
                      CommonTextField(
                        controller: passwordController,
                        label: "Password",
                        hintText: "Enter your password",
                        obscureText: true,
                        validator: MultiValidator([
                          RequiredValidator(errorText: 'password is required'),
                          MinLengthValidator(8,
                              errorText:
                                  'password must be at least 6 digits long'),
                        ]),
                      ),
                      Text("Forgot Password"),
                      IgnorePointer(
                        ignoring: false,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MaterialButton(
                            minWidth: double.infinity,
                            onPressed: login,
                            color: Colors.blue,
                            child: Text(
                              "SIGN IN",
                              style: TextStyle(
                                  color: Colors.white, letterSpacing: 2),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => SignupScreen()));
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
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
                              style:
                                  TextStyle(color: Colors.white, fontSize: 16),
                            )
                          ]),
                        ),
                      )
                    ],
                  ),
                  if (state is AuthLoading)
                    Container(
                      color: Colors.black.withOpacity(0.6),
                      child: Center(child: CircularProgressIndicator()),
                    )
                ],
              );
            },
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

/// IgnorePointer