import 'package:flutter/material.dart';
import 'package:demo/main40.dart';

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
      home: SplashScreen(),
    );
  }
}

class WelcomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => HomePage();
}
class HomePage extends State<StatefulWidget>
{
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child:InkWell(
          onTap: () {},
          child: RichText(
            text: TextSpan(
              style: TextStyle(color: Colors.grey, fontSize: 28,
                  fontFamily: "RobotoSlab"),
              children: [
                TextSpan(text: "Go To "),
                TextSpan(text: "Welcome Page", style: TextStyle(fontSize: 42,
                    color: Colors.lightBlue))
              ]
            ),
          ),
        )
      )
    );
  }

}

