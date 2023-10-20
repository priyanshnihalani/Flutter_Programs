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
    RangeValues values = RangeValues(0, 1);
  @override
   Widget build(BuildContext context) {
    RangeLabels labels = RangeLabels(values.start.toString(), values.end.toString());
    return Scaffold(
      appBar:AppBar(
        title: Text("Home Page"),
        centerTitle: true,
      ),
      body: Center(
        child: RangeSlider(
          values: values,
          labels: labels,
          divisions: 100,
          min: 0,
          max: 100,
          // divisions: labels,
          onChanged: (newValue){
            values = newValue;
            setState(() {

            });
          },
        )
      )
    );
  }
}


