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

          title: const Text("Custom Widget"),

        ),
        body:Center(child: Container( width:120, child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ButtonStyle1(nm: "Login", styles: style1(), icon: Icon(Icons.forward)),
            Container(height: 20),
              ButtonStyle1(nm: "Login", styles: style1()),
          ],
        )))
    );
  }
}
