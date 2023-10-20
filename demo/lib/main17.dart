import 'package:flutter/material.dart';

void main()
{
  runApp(FlutterApp());
}

class FlutterApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Demo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.blue
      ),
      home: HomeScreen(),
    );

  }
}
class HomeScreen extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: const Text("Home Screen"),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        color:Colors.greenAccent,
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text("Hello World", style: TextStyle(color: Colors.white, fontSize: 20),),
        ),

      ),
    );

  }

}