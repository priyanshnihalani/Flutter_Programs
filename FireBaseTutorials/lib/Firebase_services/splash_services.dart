import 'dart:async';
import 'package:firebase_tutorials/FireStore/firestore_list_screen.dart';
import 'package:firebase_tutorials/Posts/post_screen.dart';
import 'package:firebase_tutorials/Upload_Image.dart';
import 'package:flutter/material.dart';
import '../login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';


class SplashServices{
  void isLogin(BuildContext context)
  {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if(user!=null){
    Timer(Duration(seconds: 3), () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => UploadImage()));
    });
    }
    else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
      });
      }

  }
}