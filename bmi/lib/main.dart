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
      debugShowCheckedModeBanner:false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  var inch = TextEditingController();
  var feet = TextEditingController();
  var weight = TextEditingController();
  var result = "";
  var msg = "";
  var txtcolor = TextStyle(color: Colors.black, fontFamily: "RobotoSlab"
  , fontSize: 22);
  var bgcolor = Colors.white;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("B M I", style: TextStyle(fontFamily: "RobotoSlab",
            color: Colors.white, fontSize: 38, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Center(
          child: Container(
            margin: EdgeInsets.only(top: 50),
            width: 400,
            color: bgcolor,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(top: 50),
                  // color: Colors.cyan,
                  child: Text("Calculate BMI", style: TextStyle(fontSize: 30,
                      fontFamily: "RobotoSlab")),
                ),
                SizedBox(height: 30,),
                Container(
                    padding: EdgeInsets.only(top: 50),
                    width:300,
                    child: TextField(
                      controller: weight,
                      decoration: InputDecoration(
                          label: Text("Enter Your Weight"),
                          border: OutlineInputBorder()
                      ),
                    )),
                SizedBox(height: 30),
                Container(
                    width:300,
                    child: TextField(
                      controller: inch,
                      decoration: InputDecoration(
                        label: Text("Enter Your Height in Inches"),
                        border: OutlineInputBorder()
                      ),
                      onTap: () => feet.clear(),

                    )),
                SizedBox(height: 30),
                SizedBox(height: 30, child: Text("OR", style: TextStyle(fontSize: 22),)),
                SizedBox(height: 30),
                Container(
                    width:300,
                    child: TextField(
                      controller: feet,
                      decoration: InputDecoration(
                          label: Text("Enter Your Height in Feet"),
                          border: OutlineInputBorder(),
                      ),
                      onTap: () => inch.clear(),
                    )),
                SizedBox(height: 30),
                ElevatedButton(onPressed: (){
                    var w = weight.text;
                    var i = inch.text;
                    var f = feet.text;

                    if(w!="" && i!="")
                      {
                        // BMI Calculation
                        var intw = double.parse(w);
                        var inti = double.parse(i);
                        var hinch = inti / 39.37;
                        var bmi = intw/(hinch*hinch);

                        setState(() {
                          result = "Your BMI is : ${bmi.toStringAsFixed(2)}";
                        });
                      }
                    else if(w!="" && f!="")
                      {
                        var intw = double.parse(w);
                        var intf = double.parse(f);
                        var hfeet = intf * 0.304;
                        var bmi = intw/(hfeet*hfeet);

                        if(bmi<18.5)
                          {
                             msg = "You are UnderWeight";
                             txtcolor = TextStyle(color: Colors.redAccent);
                          }
                        else if(bmi>18.5 && bmi<24.9)
                          {
                            msg = "You are HealthyWeight";
                            txtcolor = TextStyle(color: Colors.green);
                          }
                        else if(bmi>25.0 && bmi<29.9)
                          {
                            msg = "You are OverWeighy";
                            txtcolor = TextStyle(color: Colors.yellow);
                          }
                        else{
                          msg = "You are Obses";
                          txtcolor = TextStyle(color: Colors.redAccent);
                        }
                        setState(() {
                          result = "Your BMI is ${bmi.toStringAsFixed(2)}";
                        });
                      }
                    else
                      {
                         setState(() {
                           result = "Please fill required fields";
                         });
                      }

                  }, child: Text("Calculate", style: TextStyle(color: Colors.white))),
                SizedBox(height: 30),
                Text(result, style: TextStyle(fontSize: 24, fontFamily: "RobotoSlab")),
                SizedBox(height: 30),
                Text(msg, style:txtcolor)
              ],
            ),
          ),
        ),
      )
    );
  }
}
