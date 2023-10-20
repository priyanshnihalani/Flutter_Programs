import 'package:flutter/material.dart';
void main(){
  runApp(BBar());
}
class BBar extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Bottom Navigation Bar",
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: NaVbar(),
    );
  }
}
class NaVbar extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => BottomBar();
}
class BottomBar extends State<NaVbar>{
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Bottom Navigation Bar", style: TextStyle(
            color: Colors.white, fontSize: 24, fontWeight: FontWeight.w600)),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          child: Text("Bottom Navigation Bar", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
       currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_filled),
              label: "Home",
              backgroundColor: Colors.lightBlue
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_shopping_cart),
              label: "Cart",
              backgroundColor: Colors.lightBlue
          ),
        ],
        onTap: (index) => setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }
}