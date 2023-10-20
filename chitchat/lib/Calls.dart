import 'package:flutter/material.dart';

class Call extends StatelessWidget{
  var calls = 10;

  List<Map<String, dynamic>> clre = [
    {
      'name' : "Ankit",
      'icon': (Icons.call_received),
      'color' : Colors.red
    },
    {
      'name' : "Manish",
      'icon': Icons.call_received,
      'color' : Colors.red
    },
    {
      'name' : "Bhavya",
      'icon': Icons.call_made,
      'color' : Colors.green
    },
    {
      'name' : "Sahil",
      'icon': Icons.call_received,
      'color' : Colors.red
    },
    {
      'name' : "Sumit",
      'icon': Icons.call_made,
      'color' : Colors.green
    },
    {
      'name' : "Jeet",
      'icon': Icons.call_made,
      'color' : Colors.green
    },
    {
      'name' : "Pratik",
      'icon': Icons.call_made,
      'color' : Colors.green
    },
    {
      'name' : "Navin",
      'icon': Icons.call_received,
      'color' : Colors.red
    },
    {
      'name' : "Harsh",
      'icon': Icons.call_received,
      'color' : Colors.red
    },
    {
      'name' : "Dinesh",
      'icon': Icons.call_made,
      'color' : Colors.green
    },
    {
      'name' : "Chetan",
      'icon': Icons.call_received,
      'color' : Colors.red
    },
    {
      'name' : "Nayan",
      'icon': Icons.call_received,
      'color' : Colors.red
    },
    {
      'name' : "Rohit",
      'icon': Icons.call_made,
      'color' : Colors.green
    },

  ];

  @override
  Widget build(BuildContext context) {

    return ListView.builder(
        padding: EdgeInsets.zero,
        itemBuilder: (context, index){
      return ListTile(
        leading: Icon(clre[index]['icon'], color: clre[index]['color'],),
        title: Text(clre[index]['name']),
      );
    }, itemCount: clre.length);

  }

}