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
  bool flag = true;
  var _opacity = 1.0;
  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Foo Animation"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(opacity: _opacity, duration: Duration(seconds: 5)
            , curve: Curves.easeIn, child:Container(
                width: 300,
                height: 300,
                color: Colors.indigoAccent,
              ),),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){
              if(flag)
                {
                  _opacity = 0.1;
                  flag = false;
                }
              else{
                _opacity = 1.0;
                flag = true;
              }
              setState(() {

              });
            }, child: Icon(Icons.animation))

          ],
        ),
      )
    );
  }
}


