import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {


  // This widget is the root of your application.
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
  var tranfers = TextEditingController();

  @override
   Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                width:300,
                child: TextField(
                controller: tranfers,
                )),
            SizedBox(height: 30),
            ElevatedButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return Tranfer(tranfers.text.toString());
                  }));
              }, child: Text("Tranfer Data"))
          ],
        ),
      )
    );
  }
}
class Tranfer extends StatefulWidget{
  var data;
  Tranfer(this.data);

  @override
  State<Tranfer> createState() => _TranferState();
}

class _TranferState extends State<Tranfer> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Received Data"),
      ),
      body: Center(
        child: Text("Received Data is: ${widget.data}"),
      ),
    );
  }
}

