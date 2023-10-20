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
  var widths = 200.0;
  var heights = 200.0;
  bool flag = true;

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
            AnimatedContainer(
              duration: Duration(seconds: 2),
              width: widths,
              height: heights,
              curve: Curves.slowMiddle,
              //Note : "In" means starting of animaiton, "Out" means stoping animation.
              color: Colors.indigoAccent,
            ),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){
              if(flag)
                {
                  widths = 300;
                  heights = 300;
                  flag = false;
                }
              else{
                  widths = 200;
                  heights = 200;
                  flag = true;
              }
              setState(() {});
              }, child: Text("Animate"))
          ],
        ),
      )
    );
  }
}


