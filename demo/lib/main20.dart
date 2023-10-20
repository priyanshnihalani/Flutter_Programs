import 'package:flutter/material.dart';

void main()
{
  runApp(Demo());
}

class Demo extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "DemoApp",
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primarySwatch:Colors.lightGreen
      ),
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("Custom Fonts", style: TextStyle(color: Colors.white,
            fontFamily:"Times New Roman" )),
        centerTitle: true,

      ),
      body: Text("Hello World", style: TextStyle(fontFamily: "RobotoSlab",
          fontSize:28 )),
    );
  }
}