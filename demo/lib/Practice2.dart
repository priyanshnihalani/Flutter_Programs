import 'package:flutter/material.dart';

void main()
{
  runApp(DemoApp());
}

class DemoApp extends StatelessWidget{
  @override
  Widget build(BuildContext context)
  {
    const colors = Color(0x655456);
    return MaterialApp(
      title: "Demo App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: HomePage(),
    );
  }
}
class HomePage extends StatelessWidget{
  var arrnames = ["John", "Ram", "Krishna", "Radha", "Daisy", "Rose", "Rudra",
    "Aleena", "Nusrat", "Salman", "Amir"];
  @override
  Widget build(BuildContext context)
  {
    return Scaffold(
      appBar: AppBar(
        title: Text("WhatsApp"),
      ),

      body: ListView.separated(itemBuilder: (context, index){
        return  ListTile(
          leading:CircleAvatar(
            backgroundColor: Colors.greenAccent,
            backgroundImage: AssetImage("assets/images/avatar.png"),
          ),
          title: Text(arrnames[index]),
          subtitle: Text("HI...", style:TextStyle(fontSize: 13)) ,
        );
      },
        itemCount: arrnames.length,
        separatorBuilder: (context, index){
          return const Divider(height: 10, thickness: 3);
        },
      ),
    );
  }
}
