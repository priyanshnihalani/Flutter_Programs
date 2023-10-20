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
      body: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
         Expanded(
           flex: 2,
           child:Container(
            width: 50,
            height: 100,
            color: Colors.blueGrey,
         ),),
          Expanded(
            flex: 4,
            child: Container(
              width:50,
              height: 100,
              color:Colors.deepOrangeAccent
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              width: 50,
              height: 100,
              color:Colors.greenAccent
            ),
          ),
          Expanded(
              flex: 1,
              child:Container(
              width: 50,
              height: 100,
              color: Colors.brown,
          ) ),

        ],
      ),
          );
  }

}