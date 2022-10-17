import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:first_app/util/shared_pref.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  login(String email, String password) async {
    emit(AuthLoading(loadingMessage: "Verifying your credentials"));

    try {
      final credential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);

      print(credential.toString());

      final currentUser = FirebaseAuth.instance.currentUser;

      if (currentUser != null && currentUser.emailVerified == false) {
        await FirebaseAuth.instance.currentUser!.sendEmailVerification();
      }

      Fluttertoast.showToast(msg: "Sign in successful");

      SharedPref.setUserLoggedIn(true);

      emit(AuthSuccess(user: currentUser));
    } on FirebaseAuthException catch (e, s) {
      print(e);
      print(s);

      final eMessage = e.message ?? "An error occurred";
      Fluttertoast.showToast(msg: eMessage);

      emit(AuthError(errorMessage: eMessage));
    } catch (e, s) {
      print(e);
      print(s);
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  signInWithGoogle() async {
    emit(AuthLoading(loadingMessage: ""));

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
        emit(AuthSuccess(user: creds));
      }
    } catch (e) {
      print(e);
      emit(AuthError(errorMessage: e.toString()));
    }
  }

  signInWithFacebook() async {
    emit(AuthLoading(loadingMessage: ""));

    final result = await FacebookAuth.instance.login();

    if (result.status == LoginStatus.cancelled) {
      Fluttertoast.showToast(msg: "Login Cancelled");
      emit(AuthError(errorMessage: "Login cancelled"));
    }

    if (result.status == LoginStatus.failed) {
      Fluttertoast.showToast(msg: result.message ?? "An error occurred");
      emit(AuthError(errorMessage: result.message ?? "An error occurred"));
    }

    if (result.status == LoginStatus.success) {
      final AccessToken accessToken = result.accessToken!;

      final credential = FacebookAuthProvider.credential(accessToken.token);

      try {
        final res =
            await FirebaseAuth.instance.signInWithCredential(credential);
        print(res.toString());
        emit(AuthSuccess(user: res));
      } catch (e) {
        print(e);
      }
    }
  }
}
