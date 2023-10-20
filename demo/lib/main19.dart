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
        title: const Text("Circle Avatar"),
      /*  Note:-The key difference is that AssetImage is a class used as an
          image provider for widgets, whereas Image.asset is a widget itself
          that directly displays the image from the asset bundle. You can use
          AssetImage when you need to provide an image provider to a widget,
          and Image.asset when you want to directly display the image in your
          widget tree without any further customization. */
      ),
      body: const CircleAvatar(
        child: Text("Priyansh", style:TextStyle(fontSize: 30,
            color: Colors.white, fontWeight: FontWeight.bold)),
        backgroundImage: AssetImage("assets/images/avatar.png"),
        backgroundColor: Colors.lightBlue,
        maxRadius: 100,
        minRadius: 10,
      )


    );
  }

}