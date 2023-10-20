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
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Constraints"),
        centerTitle: true,
      ),
      body: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: 200,
            maxWidth: 200,
            minWidth: 50,
            minHeight: 50,

          ),
          child: Text("Hello WorldHello WorldHello WorldHello WorldHello World"
              "Hello WorldHello WorldHello WorldHello WorldHello WorldHello "
              "WorldHello WorldHello WorldHello ""WorldHello WorldHello "
              "WorldHello WorldHello WorldHello WorldHello WorldHello WorldHello"
              " WorldHello WorldHello WorldHello WorldHello WorldHello World"
          , style: TextStyle(overflow: TextOverflow.ellipsis),)),

    );
  }

}

