import 'package:flutter/material.dart';

void main()
{
  runApp(HomeScreen());
}
class HomeScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "StateFull Widget",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch:Colors.lightBlue
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => Home();
}
class Home extends State<HomePage>{
  var c1 = TextEditingController();
  var c2 = TextEditingController();
  var calculate = "";
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar:AppBar(
        title: Text("Statefull Widget", style: TextStyle(color: Colors.white)),
        centerTitle: true,
      ),
      body: Center(

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller:c1,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        width: 2
                      )
                    )
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller:c2,
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 2
                          )
                      )
                  ),
                ),
              ),
              SizedBox(height: 30),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(onPressed: (){
                      var n1 = int.parse(c1.text);
                      var n2 = int.parse(c2.text);
                      var sum = n1 + n2;
                      setState(() {
                        calculate = "$sum";
                      });
                    }, child: Text("ADD")),
                    SizedBox(width: 30),
                    ElevatedButton(onPressed: (){
                      var n1 = int.parse(c1.text);
                      var n2 = int.parse(c2.text);
                      var sub = n1 - n2;
                      setState(() {
                        calculate = "$sub";
                      });
                    }, child: Text("SUBSTRACT")),
                    SizedBox(width: 30),
                    ElevatedButton(onPressed: (){
                      var n1 = int.parse(c1.text);
                      var n2 = int.parse(c2.text);
                      var multiply = n1 * n2;
                      setState(() {
                        calculate = "$multiply";
                      });
                    }, child: Text("MULTIPLY")),
                    SizedBox(width: 30),
                    ElevatedButton(onPressed: (){
                      var n1 = int.parse(c1.text);
                      var n2 = int.parse(c2.text);
                      var divide = n1 / n2;
                      setState(() {
                        calculate = "$divide";
                      });
                    }, child: Text("DIVISION")),
                    SizedBox(width: 30),
                    ElevatedButton(onPressed: (){
                      var n1 = double.parse(c1.text);
                      var n2 = double.parse(c2.text);
                      var modul = n1 % n2;
                      setState(() {
                        calculate = "$modul";
                      });
                    }, child: Text("MODULUS")),
                  ],
                ),
              SizedBox(height: 30),
              Text("Answer is:  ${calculate}")
            ],
          ),
        
        ),
    );
  }
}