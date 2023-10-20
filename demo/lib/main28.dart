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
      title: "Grid View 2",
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
    var arrColor = [Colors.pink, Colors.lime, Colors.yellow, Colors.deepPurple,
    Colors.orange, Colors.indigoAccent];
    return Scaffold(
        appBar:AppBar(
          title: Text("Grid View", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body: GridView.builder(itemBuilder: (context, index) {
          return Container(color: arrColor[index]);
        }, itemCount: arrColor.length, gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20
        )
  )
    );
  }
}
