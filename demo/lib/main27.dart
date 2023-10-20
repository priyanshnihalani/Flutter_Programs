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
      title: "Date & Time",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.lightBlue
      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => HomeScreen();

}
class HomeScreen extends State<Home>{
  @override
  Widget build(BuildContext context)
  {

    return Scaffold(
        appBar:AppBar(
          title: Text("Grid View", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body:Container(
          padding: EdgeInsets.all(10),
          child: Center(
            child: GridView.count(crossAxisCount: 4,crossAxisSpacing: 20,
              mainAxisSpacing: 20,
              children: [
                Container(color: Colors.lightGreen),
                Container(color: Colors.orange),
                Container(color: Colors.yellow),
                Container(color: Colors.grey),
                Container(color: Colors.deepPurple),
                Container(color: Colors.lime),

              ],)
          ),
        )
    );
  }
}
