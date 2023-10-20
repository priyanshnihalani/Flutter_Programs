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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightBlue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});



  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(

          backgroundColor: Theme
              .of(context)
              .colorScheme
              .inversePrimary,

          title: const Text("Flutter Containers"),

        ),
        body:Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child:Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Container(
                  margin: EdgeInsets.only(right: 11),
                  width: 200,
                  height: 150,
                  color:Colors.pinkAccent
              ),
              Container(
                  margin: EdgeInsets.only(right: 11),
                  width: 200,
                  height: 150,
                  color:Colors.lightBlue
              ),
              Container(
                  margin: EdgeInsets.only(right: 11),
                  width: 200,
                  height: 150,
                  color:Colors.amberAccent
              ),
              Container(
                  margin: EdgeInsets.only(right: 11),
                  width: 200,
                  height: 150,
                  color:Colors.brown
              ),
              Container(
                  margin: EdgeInsets.only(right: 11),
                  width: 200,
                  height: 150,
                  color:Colors.orange
              ),
              Container(
                  margin: EdgeInsets.only(right: 11),
                  width: 100,
                  height: 150,
                  color:Colors.greenAccent
              ) ,
              Container(
                  margin: EdgeInsets.only(right: 11),
                  width: 200,
                  height: 150,
                  color:Colors.red
              ),
              Container(
                  margin: EdgeInsets.only(right: 11),
                  width: 200,
                  height: 150,
                  color:Colors.lime
              ),

            ],
          )
    ),
        ));
  }
}
