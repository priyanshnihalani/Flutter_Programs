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
              title: Text("Home Screen"),
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                width: 400,
                height: 150,
                color:Colors.lightBlue,
                child: Text("Demo App"),
            ),
          ),
      );
  }

}