import 'package:flutter/material.dart';
import 'package:demo/uihelper/ui1.dart';
import 'package:demo/widget/w1.dart';

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

          title: const Text("Rich Text"),

        ),
        body:Center(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 80, color: Colors.grey,
              fontFamily: "RobotoSlab")
            , children: [
              TextSpan(text: "Hello"),
              TextSpan(text: "World", style: TextStyle(fontSize: 100, color: Colors.lightBlue))

            ]),
          ),
        )
    );
  }
}
