import 'package:flutter/material.dart';
import 'package:demo/uihelper/ui1.dart';

void main()
{
  runApp(Demo());
}

class Demo extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: 'Demo Application',
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
      ),
      home:HomeScreen()
    );
  }
}

class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Card Widget", style: style1()!.copyWith(color: Colors.white)) ,
        centerTitle:true,
      ),
      body: Center(
        child: Container(
          width: 200,
          height: 50,
          child: const Card(
            shadowColor: Colors.lightBlue,
            elevation: 12,
            child: Center(child: Text("Hello World", style: TextStyle(fontSize: 20, fontFamily: "RobotoSlab"))),
          ),
        ),
      ),
    );
  }
}