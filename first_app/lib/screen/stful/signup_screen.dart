// sign up = register :you create account for the first time
// login = sign in : you already have account

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:form_field_validator/form_field_validator.dart';

import '../../widget/common_textfield_widget.dart';

class SignupScreen extends StatefulWidget {
  @override
  State createState() {
    return _SignupScreen();
  }
}

class _SignupScreen extends State {
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

  signUp() async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
              email: emailController.text, password: passwordController.text);

      print(credential.toString());

      Fluttertoast.showToast(
          msg: "Signed Up successfully!. You can sign in now.");
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
      appBar: AppBar(title: Text("Sign Up")),
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
              // maxLines: 1,
              obscureText: true,
              validator: MultiValidator([
                RequiredValidator(errorText: 'password is required'),
                MinLengthValidator(8,
                    errorText: 'password must be at least 6 digits long'),
              ]),
            ),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: MaterialButton(
                minWidth: double.infinity,
                onPressed: () async {
                  FocusScope.of(context).unfocus();

                  if (formKey.currentState != null) {
                    formKey.currentState!.save();

                    bool isValid = formKey.currentState!.validate();

                    if (isValid) {
                      print("this is valid");
                      signUp();
                    }
                  }
                },
                color: Colors.blue,
                child: Text(
                  "SIGN UP",
                  style: TextStyle(color: Colors.white, letterSpacing: 2),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Text("Already have an account? Sign In"))
          ],
        ),
      ),
    );
  }
}
