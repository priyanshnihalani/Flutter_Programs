import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePage();
}
class HomePage extends State<StatefulWidget>
{
  int count = 0;
  void increment(){
    setState(() {
      count++;
    });
  }
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("State Classes"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text("$count", style: TextStyle(fontSize: 30)),
            ElevatedButton(onPressed: (){
                increment();
              }, child: Text("Increment", style:TextStyle(fontSize: 30),))
          ],
        ),
      ),
    );
  }

}

