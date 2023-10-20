import 'dart:async';
import 'package:chitchat/Login.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'main.dart';


class LoginServices{
  void isLogin(BuildContext context)
  {
    final auth = FirebaseAuth.instance;
    final user = auth.currentUser;

    if(user!=null){
    Timer(Duration(seconds: 3), () {
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
    }
    else {
      Timer(Duration(seconds: 3), () {
        Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
      });
      }

  }
}