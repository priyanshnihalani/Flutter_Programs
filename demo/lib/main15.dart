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
          width: double.infinity,
          height: double.infinity,
          color:Colors.blue.shade100,
          child: Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.blueGrey,
                //borderRadius: BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  width:1,
                  color: Colors.black
                ),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 50,
                    color: Colors.white,
                    spreadRadius: 5,
                    blurStyle: BlurStyle.inner
                  )
                ],
                shape: BoxShape.circle
              ),
            ),
          ),
        ),
    );
  }

}