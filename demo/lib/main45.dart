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
        title: Text("List Wheel ScrollView"),
        centerTitle: true,
      ),
      body: ListWheelScrollView(
        children: arrInd.map((value) => Container(width: 300,
        height: 200, color: Colors.indigoAccent,
        child: Center(
          child: Text(" $value", style: TextStyle(fontSize: 40, color: Colors.white)
            ,),
        ),)).toList(),
        itemExtent: 150,
      )
    );
  }
}


