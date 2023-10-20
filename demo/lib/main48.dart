import 'package:flutter/material.dart';
void main(){
  runApp(SBar());
}
class SBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Side Navigation Bar",
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: SiVbar(),
    );
  }
}
class SiVbar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => BottomBar();
}
class BottomBar extends State<SiVbar>{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Side Navigation Bar", style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text("Side Navigation Bar", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        ),
      ),
      drawer: Drawer(
        elevation: 8,
        child: ListView(
        children: [
          DrawerHeader(child: Center(child: Text("Drawer", style:TextStyle(fontSize: 30, color: Colors.white))), decoration: BoxDecoration(
            color: Colors.indigo
          ),),
          ListTile(title: Text("Item 1")),
          ListTile(title: Text("Item 2")),
        ],
        ),
      ),
    );
  }
}