import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
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
          child: Text("Google Bottom Navigation Bar", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.black.withAlpha(1200),
        ),
        child: GNav(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          // backgroundColor: Colors.black,
          tabBackgroundColor: Colors.grey.shade800,
          padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 12),
          gap: 11,
          tabs: [
            GButton(icon: Icons.home_filled, text: "Home", iconColor: Colors.white, iconActiveColor: Colors.grey, textColor: Colors.white, activeBorder:Border.all(color: Colors.white70)),
            GButton(icon: Icons.camera_front, text: "Reel",iconColor: Colors.white,iconActiveColor: Colors.grey, textColor: Colors.white, activeBorder:Border.all(color: Colors.white70)),
            GButton(icon: Icons.search, text: "Search",iconColor: Colors.white, iconActiveColor: Colors.grey, textColor: Colors.white, activeBorder:Border.all(color: Colors.white70)),
            GButton(icon: Icons.settings, text:"Setting", iconColor: Colors.white, iconActiveColor: Colors.grey, textColor: Colors.white, activeBorder:Border.all(color: Colors.white70)),
          ],
        ),
      ),
    );
  }
}