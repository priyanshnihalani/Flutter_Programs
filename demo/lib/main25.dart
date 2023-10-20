import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main()
{
  runApp(Demo());
}

class Demo extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    return MaterialApp(
      title: "Date & Time",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue
      ),
      home: Home(),
    );
  }
}
class Home extends StatefulWidget{
  const Home({super.key});

  @override
  State<Home> createState() => HomeScreen();

}
class HomeScreen extends State<Home>{
  @override
  Widget build(BuildContext context)
  {
    var time = DateTime.now();

    return Scaffold(
        appBar:AppBar(
          title: Text("Date & Time", style: TextStyle(color: Colors.white)),
          centerTitle: true,
        ),
        body:Center(
          child: Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Current Time: ${DateFormat('Hms').format(time)}", style: TextStyle(fontSize: 30)),
                Text("Current Time: ${DateFormat('jms').format(time)}", style: TextStyle(fontSize: 30)),
                Text("Current Time: ${DateFormat('yMMMd').format(time)}", style: TextStyle(fontSize: 30)),
                Text("Current Time: ${DateFormat('EEEE').format(time)}", style: TextStyle(fontSize: 30)),
                Text("Current Time: ${DateFormat('MMMM').format(time)}", style: TextStyle(fontSize: 30)),
                Container(
                  height: 50,
                ),
                ElevatedButton(onPressed: (){
                  setState(() {

                  });
                }, child: Text("Current Time"))

              ],
            ),
          ),
        )
    );
  }
}
