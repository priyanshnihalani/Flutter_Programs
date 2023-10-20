import 'package:flutter/material.dart';

class Cards extends StatelessWidget{

  final AssetImage img;
  final String nm;
  final String phone;
  Cards( {required this.img,required this.nm, required this.phone});
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.all(20),
        width: 250,
        height: 350,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [BoxShadow(color: Colors.blueGrey, spreadRadius: 2
        , blurRadius: 2)]
      ),
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.only(top: 50),
            width: 70,
            height: 70,
            child: CircleAvatar(
              backgroundImage: img, //Error may occur.
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Name: ", style: TextStyle(fontSize: 22, fontFamily: "RobotoSlab")),
                Text(nm,  style: TextStyle(fontSize: 20, fontFamily: "RobotoSlab"))
              ],
            ),
          ),
          Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              Text("Phone no: ", style: TextStyle(fontSize: 22, fontFamily: "RobotoSlab"),
              ),
            Text(phone,style: TextStyle(fontSize: 20, fontFamily: "RobotoSlab"))]
          )
        ],
      ),
      ),
    );
  }

}