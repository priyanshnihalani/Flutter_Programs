import 'dart:async';
import 'package:flutter/Material.dart';
import 'package:demo/main39.dart';

class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
        return IntroPage();
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.indigoAccent,
        child: Center(
          child: Text("Splash Screen", style: TextStyle(fontSize: 42,
              fontFamily: "RobotoSlab", color: Colors.white),)
        ),
      ),
    );
  }
}