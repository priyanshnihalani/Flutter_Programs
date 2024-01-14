import 'package:firebase_tutorial/PostScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_button/sign_button.dart';

class GoogleAuth extends StatefulWidget {
  const GoogleAuth({super.key});

  @override
  State<GoogleAuth> createState() => _GoogleAuthState();
}

class _GoogleAuthState extends State<GoogleAuth> {

  FirebaseAuth auth = FirebaseAuth.instance;
  void googleAuth(BuildContext context) async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn();
      final GoogleSignInAccount? googleSignInAccount = await googleSignIn
          .signIn();

      if (googleSignInAccount == null) {
        Fluttertoast.showToast(msg: "Sign In is cancelled by user");
        return;
      }
      final GoogleSignInAuthentication googleSignInAuthentication = await googleSignInAccount
          .authentication;
      final AuthCredential authCredential = GoogleAuthProvider.credential(
          idToken: googleSignInAuthentication.idToken,
          accessToken: googleSignInAuthentication.accessToken
      );
      UserCredential userCredential = await auth.signInWithCredential(
          authCredential);
      if (userCredential.user != null) {
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => PostScreen()));
        Fluttertoast.showToast(msg: "Sign Up Successful");
      }
    }
    catch(e)
    {
      Fluttertoast.showToast(msg: e.toString());
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Google Authentication"),
      ),
      body: Center(
        child: Container(
          child: SignInButton(buttonType: ButtonType.google, onPressed: () {
            googleAuth(context);
          },),
        ),
      ),
    );
  }
}
