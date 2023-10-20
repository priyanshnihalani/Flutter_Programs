import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: Dpage(),
    );
  }
}

class Dpage extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => HomePage();
}
class HomePage extends State<StatefulWidget>
{
  var arrInd  = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("ClipRRect"),
        centerTitle: true,
      ),
      body:Center(
          child: ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset("assets/images/leo.jpg", width: 300,
              height: 300))
        ),
    );
  }
}


